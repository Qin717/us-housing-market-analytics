-- ============================================================================
-- Q3: Housing Supply Shortage Impact on Fastest- and Slowest-Growing 
--     U.S. Markets (2018–2025)
-- ============================================================================
-- How do housing supply shortages influence home prices and rents in the 
-- fastest- and slowest-growing U.S. markets (2018–2025)?
-- 
-- Combines data from:
--   - Project 01: Home Value Index (home_value_yoy_growth)
--   - Project 02: Rent Value Index (q1_state_avg_rent_yearly_clean)
--   - Project 03: For Sale Listings/Inventory (q2_yoy_growth_listings_state_yearly)

DROP TABLE IF EXISTS q3_supply_shortage_impact_on_prices_rents;

CREATE TABLE q3_supply_shortage_impact_on_prices_rents AS
-- Step 1: Calculate average YoY growth for each state (2018–2025)
WITH 
-- Calculate rent YoY growth from rent values
rent_yoy_growth AS (
    SELECT
        UPPER(TRIM(state)) AS statename,
        year,
        REPLACE(state_avg_rent, '"', '')::NUMERIC AS avg_rent_value,
        ROUND(
            ((REPLACE(state_avg_rent, '"', '')::NUMERIC - 
              LAG(REPLACE(state_avg_rent, '"', '')::NUMERIC) OVER (PARTITION BY UPPER(TRIM(state)) ORDER BY year)) /
             NULLIF(LAG(REPLACE(state_avg_rent, '"', '')::NUMERIC) OVER (PARTITION BY UPPER(TRIM(state)) ORDER BY year), 0) * 100),
            2
        ) AS rent_yoy_growth
    FROM q1_state_avg_rent_yearly_clean
    WHERE year BETWEEN 2018 AND 2025
      AND state IS NOT NULL
),
avg_metrics AS (
    SELECT
        h.statename,
        ROUND(AVG(REPLACE(h.yoy_growth_percent, '%', '')::NUMERIC), 2) AS avg_home_growth,
        ROUND(AVG(r.rent_yoy_growth), 2) AS avg_rent_growth,
        ROUND(AVG(REPLACE(i.yoy_growth_percent, '%', '')::NUMERIC), 2) AS avg_inventory_growth
    FROM home_value_yoy_growth h
    JOIN rent_yoy_growth r ON h.statename = r.statename AND h.year = r.year
    JOIN q2_yoy_growth_listings_state_yearly i ON h.statename = i.statename AND h.year = i.year
    WHERE h.year BETWEEN 2018 AND 2025
      AND REPLACE(h.yoy_growth_percent, '%', '')::NUMERIC IS NOT NULL
      AND r.rent_yoy_growth IS NOT NULL
      AND REPLACE(i.yoy_growth_percent, '%', '')::NUMERIC IS NOT NULL
    GROUP BY h.statename
),
-- Step 2: Rank states by home value growth
ranked AS (
    SELECT
        statename,
        avg_home_growth,
        avg_rent_growth,
        avg_inventory_growth,
        RANK() OVER (ORDER BY avg_home_growth DESC) AS rank_high,
        RANK() OVER (ORDER BY avg_home_growth ASC) AS rank_low
    FROM avg_metrics
)
-- Step 3: Select Top 5 and Bottom 5 states
SELECT *
FROM ranked
WHERE rank_high <= 5 OR rank_low <= 5
ORDER BY avg_home_growth DESC;
