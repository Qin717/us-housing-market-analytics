# Methodology Explained

## Overview
This document describes the Excel formulas, logic, and key insights used in the Zillow Home Value Index (ZHVI) analysis.

## Data Processing

### Raw Data
- Source: Zillow Home Value Index (ZHVI) raw data from Zillow Research Data Portal
- Format: Monthly housing value data by city, ZIP code, and metro area
- Time Period: 2000-01 to 2025-08

### Clean Data
- **home_values_yearly_clean.csv**: Aggregated monthly data into annual averages at the city level
- **home_value_yoy_growth.csv**: Year-over-year growth calculations for trend analysis

## Excel Analysis

### Q1: Top 10 States by Average Home Values
- **Purpose**: Identify states with highest average home values
- **Formula**: `AVERAGE()` function applied to yearly index values grouped by state
- **Key Insight**: Highlights premium real estate markets

### Q2: Top 5 Home Values Growth
- **Purpose**: Identify states/cities with highest growth rates
- **Formula**: `(Current_Value - Previous_Value) / Previous_Value * 100` for percentage growth
- **Key Insight**: Reveals emerging or rapidly appreciating markets

### Q3: Top 5 Cities - Absolute and Percentage Growth
- **Purpose**: Compare both absolute dollar growth and percentage growth
- **Formula**: 
  - Absolute: `Current_Value - Previous_Value`
  - Percentage: `(Current_Value - Previous_Value) / Previous_Value * 100`
- **Key Insight**: Differentiates between high-value markets and high-growth markets

### Q4: Top 5 States with Highest Volatility
- **Purpose**: Identify markets with most price fluctuation
- **Formula**: `STDEV()` or `STDEVP()` for standard deviation of yearly index values
- **Key Insight**: Helps identify risky vs. stable markets

### Q5: Housing Market Crash to Recovery (2007-2015)
- **Purpose**: Analyze the financial crisis impact and recovery timeline
- **Formula**: Comparison of values before, during, and after the crisis
- **Key Insight**: Shows resilience and recovery patterns by state/region

### Q6: Regional Housing Value Trends
- **Purpose**: Identify regional patterns and trends
- **Formula**: Time series analysis with trend lines and moving averages
- **Key Insight**: Reveals regional economic and demographic influences

## Key Insights

1. **Market Segmentation**: Clear distinction between high-value markets (California, New York) and high-growth markets (emerging areas)

2. **Volatility Patterns**: States with high volatility often correlate with economic cycles and population shifts

3. **Recovery Patterns**: Post-2008 recovery varied significantly by region, with some markets recovering faster than others

4. **Regional Trends**: Clear regional patterns emerge, suggesting macroeconomic factors influence local markets

## Notes

- All calculations use annual averages to smooth out seasonal variations
- Growth rates are calculated year-over-year to capture annual trends
- Volatility measures help assess risk in different markets
- Regional analysis reveals broader economic patterns beyond individual state performance

