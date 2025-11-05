-- Create zori_state_yearly_int table (state-level rent data)
-- This table aggregates rent data by state and year
-- Column names match the Q7 query: state_name, avg_rent_value, year

CREATE TABLE zori_state_yearly_int AS
SELECT
    state AS state_name,
    year,
    yearly_avg_rent AS avg_rent_value
FROM state_year_avg_rent
ORDER BY state_name, year;

-- Alternatively, if starting from raw data:
-- CREATE TABLE zori_state_yearly_int AS
-- WITH unpivoted AS (
--     SELECT
--         statename AS state_name,
--         LEFT(key, 4)::INT AS year,
--         value::NUMERIC AS avg_rent_value
--     FROM us_rent_index
--     CROSS JOIN LATERAL jsonb_each_text(
--         to_jsonb(us_rent_index)
--         - 'regionid' - 'sizerank' - 'regionname' - 'regiontype' - 'statename'
--     )
--     WHERE key ~ '^[0-9]{4}_[0-9]{2}_[0-9]{2}$'
--       AND value IS NOT NULL
-- )
-- SELECT
--     state_name,
--     year,
--     ROUND(AVG(avg_rent_value), 2) AS avg_rent_value
-- FROM unpivoted
-- WHERE state_name IS NOT NULL
-- GROUP BY state_name, year
-- ORDER BY state_name, year;

