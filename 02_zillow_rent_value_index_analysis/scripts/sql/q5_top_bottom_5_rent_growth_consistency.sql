-- Q5: Top & Bottom States by Rent Growth Consistency (2015–2025)
WITH yoy_growth AS (
  SELECT
    state,
    year,
    (yearly_avg_rent - LAG(yearly_avg_rent) OVER (PARTITION BY state ORDER BY year))
      / NULLIF(LAG(yearly_avg_rent) OVER (PARTITION BY state ORDER BY year), 0) * 100 AS yoy_growth_pct
  FROM state_year_avg_rent
  WHERE yearly_avg_rent IS NOT NULL
),
state_consistency AS (
  SELECT
    state,
    AVG(yoy_growth_pct) AS avg_growth_pct,
    STDDEV_POP(yoy_growth_pct) AS rent_volatility,
    AVG(yoy_growth_pct) / NULLIF(STDDEV_POP(yoy_growth_pct), 0) AS consistency_index
  FROM yoy_growth
  WHERE yoy_growth_pct IS NOT NULL
  GROUP BY state
)
(
  SELECT
    state,
    ROUND(avg_growth_pct, 3) AS avg_growth_pct,
    ROUND(rent_volatility, 3) AS rent_volatility,
    ROUND(consistency_index, 3) AS consistency_index,
    CONCAT(ROUND(avg_growth_pct, 2), '%') AS avg_growth_pct_formatted,
    CONCAT(ROUND(rent_volatility, 2), '%') AS rent_volatility_formatted
  FROM state_consistency
  ORDER BY consistency_index DESC
  LIMIT 5
)
UNION ALL
(
  SELECT
    state,
    ROUND(avg_growth_pct, 3) AS avg_growth_pct,
    ROUND(rent_volatility, 3) AS rent_volatility,
    ROUND(consistency_index, 3) AS consistency_index,
    CONCAT(ROUND(avg_growth_pct, 2), '%') AS avg_growth_pct_formatted,
    CONCAT(ROUND(rent_volatility, 2), '%') AS rent_volatility_formatted
  FROM state_consistency
  ORDER BY consistency_index ASC
  LIMIT 5
)
ORDER BY consistency_index DESC;
