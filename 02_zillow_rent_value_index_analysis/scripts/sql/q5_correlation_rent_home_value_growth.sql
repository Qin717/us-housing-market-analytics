-- Q5: Correlation Between Rent and Home-Value Growth (2015–2025)
-- Data sources: q1_state_avg_rent_yearly_clean.csv, home_values_yearly_clean.csv
-- Output: State-level growth data + correlation coefficient

WITH rent_growth AS (
    SELECT 
        state,
        ((MAX(state_avg_rent) - MIN(state_avg_rent)) / MIN(state_avg_rent)) * 100 AS rent_growth_pct
    FROM q1_state_avg_rent_yearly_clean
    WHERE year IN (2015, 2025)
    GROUP BY state
),
home_growth AS (
    SELECT 
        UPPER(TRIM(statename)) AS state,
        ((MAX(yearlyindex) - MIN(yearlyindex)) / MIN(yearlyindex)) * 100 AS home_growth_pct
    FROM home_values_yearly_clean
    WHERE statename IS NOT NULL 
      AND year IN (2015, 2025)
    GROUP BY UPPER(TRIM(statename))
),
state_growth_data AS (
    SELECT 
        rent_growth.state,
        ROUND(rent_growth.rent_growth_pct, 2) AS rent_growth_pct,
        ROUND(home_growth.home_growth_pct, 2) AS home_growth_pct
    FROM rent_growth
    JOIN home_growth ON rent_growth.state = home_growth.state
),
correlation AS (
    SELECT 
        ROUND(CORR(rent_growth_pct, home_growth_pct), 3) AS correlation_coef
    FROM state_growth_data
)
SELECT 
    state,
    rent_growth_pct,
    home_growth_pct,
    (SELECT correlation_coef FROM correlation) AS correlation_coef
FROM state_growth_data
ORDER BY rent_growth_pct DESC;

