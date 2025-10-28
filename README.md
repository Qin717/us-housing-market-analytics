
# U.S. Housing Market Analytics (2000–2025)

## 1. Project Background

The U.S. housing market — one of the most critical pillars of the global economy — has experienced extraordinary cycles over the past 25 years: the early-2000s housing boom, the 2008 financial crisis, a decade-long recovery, and the post-pandemic surge and correction.  
Understanding these market shifts is essential for **investors, policymakers, and real-estate professionals** seeking to navigate volatility, forecast demand, and identify long-term opportunities for sustainable growth.

This project leverages **Zillow Research’s Home Value Index (ZHVI)** and **Rent Index (ZORI)** datasets from 2000 to 2025 to uncover how property values and rental prices evolved across the United States.  
It aims to transform complex, longitudinal data into actionable insights that explain **how regional dynamics, affordability, and economic resilience** have shaped housing market performance.

The analysis focuses on four key objectives:

- **Market Trend Analysis:** Examine national and regional housing value trends across 25 years, identifying long-term growth and contraction cycles.  
- **Crisis & Recovery Evaluation:** Quantify the impact of major economic disruptions — including the 2008 housing crash and the 2020 pandemic — on home and rent values.  
- **Regional Performance Comparison:** Assess how housing markets differ across U.S. regions (West, South, Midwest, Northeast) in terms of growth rate, volatility, and recovery strength.  
- **Investment & Policy Implications:** Translate analytical findings into insights that inform **investment strategy, affordability policy, and regional development planning.**

> **Scope:** This analysis covers 50 states, 4 major U.S. regions, and 25 years of Zillow housing and rental data, providing a complete macro-to-micro view of U.S. housing dynamics.

---

## 2. Data Structure & Initial Checks

**Data Sources**
- **Zillow Home Value Index (ZHVI):** Monthly median home value estimates by region and state (2000–2025).  
- **Zillow Rent Index (ZORI):** Monthly median rent value estimates by region and state (2000–2025).  

**Data Structure**
- Both datasets contain approximately 6,000 rows and over 300 monthly columns.  
- Key fields include: `RegionID`, `RegionName`, `StateName`, `Metro`, `County`, and `SizeRank`.  
- Monthly data was **aggregated into annual averages** for year-over-year (YoY) and volatility analysis.  

**Initial Data Quality Checks**
- Verified dataset completeness across all states and time periods (2000–2025).  
- Standardized naming conventions and removed duplicates using Excel Power Query.  
- Conducted type consistency checks and confirmed matching region identifiers across datasets.  
- Created yearly summary tables to calculate **CAGR**, **YoY Growth**, and **Volatility (STDEV.P)**.  
- Validated trends between home-value and rent datasets to ensure analytical coherence.  

These checks ensured a clean, unified dataset suitable for robust trend analysis across time and geography.

---

## 3. Executive Summary

**Overview**

The analysis reveals clear evidence of **regional divergence and structural transformation** within the U.S. housing market from 2000 to 2025.  
While the West remains the most expensive region, the **South and Mountain states have emerged as the fastest-growing** due to affordability and population inflows.

**Key Findings**

- **Long-Term Regional Divergence:**  
  Western states maintained the highest housing prices, but Southern and inland states recorded the strongest sustained growth, reflecting long-term migration patterns.  

- **Impact of Economic Crises:**  
  The 2008 crash caused declines exceeding 40% in markets such as Nevada and Florida, while post-2012 recoveries varied widely. The pandemic shock of 2020–2021 accelerated price growth in previously undervalued regions.  

- **Post-COVID Market Rebalancing:**  
  From 2020–2025, Idaho and Utah experienced home value appreciation **over twice the national average**, while rent growth surged **35% higher in the South**, indicating structural demand shifts away from traditional coastal markets.  

- **Volatility & Risk:**  
  Coastal states (CA, NY, MA) remain more volatile, whereas interior states (TX, NC, TN) exhibit steadier year-over-year changes, offering better long-term investment balance.

**Visual Overview**

| Regional Housing Value Trends | Rent Recovery |
|-------------------------------|---------------|
| ![Regional Housing Value Trends](https://github.com/Qin717/us-housing-market-analytics/blob/main/01_zillow_home_value_index_analysis/outputs/charts/q6_regional_housing_value_trends.png) | ![Post-COVID Rent Recovery](https://github.com/Qin717/us-housing-market-analytics/blob/main/02_zillow_rent_value_index_analysis/outputs/charts/Q5_top10_states_by_rent_recovery_post_covid.png) |

*Regional and rental market performance visualized across 25 years of Zillow data (2000–2025).*

**Tools & Methods**
- **Excel Power Query** – cleaning, unpivoting, and yearly aggregation  
- **Excel Pivot Tables** – computing averages, YoY growth, and volatility  
- **SQL (CTEs, Window Functions)** – ranking and comparative analytics  
- **Charts & Reporting** – Excel dashboards and PDF summaries for presentation  

---

## 4. Recommendations

### For Real-Estate Investors
- **Diversify geographically:** Combine exposure to high-growth inland states with stable coastal markets for optimal risk-adjusted performance.  
- **Monitor volatility indicators:** Use standard deviation and YoY growth patterns as early signals of overheating or price correction risks.  

### For Developers & Builders
- **Prioritize construction** in Southern and Mountain states with rising demand and affordability-driven inflows.  
- **Leverage regional recovery data** to identify markets entering mid-cycle expansion phases.  

### For Policymakers
- **Develop targeted affordability programs** in regions with above-average rent inflation post-2020.  
- **Support sustainable development** by aligning infrastructure investment with population shifts.  

### For Data Analysts & Researchers
- Integrate additional datasets (mortgage rates, income, population migration) for advanced modeling.  
- Extend the current SQL framework with Python-based forecasting models for 2030+ housing trends.  

---

## Author

**Qin Qin**  
Data Analyst | Excel · SQL · Python · Data Storytelling  
Montpellier, France  
[LinkedIn](https://linkedin.com/in/yourprofile) | [GitHub](https://github.com/Qin717)

