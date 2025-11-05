-- Q4: Top 5 States with the Most and Least Rent Volatility (2015–2025)
WITH yoy_growth AS (
  SELECT
    state,
    year,
    yearly_avg_rent,
    ROUND(
      (yearly_avg_rent - LAG(yearly_avg_rent) OVER (PARTITION BY state ORDER BY year))
      / LAG(yearly_avg_rent) OVER (PARTITION BY state ORDER BY year) * 100, 2
    ) AS yoy_growth_pct
  FROM state_year_avg_rent
),
volatility AS (
  SELECT
    state,
    ROUND(STDDEV_POP(yoy_growth_pct), 8) AS rent_volatility
  FROM yoy_growth
  WHERE yoy_growth_pct IS NOT NULL
  GROUP BY state
)
(
  SELECT state, rent_volatility
  FROM volatility
  ORDER BY rent_volatility DESC
  LIMIT 5
)
UNION ALL
(
  SELECT state, rent_volatility
  FROM volatility
  ORDER BY rent_volatility ASC
  LIMIT 5
)
ORDER BY rent_volatility DESC;
