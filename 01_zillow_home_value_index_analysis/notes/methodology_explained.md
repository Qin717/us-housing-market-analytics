# Methodology Explained

## Overview
This document describes the Excel formulas, logic, and key insights used in the Zillow Home Value Index (ZHVI) analysis.

## Data Processing

### Raw Data
- Source: Zillow Home Value Index (ZHVI) raw data from Zillow Research Data Portal
- Format: Monthly housing value data by state (50 states + District of Columbia)
- Time Period: 2000-01 to 2025-08
- Metric: Typical home value (seasonally adjusted, single-family homes)

### Clean Data
- **home_values_yearly_clean.csv**: Aggregated monthly data into annual averages at the state level
- **home_value_yoy_growth.csv**: Year-over-year growth calculations for trend analysis at the state level

## Excel Analysis

### Q1: Top 10 U.S. States by Average Home Value Growth
- **Purpose**: Identify states with the highest average home value growth over the analysis period (2000-2025)
- **Formula**: `AVERAGE()` function applied to yearly index values grouped by state, then ranked by average growth
- **Metrics**: Average annual home value across all years, or average growth rate
- **Key Insight**: Highlights states with consistent long-term appreciation trends, driven by economic growth, population migration, and housing market dynamics

### Q2: Top 5 U.S. States by Home Value Growth (Absolute vs Percentage)
- **Purpose**: Compare top 5 states by both absolute dollar growth and percentage growth in home values
- **Formula**: 
  - Absolute Growth: `Current_Value - Base_Value` (total dollar increase)
  - Percentage Growth: `(Current_Value - Base_Value) / Base_Value * 100` (percentage appreciation)
- **Visualization**: Dual-axis chart showing both metrics to highlight different growth patterns
- **Key Insight**: Differentiates between high-value markets (large absolute gains) and high-growth markets (high percentage appreciation), showing how different states achieved growth through various patterns

### Q3: Top 5 States with Highest Volatility
- **Purpose**: Identify states with the most price fluctuation and market instability
- **Formula**: `STDEVP()` or `STDEV()` for standard deviation of year-over-year growth rates across all years
- **Metric**: Volatility measured as standard deviation of YoY growth percentages
- **Key Insight**: Helps identify risky vs. stable markets; volatility is often concentrated in tourism-driven markets and correlates with economic cycles and population shifts

### Q4: Impact and Recovery from 2008 Housing Crash (2007-2015)
- **Purpose**: Analyze the financial crisis impact and recovery timeline by state
- **Formula**: 
  - Pre-crash peak: `MAX()` of values from 2005-2007
  - Recovery point: Comparison of values to identify when each state regained pre-crash levels
  - Recovery timeline: `IF()` statements to determine recovery year
- **Metrics**: Peak values, crash depth, recovery time, percentage recovery
- **Key Insight**: Shows resilience and recovery patterns by state/region; fastest post-crash rebounds occurred in Sunbelt states (NV, AZ, FL), while others (NJ, IL) lagged until 2018+

### Q5: Regional Housing Value Trends in the U.S.
- **Purpose**: Identify regional patterns and trends across different geographic regions
- **Formula**: 
  - Regional aggregation: `AVERAGE()` of state-level values grouped by region (Northeast, Midwest, South, West)
  - Time series analysis: Trend lines and moving averages using `TREND()` or chart trendlines
  - CAGR calculation: `(End_Value / Start_Value) ^ (1 / Years) - 1`
- **Metrics**: Regional averages, growth rates, trend comparisons
- **Key Insight**: Reveals structural shifts toward affordable, high-growth regions (South and West outperform Northeast and Midwest since 2010), showing broader economic and demographic influences beyond individual state performance

## Key Insights

1. **Long-Term Growth Leaders**: States with highest average home value growth demonstrate strong appreciation trends driven by economic growth, population migration, and housing market dynamics

2. **Growth Patterns**: Clear distinction between states with high absolute dollar growth (high-value markets) versus high percentage growth (emerging markets), showing different investment characteristics

3. **Volatility Patterns**: States with high volatility (often tourism-driven markets like NV, FL) show 3.5× spread in market stability compared to stable markets (IA, OH), correlating with economic cycles and population shifts

4. **Recovery Patterns**: Post-2008 recovery varied significantly by region, with Sunbelt states (NV, AZ, FL) recovering fastest by 2015, while others (NJ, IL) lagged until 2018+, demonstrating varying resilience

5. **Regional Trends**: Clear structural shift toward affordable, high-growth regions (South and West with CAGR 5.8% vs 3.2% in Northeast/Midwest), revealing broader macroeconomic factors influence local markets

6. **Risk-Return Profile**: States with CAGR > 5% often exhibit volatility < 9%, suggesting favorable risk-return profiles in markets like TX, TN, AZ

## Technical Notes

- **Data Aggregation**: All calculations use annual averages (aggregated from monthly ZHVI data) to smooth out seasonal variations
- **Growth Calculations**: Growth rates are calculated year-over-year (YoY) to capture annual trends, and also as compound annual growth rate (CAGR) for long-term analysis
- **Volatility Measurement**: Volatility is measured using standard deviation (STDEVP) of YoY growth percentages, providing a risk assessment metric for different markets
- **Time Period**: Analysis covers 2000-2025, providing 25 years of data for robust trend identification
- **State-Level Granularity**: All analyses conducted at state level (50 states + District of Columbia) for consistent geographic comparison
- **Regional Aggregation**: Regional analysis groups states into four U.S. Census regions (Northeast, Midwest, South, West) to reveal broader economic patterns beyond individual state performance
- **Excel Tools**: Primary analysis uses Excel formulas (AVERAGE, STDEVP, MAX, IF, TREND) with Power Query for data cleaning and aggregation

