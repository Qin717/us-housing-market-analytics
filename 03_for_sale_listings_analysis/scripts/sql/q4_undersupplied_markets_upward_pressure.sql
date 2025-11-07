-- ============================================================================
-- Q4: Which markets (states) remain undersupplied and might see continued upward pressure?
-- ============================================================================
-- Identify undersupplied markets with continued upward price pressure
-- by analyzing listings YoY growth vs home value YoY growth in 2024
--
-- Note: This query uses:
--       - avg_for_sale_listings_state_yearly_int (listings data)
--       - home_values_yearly_clean (home value data)

WITH listings AS (
    SELECT
        statename,
        year,
        avg_inventory,
        ROUND(
            100.0 * (
                avg_inventory - LAG(avg_inventory) OVER (PARTITION BY statename ORDER BY year)
            ) / NULLIF(LAG(avg_inventory) OVER (PARTITION BY statename ORDER BY year), 0),
            2
        ) AS listings_yoy
    FROM avg_for_sale_listings_state_yearly_int
),
prices AS (
    SELECT
        UPPER(TRIM(statename)) AS state,
        year,
        ROUND(AVG(yearlyindex), 2) AS avg_home_value,
        ROUND(
            100.0 * (
                AVG(yearlyindex) - LAG(AVG(yearlyindex)) OVER (PARTITION BY UPPER(TRIM(statename)) ORDER BY year)
            ) / NULLIF(LAG(AVG(yearlyindex)) OVER (PARTITION BY UPPER(TRIM(statename)) ORDER BY year), 0),
            2
        ) AS price_yoy
    FROM home_values_yearly_clean
    WHERE statename IS NOT NULL
    GROUP BY UPPER(TRIM(statename)), year
),
joined AS (
    SELECT
        l.statename AS state,
        l.year,
        l.listings_yoy,
        p.price_yoy
    FROM listings l
    JOIN prices p
      ON l.statename = p.state AND l.year = p.year
)
SELECT
    state,
    year,
    listings_yoy,
    price_yoy,
    CASE
        WHEN listings_yoy < 0 AND price_yoy > 0 THEN '⚠️ Undersupplied — upward pressure'
        WHEN listings_yoy < 2 AND price_yoy > 5 THEN '⚠️ Slightly undersupplied'
        ELSE 'Stable or recovering'
    END AS market_condition
FROM joined
WHERE year = 2024
ORDER BY price_yoy DESC;

