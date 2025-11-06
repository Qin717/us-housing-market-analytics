-- Q2: YoY (Year-over-Year) Growth per State
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
