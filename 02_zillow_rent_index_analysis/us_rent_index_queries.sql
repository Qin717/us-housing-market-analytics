-- SQL queries for Zillow Rent Index Analysis

CREATE TABLE state_year_avg_rent AS
WITH unpivoted AS (
    SELECT
        statename AS state,
        LEFT(key, 4)::INT AS year,
        value::NUMERIC AS rent_value
    FROM us_rent_index
    CROSS JOIN LATERAL jsonb_each_text(
        to_jsonb(us_rent_index)
        - 'regionid' - 'sizerank' - 'regionname' - 'regiontype' - 'statename'
    )
    WHERE key ~ '^[0-9]{4}_[0-9]{2}_[0-9]{2}$'
      AND value IS NOT NULL
)
SELECT
    state,
    year,
    ROUND(AVG(rent_value), 2) AS yearly_avg_rent
FROM unpivoted
WHERE state IS NOT NULL
GROUP BY state, year
ORDER BY state, year;
