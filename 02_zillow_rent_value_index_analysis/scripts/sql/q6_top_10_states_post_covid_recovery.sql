-- Q6: States with the Strongest Rent Recovery Post-COVID (2020–2023)
WITH rent_2020 AS (
  SELECT
    state,
    AVG(yearly_avg_rent) AS rent_2020
  FROM state_year_avg_rent
  WHERE year = 2020
  GROUP BY state
),
rent_2023 AS (
  SELECT
    state,
    AVG(yearly_avg_rent) AS rent_2023
  FROM state_year_avg_rent
  WHERE year = 2023
  GROUP BY state
)
SELECT
  r23.state,
  ROUND(((r23.rent_2023 - r20.rent_2020) / r20.rent_2020) * 100, 2) AS recovery_growth_pct
FROM rent_2020 r20
JOIN rent_2023 r23 ON r20.state = r23.state
ORDER BY recovery_growth_pct DESC
LIMIT 10;
