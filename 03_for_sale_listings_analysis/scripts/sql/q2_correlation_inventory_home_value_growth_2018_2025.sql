-- ============================================================================
-- Q5: Correlation Between Inventory and Home-Value Growth (2018–2025)
-- ============================================================================
-- Calculate overall correlation between inventory growth percentage and 
-- home value growth percentage across all states from 2018 to 2025
--
-- Note: This query requires the table 'avg_for_sale_listings_state_yearly_int'
--       which is created by running q1_avg_for_sale_listings_state_yearly.sql first
--       The source CSV file is: q1_avg_for_sale_listings_state_yearly.csv

WITH home_value_state_avg AS (
    SELECT
        UPPER(TRIM(statename)) AS state,
        year,
        ROUND(AVG(yearlyindex), 2) AS state_avg_home_value
    FROM home_values_yearly_clean
    WHERE statename IS NOT NULL
      AND year IN (2018, 2025)
    GROUP BY UPPER(TRIM(statename)), year
),
home_value_growth AS (
    SELECT 
        state,
        ((MAX(state_avg_home_value) - MIN(state_avg_home_value)) / NULLIF(MIN(state_avg_home_value), 0)) * 100 AS home_value_growth_pct
    FROM home_value_state_avg
    GROUP BY state
),
inventory_growth AS (
    SELECT 
        statename AS state,
        ((MAX(avg_inventory) - MIN(avg_inventory)) / NULLIF(MIN(avg_inventory), 0)) * 100 AS inventory_growth_pct
    FROM avg_for_sale_listings_state_yearly_int
    WHERE year IN (2018, 2025)
    GROUP BY statename
)
SELECT 
    ig.state,
    ROUND(ig.inventory_growth_pct, 2) AS inventory_growth_pct,
    ROUND(hg.home_value_growth_pct, 2) AS home_value_growth_pct,
    ROUND(CORR(ig.inventory_growth_pct, hg.home_value_growth_pct) OVER (), 3) AS correlation_coef
FROM inventory_growth ig
JOIN home_value_growth hg
  ON ig.state = hg.state
ORDER BY ig.inventory_growth_pct DESC;

