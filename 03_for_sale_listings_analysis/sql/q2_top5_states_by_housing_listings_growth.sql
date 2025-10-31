-- ============================================================================
-- Q2: Top 5 States by Housing Listings Growth
-- ============================================================================
-- Calculate growth from earliest year (2018) to latest year (2025)
-- and identify states with highest positive growth

DROP TABLE IF EXISTS q2_top5_states_by_housing_listings_growth;

CREATE TABLE q2_top5_states_by_housing_listings_growth AS
WITH growth AS (
    SELECT
        statename,
        MAX(CASE WHEN year = 2018 THEN avg_inventory END) AS inventory_2018,
        MAX(CASE WHEN year = 2025 THEN avg_inventory END) AS inventory_2025
    FROM avg_for_sale_listings_state_yearly_int
    WHERE statename IS NOT NULL
    GROUP BY statename
)
SELECT
    statename,
    inventory_2018,
    inventory_2025,
    ROUND(((inventory_2025 - inventory_2018) * 100.0 / inventory_2018), 2) AS growth_percent
FROM growth
WHERE inventory_2018 IS NOT NULL
  AND inventory_2025 IS NOT NULL
ORDER BY growth_percent DESC
LIMIT 5;

