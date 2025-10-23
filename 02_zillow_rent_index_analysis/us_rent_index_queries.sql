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
