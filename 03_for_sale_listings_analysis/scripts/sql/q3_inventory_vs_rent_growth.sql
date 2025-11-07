-- ============================================================================
-- Q6: Correlation Between Inventory and Rent Growth (2018–2025)
-- ============================================================================
-- Calculate correlation between inventory growth percentage and 
-- rent growth percentage across all states from 2018 to 2025
--
-- Note: This query uses:
--       - CSV file: avg_for_sale_listings_state_yearly.csv
--       - CSV file: q1_state_avg_rent_yearly_clean.csv

WITH inventory_growth AS (
    SELECT 
        UPPER(TRIM(StateName)) AS state,
        ((MAX(avg_inventory) - MIN(avg_inventory)) / NULLIF(MIN(avg_inventory), 0)) * 100 AS inventory_growth_pct
    FROM avg_for_sale_listings_state_yearly
    WHERE year IN (2018, 2025)
    GROUP BY UPPER(TRIM(StateName))
),
rent_growth AS (
    SELECT 
        UPPER(TRIM(state)) AS state,
        ((MAX(state_avg_rent::NUMERIC) - MIN(state_avg_rent::NUMERIC)) / NULLIF(MIN(state_avg_rent::NUMERIC), 0)) * 100 AS rent_growth_pct
    FROM q1_state_avg_rent_yearly_clean
    WHERE year IN (2018, 2025)
    GROUP BY UPPER(TRIM(state))
),
state_growth_data AS (
    SELECT 
        i.state,
        ROUND(i.inventory_growth_pct, 2) AS inventory_growth_pct,
        ROUND(r.rent_growth_pct, 2) AS rent_growth_pct
    FROM inventory_growth i
    JOIN rent_growth r 
      ON i.state = r.state
),
correlation AS (
    SELECT 
        ROUND(CORR(inventory_growth_pct, rent_growth_pct), 3) AS correlation_coef
    FROM state_growth_data
)
SELECT 
    state,
    inventory_growth_pct,
    rent_growth_pct,
    (SELECT correlation_coef FROM correlation) AS correlation_coef
FROM state_growth_data
ORDER BY inventory_growth_pct DESC;
