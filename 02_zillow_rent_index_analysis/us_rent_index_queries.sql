-- ============================================================================
-- SQL Queries for Zillow Rent Index Analysis
-- ============================================================================
-- Data Source: Zillow Rent Index (ZORI) - Monthly Data
-- Time Period: 2015-2025
-- Geography Level: Metropolitan Statistical Areas (MSA) and States
-- ============================================================================

-- ----------------------------------------------------------------------------
-- Query 1: Get Yearly Average Rent Index for Each State
-- ----------------------------------------------------------------------------
-- This query unpivots the monthly rent data and calculates yearly averages
-- grouped by state
-- ----------------------------------------------------------------------------

WITH unpivoted_rent_data AS (
    SELECT 
        regionid,
        regionname,
        regiontype,
        statename,
        -- Unpivot 2015 data
        '2015' AS year, 
        AVG((2015_01_31 + 2015_02_28 + 2015_03_31 + 2015_04_30 + 2015_05_31 + 
             2015_06_30 + 2015_07_31 + 2015_08_31 + 2015_09_30 + 2015_10_31 + 
             2015_11_30 + 2015_12_31) / 12.0) AS avg_rent_index
    FROM rent_index_data
    WHERE statename IS NOT NULL
    GROUP BY regionid, regionname, regiontype, statename
    
    UNION ALL
    
    SELECT 
        regionid, regionname, regiontype, statename,
        '2016' AS year,
        AVG((2016_01_31 + 2016_02_29 + 2016_03_31 + 2016_04_30 + 2016_05_31 + 
             2016_06_30 + 2016_07_31 + 2016_08_31 + 2016_09_30 + 2016_10_31 + 
             2016_11_30 + 2016_12_31) / 12.0) AS avg_rent_index
    FROM rent_index_data
    WHERE statename IS NOT NULL
    GROUP BY regionid, regionname, regiontype, statename
    
    UNION ALL
    
    SELECT 
        regionid, regionname, regiontype, statename,
        '2017' AS year,
        AVG((2017_01_31 + 2017_02_28 + 2017_03_31 + 2017_04_30 + 2017_05_31 + 
             2017_06_30 + 2017_07_31 + 2017_08_31 + 2017_09_30 + 2017_10_31 + 
             2017_11_30 + 2017_12_31) / 12.0) AS avg_rent_index
    FROM rent_index_data
    WHERE statename IS NOT NULL
    GROUP BY regionid, regionname, regiontype, statename
    
    UNION ALL
    
    SELECT 
        regionid, regionname, regiontype, statename,
        '2018' AS year,
        AVG((2018_01_31 + 2018_02_28 + 2018_03_31 + 2018_04_30 + 2018_05_31 + 
             2018_06_30 + 2018_07_31 + 2018_08_31 + 2018_09_30 + 2018_10_31 + 
             2018_11_30 + 2018_12_31) / 12.0) AS avg_rent_index
    FROM rent_index_data
    WHERE statename IS NOT NULL
    GROUP BY regionid, regionname, regiontype, statename
    
    UNION ALL
    
    SELECT 
        regionid, regionname, regiontype, statename,
        '2019' AS year,
        AVG((2019_01_31 + 2019_02_28 + 2019_03_31 + 2019_04_30 + 2019_05_31 + 
             2019_06_30 + 2019_07_31 + 2019_08_31 + 2019_09_30 + 2019_10_31 + 
             2019_11_30 + 2019_12_31) / 12.0) AS avg_rent_index
    FROM rent_index_data
    WHERE statename IS NOT NULL
    GROUP BY regionid, regionname, regiontype, statename
    
    UNION ALL
    
    SELECT 
        regionid, regionname, regiontype, statename,
        '2020' AS year,
        AVG((2020_01_31 + 2020_02_29 + 2020_03_31 + 2020_04_30 + 2020_05_31 + 
             2020_06_30 + 2020_07_31 + 2020_08_31 + 2020_09_30 + 2020_10_31 + 
             2020_11_30 + 2020_12_31) / 12.0) AS avg_rent_index
    FROM rent_index_data
    WHERE statename IS NOT NULL
    GROUP BY regionid, regionname, regiontype, statename
    
    UNION ALL
    
    SELECT 
        regionid, regionname, regiontype, statename,
        '2021' AS year,
        AVG((2021_01_31 + 2021_02_28 + 2021_03_31 + 2021_04_30 + 2021_05_31 + 
             2021_06_30 + 2021_07_31 + 2021_08_31 + 2021_09_30 + 2021_10_31 + 
             2021_11_30 + 2021_12_31) / 12.0) AS avg_rent_index
    FROM rent_index_data
    WHERE statename IS NOT NULL
    GROUP BY regionid, regionname, regiontype, statename
    
    UNION ALL
    
    SELECT 
        regionid, regionname, regiontype, statename,
        '2022' AS year,
        AVG((2022_01_31 + 2022_02_28 + 2022_03_31 + 2022_04_30 + 2022_05_31 + 
             2022_06_30 + 2022_07_31 + 2022_08_31 + 2022_09_30 + 2022_10_31 + 
             2022_11_30 + 2022_12_31) / 12.0) AS avg_rent_index
    FROM rent_index_data
    WHERE statename IS NOT NULL
    GROUP BY regionid, regionname, regiontype, statename
    
    UNION ALL
    
    SELECT 
        regionid, regionname, regiontype, statename,
        '2023' AS year,
        AVG((2023_01_31 + 2023_02_28 + 2023_03_31 + 2023_04_30 + 2023_05_31 + 
             2023_06_30 + 2023_07_31 + 2023_08_31 + 2023_09_30 + 2023_10_31 + 
             2023_11_30 + 2023_12_31) / 12.0) AS avg_rent_index
    FROM rent_index_data
    WHERE statename IS NOT NULL
    GROUP BY regionid, regionname, regiontype, statename
    
    UNION ALL
    
    SELECT 
        regionid, regionname, regiontype, statename,
        '2024' AS year,
        AVG((2024_01_31 + 2024_02_29 + 2024_03_31 + 2024_04_30 + 2024_05_31 + 
             2024_06_30 + 2024_07_31 + 2024_08_31 + 2024_09_30 + 2024_10_31 + 
             2024_11_30 + 2024_12_31) / 12.0) AS avg_rent_index
    FROM rent_index_data
    WHERE statename IS NOT NULL
    GROUP BY regionid, regionname, regiontype, statename
    
    UNION ALL
    
    SELECT 
        regionid, regionname, regiontype, statename,
        '2025' AS year,
        AVG((2025_01_31 + 2025_02_28 + 2025_03_31 + 2025_04_30 + 2025_05_31 + 
             2025_06_30 + 2025_07_31 + 2025_08_31 + 2025_09_30) / 9.0) AS avg_rent_index
    FROM rent_index_data
    WHERE statename IS NOT NULL
    GROUP BY regionid, regionname, regiontype, statename
)

SELECT 
    statename AS state,
    year,
    ROUND(AVG(avg_rent_index), 2) AS yearly_avg_rent_index,
    COUNT(DISTINCT regionid) AS num_regions
FROM unpivoted_rent_data
GROUP BY statename, year
ORDER BY statename, year;


-- ============================================================================
-- Alternative Approach: Using CASE statements for more flexibility
-- ============================================================================

-- This approach allows for easier filtering and aggregation
SELECT 
    statename AS state,
    ROUND(AVG(
        (2015_01_31 + 2015_02_28 + 2015_03_31 + 2015_04_30 + 2015_05_31 + 2015_06_30 +
         2015_07_31 + 2015_08_31 + 2015_09_30 + 2015_10_31 + 2015_11_30 + 2015_12_31) / 12.0
    ), 2) AS avg_rent_2015,
    ROUND(AVG(
        (2016_01_31 + 2016_02_29 + 2016_03_31 + 2016_04_30 + 2016_05_31 + 2016_06_30 +
         2016_07_31 + 2016_08_31 + 2016_09_30 + 2016_10_31 + 2016_11_30 + 2016_12_31) / 12.0
    ), 2) AS avg_rent_2016,
    ROUND(AVG(
        (2017_01_31 + 2017_02_28 + 2017_03_31 + 2017_04_30 + 2017_05_31 + 2017_06_30 +
         2017_07_31 + 2017_08_31 + 2017_09_30 + 2017_10_31 + 2017_11_30 + 2017_12_31) / 12.0
    ), 2) AS avg_rent_2017,
    ROUND(AVG(
        (2018_01_31 + 2018_02_28 + 2018_03_31 + 2018_04_30 + 2018_05_31 + 2018_06_30 +
         2018_07_31 + 2018_08_31 + 2018_09_30 + 2018_10_31 + 2018_11_30 + 2018_12_31) / 12.0
    ), 2) AS avg_rent_2018,
    ROUND(AVG(
        (2019_01_31 + 2019_02_28 + 2019_03_31 + 2019_04_30 + 2019_05_31 + 2019_06_30 +
         2019_07_31 + 2019_08_31 + 2019_09_30 + 2019_10_31 + 2019_11_30 + 2019_12_31) / 12.0
    ), 2) AS avg_rent_2019,
    ROUND(AVG(
        (2020_01_31 + 2020_02_29 + 2020_03_31 + 2020_04_30 + 2020_05_31 + 2020_06_30 +
         2020_07_31 + 2020_08_31 + 2020_09_30 + 2020_10_31 + 2020_11_30 + 2020_12_31) / 12.0
    ), 2) AS avg_rent_2020,
    ROUND(AVG(
        (2021_01_31 + 2021_02_28 + 2021_03_31 + 2021_04_30 + 2021_05_31 + 2021_06_30 +
         2021_07_31 + 2021_08_31 + 2021_09_30 + 2021_10_31 + 2021_11_30 + 2021_12_31) / 12.0
    ), 2) AS avg_rent_2021,
    ROUND(AVG(
        (2022_01_31 + 2022_02_28 + 2022_03_31 + 2022_04_30 + 2022_05_31 + 2022_06_30 +
         2022_07_31 + 2022_08_31 + 2022_09_30 + 2022_10_31 + 2022_11_30 + 2022_12_31) / 12.0
    ), 2) AS avg_rent_2022,
    ROUND(AVG(
        (2023_01_31 + 2023_02_28 + 2023_03_31 + 2023_04_30 + 2023_05_31 + 2023_06_30 +
         2023_07_31 + 2023_08_31 + 2023_09_30 + 2023_10_31 + 2023_11_30 + 2023_12_31) / 12.0
    ), 2) AS avg_rent_2023,
    ROUND(AVG(
        (2024_01_31 + 2024_02_29 + 2024_03_31 + 2024_04_30 + 2024_05_31 + 2024_06_30 +
         2024_07_31 + 2024_08_31 + 2024_09_30 + 2024_10_31 + 2024_11_30 + 2024_12_31) / 12.0
    ), 2) AS avg_rent_2024,
    ROUND(AVG(
        (2025_01_31 + 2025_02_28 + 2025_03_31 + 2025_04_30 + 2025_05_31 + 2025_06_30 +
         2025_07_31 + 2025_08_31 + 2025_09_30) / 9.0
    ), 2) AS avg_rent_2025_ytd,
    COUNT(*) AS num_regions
FROM rent_index_data
WHERE statename IS NOT NULL 
  AND statename != ''
GROUP BY statename
ORDER BY statename;


-- ============================================================================
-- ANALYSIS: Rent Trends and Growth Analysis (2015-2025)
-- ============================================================================
-- Question: What is the average rent level and yearly trend across U.S. states?
-- 
-- This analysis builds on the yearly averages calculated above and adds:
-- - Year-over-year (YoY) growth rates
-- - Total growth from 2015-2024
-- - Compound Annual Growth Rate (CAGR)
-- - State rankings and comparisons
-- ============================================================================

-- Note: To use these analysis queries, first run Query 2 above to create 
-- a temp table or view with yearly averages, then reference it here.
-- For demonstration, these queries calculate inline, but in production
-- you would reference the base query results.


-- ============================================================================
-- ANALYSIS 1: Year-over-Year Growth Rate by State (All Years)
-- ============================================================================
-- Shows how rent changed each year compared to the previous year

WITH base_data AS (
    SELECT 
        statename AS state,
        AVG((2015_01_31 + 2015_02_28 + 2015_03_31 + 2015_04_30 + 2015_05_31 + 2015_06_30 +
             2015_07_31 + 2015_08_31 + 2015_09_30 + 2015_10_31 + 2015_11_30 + 2015_12_31) / 12.0) AS rent_2015,
        AVG((2016_01_31 + 2016_02_29 + 2016_03_31 + 2016_04_30 + 2016_05_31 + 2016_06_30 +
             2016_07_31 + 2016_08_31 + 2016_09_30 + 2016_10_31 + 2016_11_30 + 2016_12_31) / 12.0) AS rent_2016,
        AVG((2020_01_31 + 2020_02_29 + 2020_03_31 + 2020_04_30 + 2020_05_31 + 2020_06_30 +
             2020_07_31 + 2020_08_31 + 2020_09_30 + 2020_10_31 + 2020_11_30 + 2020_12_31) / 12.0) AS rent_2020,
        AVG((2021_01_31 + 2021_02_28 + 2021_03_31 + 2021_04_30 + 2021_05_31 + 2021_06_30 +
             2021_07_31 + 2021_08_31 + 2021_09_30 + 2021_10_31 + 2021_11_30 + 2021_12_31) / 12.0) AS rent_2021,
        AVG((2022_01_31 + 2022_02_28 + 2022_03_31 + 2022_04_30 + 2022_05_31 + 2022_06_30 +
             2022_07_31 + 2022_08_31 + 2022_09_30 + 2022_10_31 + 2022_11_30 + 2022_12_31) / 12.0) AS rent_2022,
        AVG((2024_01_31 + 2024_02_29 + 2024_03_31 + 2024_04_30 + 2024_05_31 + 2024_06_30 +
             2024_07_31 + 2024_08_31 + 2024_09_30 + 2024_10_31 + 2024_11_30 + 2024_12_31) / 12.0) AS rent_2024
    FROM rent_index_data
    WHERE statename IS NOT NULL AND statename != ''
    GROUP BY statename
)

SELECT 
    state,
    ROUND(((rent_2016 - rent_2015) / rent_2015) * 100, 2) AS yoy_growth_2016,
    ROUND(((rent_2020 - rent_2015) / rent_2015) * 100, 2) AS growth_2015_to_2020,
    ROUND(((rent_2021 - rent_2020) / rent_2020) * 100, 2) AS yoy_growth_2021_pandemic_recovery,
    ROUND(((rent_2022 - rent_2021) / rent_2021) * 100, 2) AS yoy_growth_2022,
    ROUND(((rent_2024 - rent_2015) / rent_2015) * 100, 2) AS total_growth_2015_2024,
    ROUND((POWER((rent_2024 / rent_2015), (1.0/9.0)) - 1) * 100, 2) AS cagr_2015_2024
FROM base_data
ORDER BY total_growth_2015_2024 DESC;


-- ============================================================================
-- ANALYSIS 2: Top 10 States - Highest and Lowest Rent Levels (2024)
-- ============================================================================

WITH state_rent AS (
    SELECT 
        statename AS state,
        ROUND(AVG((2024_01_31 + 2024_02_29 + 2024_03_31 + 2024_04_30 + 2024_05_31 + 2024_06_30 +
                   2024_07_31 + 2024_08_31 + 2024_09_30 + 2024_10_31 + 2024_11_30 + 2024_12_31) / 12.0), 2) AS avg_rent_2024
    FROM rent_index_data
    WHERE statename IS NOT NULL AND statename != ''
    GROUP BY statename
)

(
    SELECT 'Highest Rent' AS category, state, avg_rent_2024
    FROM state_rent
    ORDER BY avg_rent_2024 DESC
    LIMIT 10
)
UNION ALL
(
    SELECT 'Lowest Rent' AS category, state, avg_rent_2024
    FROM state_rent
    ORDER BY avg_rent_2024 ASC
    LIMIT 10
)
ORDER BY category DESC, avg_rent_2024 DESC;


-- ============================================================================
-- ANALYSIS 3: Top 10 Fastest and Slowest Growing States (2015-2024)
-- ============================================================================

WITH growth_rates AS (
    SELECT 
        statename AS state,
        AVG((2015_01_31 + 2015_02_28 + 2015_03_31 + 2015_04_30 + 2015_05_31 + 2015_06_30 +
             2015_07_31 + 2015_08_31 + 2015_09_30 + 2015_10_31 + 2015_11_30 + 2015_12_31) / 12.0) AS rent_2015,
        AVG((2024_01_31 + 2024_02_29 + 2024_03_31 + 2024_04_30 + 2024_05_31 + 2024_06_30 +
             2024_07_31 + 2024_08_31 + 2024_09_30 + 2024_10_31 + 2024_11_30 + 2024_12_31) / 12.0) AS rent_2024,
        ROUND(((AVG((2024_01_31 + 2024_02_29 + 2024_03_31 + 2024_04_30 + 2024_05_31 + 2024_06_30 +
                     2024_07_31 + 2024_08_31 + 2024_09_30 + 2024_10_31 + 2024_11_30 + 2024_12_31) / 12.0) -
                AVG((2015_01_31 + 2015_02_28 + 2015_03_31 + 2015_04_30 + 2015_05_31 + 2015_06_30 +
                    2015_07_31 + 2015_08_31 + 2015_09_30 + 2015_10_31 + 2015_11_30 + 2015_12_31) / 12.0)) /
               AVG((2015_01_31 + 2015_02_28 + 2015_03_31 + 2015_04_30 + 2015_05_31 + 2015_06_30 +
                   2015_07_31 + 2015_08_31 + 2015_09_30 + 2015_10_31 + 2015_11_30 + 2015_12_31) / 12.0) * 100), 2) AS growth_pct
    FROM rent_index_data
    WHERE statename IS NOT NULL AND statename != ''
    GROUP BY statename
)

(
    SELECT 'Fastest Growth' AS category, state, 
           ROUND(rent_2015, 2) AS rent_2015, 
           ROUND(rent_2024, 2) AS rent_2024, 
           growth_pct
    FROM growth_rates
    ORDER BY growth_pct DESC
    LIMIT 10
)
UNION ALL
(
    SELECT 'Slowest Growth' AS category, state, 
           ROUND(rent_2015, 2) AS rent_2015, 
           ROUND(rent_2024, 2) AS rent_2024, 
           growth_pct
    FROM growth_rates
    ORDER BY growth_pct ASC
    LIMIT 10
)
ORDER BY category DESC, growth_pct DESC;


-- ============================================================================
-- ANALYSIS 4: National Summary - Overall Market Trends
-- ============================================================================

SELECT 
    'U.S. National Average' AS metric,
    ROUND(AVG((2015_01_31 + 2015_02_28 + 2015_03_31 + 2015_04_30 + 2015_05_31 + 2015_06_30 +
               2015_07_31 + 2015_08_31 + 2015_09_30 + 2015_10_31 + 2015_11_30 + 2015_12_31) / 12.0), 2) AS avg_rent_2015,
    ROUND(AVG((2020_01_31 + 2020_02_29 + 2020_03_31 + 2020_04_30 + 2020_05_31 + 2020_06_30 +
               2020_07_31 + 2020_08_31 + 2020_09_30 + 2020_10_31 + 2020_11_30 + 2020_12_31) / 12.0), 2) AS avg_rent_2020,
    ROUND(AVG((2024_01_31 + 2024_02_29 + 2024_03_31 + 2024_04_30 + 2024_05_31 + 2024_06_30 +
               2024_07_31 + 2024_08_31 + 2024_09_30 + 2024_10_31 + 2024_11_30 + 2024_12_31) / 12.0), 2) AS avg_rent_2024,
    ROUND(
        ((AVG((2024_01_31 + 2024_02_29 + 2024_03_31 + 2024_04_30 + 2024_05_31 + 2024_06_30 +
               2024_07_31 + 2024_08_31 + 2024_09_30 + 2024_10_31 + 2024_11_30 + 2024_12_31) / 12.0) -
          AVG((2015_01_31 + 2015_02_28 + 2015_03_31 + 2015_04_30 + 2015_05_31 + 2015_06_30 +
              2015_07_31 + 2015_08_31 + 2015_09_30 + 2015_10_31 + 2015_11_30 + 2015_12_31) / 12.0)) /
         AVG((2015_01_31 + 2015_02_28 + 2015_03_31 + 2015_04_30 + 2015_05_31 + 2015_06_30 +
             2015_07_31 + 2015_08_31 + 2015_09_30 + 2015_10_31 + 2015_11_30 + 2015_12_31) / 12.0) * 100
    ), 2) AS total_growth_pct_2015_2024,
    ROUND(
        ((AVG((2024_01_31 + 2024_02_29 + 2024_03_31 + 2024_04_30 + 2024_05_31 + 2024_06_30 +
               2024_07_31 + 2024_08_31 + 2024_09_30 + 2024_10_31 + 2024_11_30 + 2024_12_31) / 12.0) -
          AVG((2020_01_31 + 2020_02_29 + 2020_03_31 + 2020_04_30 + 2020_05_31 + 2020_06_30 +
              2020_07_31 + 2020_08_31 + 2020_09_30 + 2020_10_31 + 2020_11_30 + 2020_12_31) / 12.0)) /
         AVG((2020_01_31 + 2020_02_29 + 2020_03_31 + 2020_04_30 + 2020_05_31 + 2020_06_30 +
             2020_07_31 + 2020_08_31 + 2020_09_30 + 2020_10_31 + 2020_11_30 + 2020_12_31) / 12.0) * 100
    ), 2) AS growth_pct_post_pandemic_2020_2024
FROM rent_index_data
WHERE statename IS NOT NULL AND statename != '';

