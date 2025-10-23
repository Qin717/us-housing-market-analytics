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
-- ANALYSIS QUERY: Average Rent Level and Yearly Trend (2015-2025) by State
-- ============================================================================
-- This query provides comprehensive analysis including:
-- - Yearly average rent by state
-- - Year-over-year growth rates
-- - Overall trend from 2015 to 2025
-- - State rankings by rent level
-- ============================================================================

WITH yearly_state_averages AS (
    -- Calculate average rent for each state by year
    SELECT 
        statename AS state,
        ROUND(AVG((2015_01_31 + 2015_02_28 + 2015_03_31 + 2015_04_30 + 2015_05_31 + 2015_06_30 +
                   2015_07_31 + 2015_08_31 + 2015_09_30 + 2015_10_31 + 2015_11_30 + 2015_12_31) / 12.0), 2) AS avg_rent_2015,
        ROUND(AVG((2016_01_31 + 2016_02_29 + 2016_03_31 + 2016_04_30 + 2016_05_31 + 2016_06_30 +
                   2016_07_31 + 2016_08_31 + 2016_09_30 + 2016_10_31 + 2016_11_30 + 2016_12_31) / 12.0), 2) AS avg_rent_2016,
        ROUND(AVG((2017_01_31 + 2017_02_28 + 2017_03_31 + 2017_04_30 + 2017_05_31 + 2017_06_30 +
                   2017_07_31 + 2017_08_31 + 2017_09_30 + 2017_10_31 + 2017_11_30 + 2017_12_31) / 12.0), 2) AS avg_rent_2017,
        ROUND(AVG((2018_01_31 + 2018_02_28 + 2018_03_31 + 2018_04_30 + 2018_05_31 + 2018_06_30 +
                   2018_07_31 + 2018_08_31 + 2018_09_30 + 2018_10_31 + 2018_11_30 + 2018_12_31) / 12.0), 2) AS avg_rent_2018,
        ROUND(AVG((2019_01_31 + 2019_02_28 + 2019_03_31 + 2019_04_30 + 2019_05_31 + 2019_06_30 +
                   2019_07_31 + 2019_08_31 + 2019_09_30 + 2019_10_31 + 2019_11_30 + 2019_12_31) / 12.0), 2) AS avg_rent_2019,
        ROUND(AVG((2020_01_31 + 2020_02_29 + 2020_03_31 + 2020_04_30 + 2020_05_31 + 2020_06_30 +
                   2020_07_31 + 2020_08_31 + 2020_09_30 + 2020_10_31 + 2020_11_30 + 2020_12_31) / 12.0), 2) AS avg_rent_2020,
        ROUND(AVG((2021_01_31 + 2021_02_28 + 2021_03_31 + 2021_04_30 + 2021_05_31 + 2021_06_30 +
                   2021_07_31 + 2021_08_31 + 2021_09_30 + 2021_10_31 + 2021_11_30 + 2021_12_31) / 12.0), 2) AS avg_rent_2021,
        ROUND(AVG((2022_01_31 + 2022_02_28 + 2022_03_31 + 2022_04_30 + 2022_05_31 + 2022_06_30 +
                   2022_07_31 + 2022_08_31 + 2022_09_30 + 2022_10_31 + 2022_11_30 + 2022_12_31) / 12.0), 2) AS avg_rent_2022,
        ROUND(AVG((2023_01_31 + 2023_02_28 + 2023_03_31 + 2023_04_30 + 2023_05_31 + 2023_06_30 +
                   2023_07_31 + 2023_08_31 + 2023_09_30 + 2023_10_31 + 2023_11_30 + 2023_12_31) / 12.0), 2) AS avg_rent_2023,
        ROUND(AVG((2024_01_31 + 2024_02_29 + 2024_03_31 + 2024_04_30 + 2024_05_31 + 2024_06_30 +
                   2024_07_31 + 2024_08_31 + 2024_09_30 + 2024_10_31 + 2024_11_30 + 2024_12_31) / 12.0), 2) AS avg_rent_2024,
        ROUND(AVG((2025_01_31 + 2025_02_28 + 2025_03_31 + 2025_04_30 + 2025_05_31 + 2025_06_30 +
                   2025_07_31 + 2025_08_31 + 2025_09_30) / 9.0), 2) AS avg_rent_2025,
        COUNT(*) AS num_regions
    FROM rent_index_data
    WHERE statename IS NOT NULL AND statename != ''
    GROUP BY statename
),

trend_analysis AS (
    -- Calculate growth rates and trends
    SELECT 
        state,
        avg_rent_2015,
        avg_rent_2016,
        avg_rent_2017,
        avg_rent_2018,
        avg_rent_2019,
        avg_rent_2020,
        avg_rent_2021,
        avg_rent_2022,
        avg_rent_2023,
        avg_rent_2024,
        avg_rent_2025,
        num_regions,
        
        -- Year-over-year growth rates (%)
        ROUND(((avg_rent_2016 - avg_rent_2015) / avg_rent_2015) * 100, 2) AS yoy_growth_2016,
        ROUND(((avg_rent_2017 - avg_rent_2016) / avg_rent_2016) * 100, 2) AS yoy_growth_2017,
        ROUND(((avg_rent_2018 - avg_rent_2017) / avg_rent_2017) * 100, 2) AS yoy_growth_2018,
        ROUND(((avg_rent_2019 - avg_rent_2018) / avg_rent_2018) * 100, 2) AS yoy_growth_2019,
        ROUND(((avg_rent_2020 - avg_rent_2019) / avg_rent_2019) * 100, 2) AS yoy_growth_2020,
        ROUND(((avg_rent_2021 - avg_rent_2020) / avg_rent_2020) * 100, 2) AS yoy_growth_2021,
        ROUND(((avg_rent_2022 - avg_rent_2021) / avg_rent_2021) * 100, 2) AS yoy_growth_2022,
        ROUND(((avg_rent_2023 - avg_rent_2022) / avg_rent_2022) * 100, 2) AS yoy_growth_2023,
        ROUND(((avg_rent_2024 - avg_rent_2023) / avg_rent_2023) * 100, 2) AS yoy_growth_2024,
        ROUND(((avg_rent_2025 - avg_rent_2024) / avg_rent_2024) * 100, 2) AS yoy_growth_2025,
        
        -- Overall change from 2015 to 2024 (full year)
        ROUND(avg_rent_2024 - avg_rent_2015, 2) AS total_change_2015_2024,
        ROUND(((avg_rent_2024 - avg_rent_2015) / avg_rent_2015) * 100, 2) AS total_growth_pct_2015_2024,
        
        -- Average annual growth rate (CAGR) from 2015 to 2024
        ROUND((POWER((avg_rent_2024 / avg_rent_2015), (1.0/9.0)) - 1) * 100, 2) AS cagr_2015_2024
        
    FROM yearly_state_averages
)

SELECT 
    state,
    avg_rent_2015,
    avg_rent_2016,
    avg_rent_2017,
    avg_rent_2018,
    avg_rent_2019,
    avg_rent_2020,
    avg_rent_2021,
    avg_rent_2022,
    avg_rent_2023,
    avg_rent_2024,
    avg_rent_2025,
    num_regions,
    yoy_growth_2016,
    yoy_growth_2017,
    yoy_growth_2018,
    yoy_growth_2019,
    yoy_growth_2020,
    yoy_growth_2021,
    yoy_growth_2022,
    yoy_growth_2023,
    yoy_growth_2024,
    yoy_growth_2025,
    total_change_2015_2024,
    total_growth_pct_2015_2024,
    cagr_2015_2024
FROM trend_analysis
ORDER BY avg_rent_2024 DESC;


-- ============================================================================
-- SUMMARY STATISTICS: Key Metrics Across All States
-- ============================================================================

WITH yearly_state_averages AS (
    SELECT 
        statename AS state,
        ROUND(AVG((2015_01_31 + 2015_02_28 + 2015_03_31 + 2015_04_30 + 2015_05_31 + 2015_06_30 +
                   2015_07_31 + 2015_08_31 + 2015_09_30 + 2015_10_31 + 2015_11_30 + 2015_12_31) / 12.0), 2) AS avg_rent_2015,
        ROUND(AVG((2024_01_31 + 2024_02_29 + 2024_03_31 + 2024_04_30 + 2024_05_31 + 2024_06_30 +
                   2024_07_31 + 2024_08_31 + 2024_09_30 + 2024_10_31 + 2024_11_30 + 2024_12_31) / 12.0), 2) AS avg_rent_2024
    FROM rent_index_data
    WHERE statename IS NOT NULL AND statename != ''
    GROUP BY statename
)

SELECT 
    'National Summary' AS metric_category,
    COUNT(*) AS num_states,
    ROUND(AVG(avg_rent_2015), 2) AS national_avg_rent_2015,
    ROUND(AVG(avg_rent_2024), 2) AS national_avg_rent_2024,
    ROUND(MIN(avg_rent_2024), 2) AS min_rent_2024,
    ROUND(MAX(avg_rent_2024), 2) AS max_rent_2024,
    ROUND(AVG((avg_rent_2024 - avg_rent_2015) / avg_rent_2015 * 100), 2) AS avg_growth_pct_2015_2024
FROM yearly_state_averages;


-- ============================================================================
-- TOP 10 STATES: Highest Average Rent in 2024
-- ============================================================================

WITH state_rent_2024 AS (
    SELECT 
        statename AS state,
        ROUND(AVG((2024_01_31 + 2024_02_29 + 2024_03_31 + 2024_04_30 + 2024_05_31 + 2024_06_30 +
                   2024_07_31 + 2024_08_31 + 2024_09_30 + 2024_10_31 + 2024_11_30 + 2024_12_31) / 12.0), 2) AS avg_rent_2024,
        COUNT(*) AS num_regions
    FROM rent_index_data
    WHERE statename IS NOT NULL AND statename != ''
    GROUP BY statename
)

SELECT 
    ROW_NUMBER() OVER (ORDER BY avg_rent_2024 DESC) AS rank,
    state,
    avg_rent_2024,
    num_regions
FROM state_rent_2024
ORDER BY avg_rent_2024 DESC
LIMIT 10;


-- ============================================================================
-- TOP 10 STATES: Highest Growth Rate (2015-2024)
-- ============================================================================

WITH state_growth AS (
    SELECT 
        statename AS state,
        ROUND(AVG((2015_01_31 + 2015_02_28 + 2015_03_31 + 2015_04_30 + 2015_05_31 + 2015_06_30 +
                   2015_07_31 + 2015_08_31 + 2015_09_30 + 2015_10_31 + 2015_11_30 + 2015_12_31) / 12.0), 2) AS avg_rent_2015,
        ROUND(AVG((2024_01_31 + 2024_02_29 + 2024_03_31 + 2024_04_30 + 2024_05_31 + 2024_06_30 +
                   2024_07_31 + 2024_08_31 + 2024_09_30 + 2024_10_31 + 2024_11_30 + 2024_12_31) / 12.0), 2) AS avg_rent_2024,
        COUNT(*) AS num_regions
    FROM rent_index_data
    WHERE statename IS NOT NULL AND statename != ''
    GROUP BY statename
)

SELECT 
    ROW_NUMBER() OVER (ORDER BY ((avg_rent_2024 - avg_rent_2015) / avg_rent_2015 * 100) DESC) AS rank,
    state,
    avg_rent_2015,
    avg_rent_2024,
    ROUND(avg_rent_2024 - avg_rent_2015, 2) AS absolute_change,
    ROUND(((avg_rent_2024 - avg_rent_2015) / avg_rent_2015) * 100, 2) AS growth_rate_pct,
    ROUND((POWER((avg_rent_2024 / avg_rent_2015), (1.0/9.0)) - 1) * 100, 2) AS cagr,
    num_regions
FROM state_growth
ORDER BY growth_rate_pct DESC
LIMIT 10;


-- ============================================================================
-- YEARLY TREND: U.S. National Average (All States Combined)
-- ============================================================================

SELECT 
    'U.S. National Average' AS geography,
    ROUND(AVG((2015_01_31 + 2015_02_28 + 2015_03_31 + 2015_04_30 + 2015_05_31 + 2015_06_30 +
               2015_07_31 + 2015_08_31 + 2015_09_30 + 2015_10_31 + 2015_11_30 + 2015_12_31) / 12.0), 2) AS avg_rent_2015,
    ROUND(AVG((2016_01_31 + 2016_02_29 + 2016_03_31 + 2016_04_30 + 2016_05_31 + 2016_06_30 +
               2016_07_31 + 2016_08_31 + 2016_09_30 + 2016_10_31 + 2016_11_30 + 2016_12_31) / 12.0), 2) AS avg_rent_2016,
    ROUND(AVG((2017_01_31 + 2017_02_28 + 2017_03_31 + 2017_04_30 + 2017_05_31 + 2017_06_30 +
               2017_07_31 + 2017_08_31 + 2017_09_30 + 2017_10_31 + 2017_11_30 + 2017_12_31) / 12.0), 2) AS avg_rent_2017,
    ROUND(AVG((2018_01_31 + 2018_02_28 + 2018_03_31 + 2018_04_30 + 2018_05_31 + 2018_06_30 +
               2018_07_31 + 2018_08_31 + 2018_09_30 + 2018_10_31 + 2018_11_30 + 2018_12_31) / 12.0), 2) AS avg_rent_2018,
    ROUND(AVG((2019_01_31 + 2019_02_28 + 2019_03_31 + 2019_04_30 + 2019_05_31 + 2019_06_30 +
               2019_07_31 + 2019_08_31 + 2019_09_30 + 2019_10_31 + 2019_11_30 + 2019_12_31) / 12.0), 2) AS avg_rent_2019,
    ROUND(AVG((2020_01_31 + 2020_02_29 + 2020_03_31 + 2020_04_30 + 2020_05_31 + 2020_06_30 +
               2020_07_31 + 2020_08_31 + 2020_09_30 + 2020_10_31 + 2020_11_30 + 2020_12_31) / 12.0), 2) AS avg_rent_2020,
    ROUND(AVG((2021_01_31 + 2021_02_28 + 2021_03_31 + 2021_04_30 + 2021_05_31 + 2021_06_30 +
               2021_07_31 + 2021_08_31 + 2021_09_30 + 2021_10_31 + 2021_11_30 + 2021_12_31) / 12.0), 2) AS avg_rent_2021,
    ROUND(AVG((2022_01_31 + 2022_02_28 + 2022_03_31 + 2022_04_30 + 2022_05_31 + 2022_06_30 +
               2022_07_31 + 2022_08_31 + 2022_09_30 + 2022_10_31 + 2022_11_30 + 2022_12_31) / 12.0), 2) AS avg_rent_2022,
    ROUND(AVG((2023_01_31 + 2023_02_28 + 2023_03_31 + 2023_04_30 + 2023_05_31 + 2023_06_30 +
               2023_07_31 + 2023_08_31 + 2023_09_30 + 2023_10_31 + 2023_11_30 + 2023_12_31) / 12.0), 2) AS avg_rent_2023,
    ROUND(AVG((2024_01_31 + 2024_02_29 + 2024_03_31 + 2024_04_30 + 2024_05_31 + 2024_06_30 +
               2024_07_31 + 2024_08_31 + 2024_09_30 + 2024_10_31 + 2024_11_30 + 2024_12_31) / 12.0), 2) AS avg_rent_2024,
    ROUND(AVG((2025_01_31 + 2025_02_28 + 2025_03_31 + 2025_04_30 + 2025_05_31 + 2025_06_30 +
               2025_07_31 + 2025_08_31 + 2025_09_30) / 9.0), 2) AS avg_rent_2025_ytd
FROM rent_index_data
WHERE statename IS NOT NULL AND statename != '';

