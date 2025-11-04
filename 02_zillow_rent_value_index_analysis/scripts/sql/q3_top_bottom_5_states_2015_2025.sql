-- Q3: States with Highest and Lowest Rent Growth from 2015 to 2025
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
