-- ============================================================================
-- Q5: Which markets (states) remain undersupplied compared to national averages?
-- ============================================================================
-- Identify undersupplied markets with continued upward pressure
-- by comparing state-level listings and price growth against national averages
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
),
-- 🧮 Calculate national averages for each year
national_avg AS (
    SELECT
        year,
        ROUND(AVG(listings_yoy), 2) AS nat_listings_yoy,
        ROUND(AVG(price_yoy), 2)    AS nat_price_yoy
    FROM joined
    GROUP BY year
)
-- 🧩 Compare each state against national averages
SELECT
    j.state,
    j.year,
    j.listings_yoy,
    j.price_yoy,
    n.nat_listings_yoy,
    n.nat_price_yoy,
    CASE
        WHEN j.listings_yoy < n.nat_listings_yoy
             AND j.price_yoy > n.nat_price_yoy
        THEN '⚠️ Undersupplied — upward pressure'
        ELSE 'Stable or recovering'
    END AS market_condition
FROM joined j
JOIN national_avg n
  ON j.year = n.year
WHERE j.year = 2024  -- or most recent year available
ORDER BY j.price_yoy DESC;

