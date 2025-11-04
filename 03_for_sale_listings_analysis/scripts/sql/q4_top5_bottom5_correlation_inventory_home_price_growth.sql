-- ============================================================================
-- Q4: Top 5 and Bottom 5 States by Correlation Between Inventory Growth 
--     and Home-Price Growth (2018–2025)
-- ============================================================================

WITH state_data AS (
    SELECT
        h.statename AS state_name,
        REPLACE(h.yoy_growth_percent, '%', '')::NUMERIC AS home_price_growth,
        REPLACE(i.yoy_growth_percent, '%', '')::NUMERIC AS inventory_growth
    FROM home_value_yoy_growth h
    JOIN q2_yoy_growth_listings_state_yearly i
        ON h.statename = i.statename AND h.year = i.year
    WHERE h.year BETWEEN 2018 AND 2025
      AND REPLACE(h.yoy_growth_percent, '%', '')::NUMERIC IS NOT NULL
      AND REPLACE(i.yoy_growth_percent, '%', '')::NUMERIC IS NOT NULL
),
correlations AS (
    SELECT
        state_name,
        COUNT(*) AS years,
        ROUND(AVG(home_price_growth), 2) AS avg_home_price_growth,
        ROUND(AVG(inventory_growth), 2) AS avg_inventory_growth,
        ROUND(
            (COUNT(*) * SUM(home_price_growth * inventory_growth) - 
             SUM(home_price_growth) * SUM(inventory_growth)) /
            (SQRT(COUNT(*) * SUM(home_price_growth^2) - SUM(home_price_growth)^2) *
             SQRT(COUNT(*) * SUM(inventory_growth^2) - SUM(inventory_growth)^2)),
            4
        ) AS correlation_coefficient
    FROM state_data
    GROUP BY state_name
    HAVING COUNT(*) >= 5
)
(
    -- Top 5 states with highest correlation
    SELECT * FROM correlations
    ORDER BY correlation_coefficient DESC
    LIMIT 5
)
UNION ALL
(
    -- Bottom 5 states with lowest correlation
    SELECT * FROM correlations
    ORDER BY correlation_coefficient ASC
    LIMIT 5
)
ORDER BY correlation_coefficient DESC;
