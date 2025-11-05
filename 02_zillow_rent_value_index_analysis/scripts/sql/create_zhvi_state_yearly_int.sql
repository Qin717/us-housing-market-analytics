-- Create zhvi_state_yearly_int table (state-level home value data)
-- This table aggregates home value data by state and year from region-level data
-- Column names match the Q7 query: state_name, avg_home_value, year

CREATE TABLE zhvi_state_yearly_int AS
SELECT
    UPPER(TRIM(statename)) AS state_name,
    year,
    ROUND(AVG(yearlyindex), 2) AS avg_home_value
FROM home_values_yearly_clean
WHERE statename IS NOT NULL
GROUP BY UPPER(TRIM(statename)), year
ORDER BY state_name, year;

