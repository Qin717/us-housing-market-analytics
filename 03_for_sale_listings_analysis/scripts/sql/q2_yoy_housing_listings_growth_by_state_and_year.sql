-- ============================================================================
-- Q2: YoY Housing Listings Growth by State and Year
-- ============================================================================
-- Calculate year-over-year growth percentage for each state

DROP TABLE IF EXISTS q2_yoy_growth_listings_state_yearly;

CREATE TABLE q2_yoy_growth_listings_state_yearly AS
WITH yoy_calc AS (
    SELECT
        statename,
        year,
        avg_inventory,
        ROUND(
            (avg_inventory::NUMERIC - LAG(avg_inventory::NUMERIC) OVER (PARTITION BY statename ORDER BY year))
            / NULLIF(LAG(avg_inventory::NUMERIC) OVER (PARTITION BY statename ORDER BY year), 0) * 100,
            2
        ) AS yoy_growth_percent
    FROM avg_for_sale_listings_state_yearly_int
)
SELECT
    statename,
    year,
    avg_inventory,
    yoy_growth_percent
FROM yoy_calc
WHERE yoy_growth_percent IS NOT NULL
ORDER BY statename, year;

