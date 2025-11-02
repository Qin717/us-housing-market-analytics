-- ============================================================================
-- Q3: Top 5 States Showing the Largest Gap Between Home-Price Growth 
--     and Rent Growth — and How Inventory Trends Related (2018–2025)
-- ============================================================================

DROP TABLE IF EXISTS q3_largest_gap_home_price_rent_growth_inventory;

CREATE TABLE q3_largest_gap_home_price_rent_growth_inventory AS
SELECT
    h.statename AS state_name,
    ROUND(AVG(REPLACE(h.yoy_growth_percent, '%', '')::NUMERIC), 2) AS avg_home_growth,
    ROUND(AVG(r.yoy_rent_growth), 2) AS avg_rent_growth,
    ROUND(ABS(AVG(REPLACE(h.yoy_growth_percent, '%', '')::NUMERIC) - AVG(r.yoy_rent_growth)), 2) AS growth_divergence
FROM home_value_yoy_growth h
JOIN (
    SELECT
        UPPER(TRIM(state)) AS statename,
        year,
        ROUND(
            (REPLACE(state_avg_rent, '"', '')::NUMERIC - LAG(REPLACE(state_avg_rent, '"', '')::NUMERIC) OVER (PARTITION BY UPPER(TRIM(state)) ORDER BY year)) 
            / NULLIF(LAG(REPLACE(state_avg_rent, '"', '')::NUMERIC) OVER (PARTITION BY UPPER(TRIM(state)) ORDER BY year), 0) * 100, 
        2) AS yoy_rent_growth
    FROM q1_state_avg_rent_yearly_clean
    WHERE year BETWEEN 2018 AND 2025
) r 
    ON h.statename = r.statename AND h.year = r.year
WHERE h.year BETWEEN 2018 AND 2025
  AND REPLACE(h.yoy_growth_percent, '%', '')::NUMERIC IS NOT NULL
  AND r.yoy_rent_growth IS NOT NULL
GROUP BY h.statename
ORDER BY growth_divergence DESC
LIMIT 5;


-- Merge inventory data to see the link
DROP TABLE IF EXISTS q3_largest_gap_home_price_rent_growth_inventory_final;

CREATE TABLE q3_largest_gap_home_price_rent_growth_inventory_final AS
SELECT
    d.state_name,
    d.avg_home_growth,
    d.avg_rent_growth,
    d.growth_divergence,
    ROUND(AVG(i.yoy_inventory_change), 2) AS avg_inventory_change
FROM q3_largest_gap_home_price_rent_growth_inventory d
JOIN (
    SELECT
        statename AS state_name,
        year,
        ROUND(
            100.0 * (avg_inventory::NUMERIC - LAG(avg_inventory::NUMERIC) OVER (PARTITION BY statename ORDER BY year))
            / NULLIF(LAG(avg_inventory::NUMERIC) OVER (PARTITION BY statename ORDER BY year), 0),
            2
        ) AS yoy_inventory_change
    FROM avg_for_sale_listings_state_yearly_int
    WHERE year BETWEEN 2018 AND 2025
) i
ON d.state_name = i.state_name
GROUP BY d.state_name, d.avg_home_growth, d.avg_rent_growth, d.growth_divergence
ORDER BY d.growth_divergence DESC;

