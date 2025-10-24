-- SQL queries for Zillow Rent Index Analysis

-- ============================================================================
-- Q1: Average Rent per State: Yearly Breakdown
-- ============================================================================

CREATE TABLE state_year_avg_rent AS
WITH unpivoted AS (
    SELECT
        statename AS state,
        LEFT(key, 4)::INT AS year,
        value::NUMERIC AS rent_value
    FROM us_rent_index
    CROSS JOIN LATERAL jsonb_each_text(
        to_jsonb(us_rent_index)
        - 'regionid' - 'sizerank' - 'regionname' - 'regiontype' - 'statename'
    )
    WHERE key ~ '^[0-9]{4}_[0-9]{2}_[0-9]{2}$'
      AND value IS NOT NULL
)
SELECT
    state,
    year,
    ROUND(AVG(rent_value), 2) AS yearly_avg_rent
FROM unpivoted
WHERE state IS NOT NULL
GROUP BY state, year
ORDER BY state, year;


-- ============================================================================
-- Q2: YoY (Year-over-Year) Growth per State
-- ============================================================================

CREATE TABLE state_yoy_growth AS
WITH ranked AS (
    SELECT
        state,
        year,
        yearly_avg_rent,
        LAG(yearly_avg_rent) OVER (PARTITION BY state ORDER BY year) AS prev_year_rent
    FROM state_year_avg_rent
)
SELECT
    state,
    year,
    ROUND(((yearly_avg_rent - prev_year_rent) / prev_year_rent) * 100, 2) AS yoy_growth_pct
FROM ranked
WHERE prev_year_rent IS NOT NULL
ORDER BY state, year;

CREATE TABLE state_yoy_growth_wide AS
SELECT *
FROM crosstab(
    $$
    SELECT state, year, yoy_growth_pct
    FROM state_yoy_growth
    ORDER BY state, year
    $$,
    $$ SELECT generate_series(2016, 2025) $$
) AS ct (
    state TEXT,
    "2016" NUMERIC, "2017" NUMERIC, "2018" NUMERIC, "2019" NUMERIC, "2020" NUMERIC,
    "2021" NUMERIC, "2022" NUMERIC, "2023" NUMERIC, "2024" NUMERIC, "2025" NUMERIC
);


-- ============================================================================
-- Q3: Which States had the Highest and Lowest Rent Growth from 2015 to 2025?
-- ============================================================================

-- Calculate total rent growth for each state between 2015 and 2025
WITH growth AS (
    SELECT
        state,
        MIN(CASE WHEN year = 2015 THEN yearly_avg_rent END) AS rent_2015,
        MAX(CASE WHEN year = 2025 THEN yearly_avg_rent END) AS rent_2025
    FROM state_year_avg_rent
    GROUP BY state
),
growth_pct AS (
    SELECT
        state,
        rent_2015,
        rent_2025,
        ROUND(((rent_2025 - rent_2015) / rent_2015) * 100, 2) AS total_growth_pct
    FROM growth
    WHERE rent_2015 IS NOT NULL AND rent_2025 IS NOT NULL
)
-- Show top 5 and bottom 5 states
SELECT *
FROM (
    SELECT * FROM growth_pct ORDER BY total_growth_pct DESC LIMIT 5
) AS top_states
UNION ALL
SELECT *
FROM (
    SELECT * FROM growth_pct ORDER BY total_growth_pct ASC LIMIT 5
) AS bottom_states
ORDER BY total_growth_pct DESC;


-- ============================================================================
-- Q4: Top 5 States with the Most and Least Rent Volatility (2015–2025)
-- ============================================================================

-- Calculate YoY growth for each state
WITH yoy_growth AS (
  SELECT
    state,
    year,
    yearly_avg_rent,
    ROUND(
      (yearly_avg_rent - LAG(yearly_avg_rent) OVER (PARTITION BY state ORDER BY year))
      / LAG(yearly_avg_rent) OVER (PARTITION BY state ORDER BY year) * 100, 2
    ) AS yoy_growth_pct
  FROM state_year_avg_rent
),
-- Calculate volatility (standard deviation) for each state
volatility AS (
  SELECT
    state,
    ROUND(STDDEV_POP(yoy_growth_pct), 2) AS rent_volatility
  FROM yoy_growth
  WHERE yoy_growth_pct IS NOT NULL
  GROUP BY state
)
-- Get top 5 most volatile and top 5 least volatile states
(
  SELECT state, rent_volatility 
  FROM volatility
  ORDER BY rent_volatility DESC
  LIMIT 5
)
UNION ALL
(
  SELECT state, rent_volatility
  FROM volatility
  ORDER BY rent_volatility ASC
  LIMIT 5
)
ORDER BY rent_volatility DESC;
