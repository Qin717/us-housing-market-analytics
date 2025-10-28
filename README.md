

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

### 🏠 Project 1: Home Value Analysis (Excel)

**Market Overview**  
From 2000–2025, U.S. home values rose steadily at an average **+5.1% per year**, with major inflection points:  
a **-12.6% decline in 2009** during the housing crash and a **+16.8% surge in 2021** following pandemic-driven demand.  
The **South and Mountain regions** led appreciation, while the **West** remained the most volatile yet highest-valued region.

**Key Highlights**

| Metric | State / Region | Value | Period | Insight |
|--------|----------------|-------|--------|----------|
| **Fastest Home Value Growth (CAGR)** | Idaho | **+11.8% per year** | 2015–2025 | Driven by affordability migration and population inflows |
| **Most Volatile Market** | Nevada | **9.6 Volatility Index** | 2000–2025 | Characterized by speculative cycles and sharp corrections |
| **Strongest Post-2008 Recovery** | Texas | **3 Years to Recover** | 2008–2011 | Early rebound due to diversified economy |
| **Peak National Growth** | United States | **+16.8% YoY** | 2021 | Stimulus-driven surge under record-low rates |
| **Deepest Market Decline** | United States | **-12.6% YoY** | 2009 | Reflects the depth of the subprime crisis |

**Regional Trends**  
The **South** achieved the fastest and most consistent growth, fueled by affordability and migration.  
The **West** remained high-value but highly cyclical, while the **Midwest** demonstrated long-term stability and resilience.

![Regional Housing Value Trends](https://github.com/Qin717/us-housing-market-analytics/blob/main/01_zillow_home_value_index_analysis/outputs/charts/q6_regional_housing_value_trends.png)  
*Regional housing value trends in the U.S. (2000–2025).*

---

### 🏢 Project 2: Rent Value Analysis (SQL)

**Market Overview**  
Rental markets mirrored home-value trends but reacted faster to economic shocks.  
From 2020–2025, rents surged nationwide — led by **Southern states with +35% cumulative growth** — as affordability migration and remote work reshaped regional demand.

**Key Highlights**

| Metric | State / Region | Value | Period | Insight |
|--------|----------------|-------|--------|----------|
| **Fastest Rent Growth** | Florida | **+41% increase** | 2020–2025 | Driven by population migration and housing demand |
| **Most Stable Rent Market** | Midwest | **< 4 Volatility Index** | 2000–2025 | Consistent rent growth with minimal swings |
| **Strongest Rent Rebound Post-2020** | Texas | **+29% YoY peak** | 2021 | Rapid recovery reflecting economic resilience |
| **Highest Regional Rent Growth** | South | **+35% cumulative** | 2020–2025 | Affordability and job creation attracted new renters |
| **Lowest Rent Growth** | Northeast | **+12% cumulative** | 2020–2025 | Slowest recovery due to population outflows |

**Regional Trends**  
Southern and Mountain states drove the strongest rental recovery post-2020, while the Midwest remained a model of stability.  
The Northeast lagged as migration and affordability pressures shifted population centers inland.

![Post-COVID Rent Recovery](https://github.com/Qin717/us-housing-market-analytics/blob/main/02_zillow_rent_value_index_analysis/outputs/charts/Q5_top10_states_by_rent_recovery_post_covid.png)  
*Top 10 states by post-COVID rent recovery (2020–2025).*

---

## 4. Recommendations

**For Investors**  
- Diversify across **high-growth (South & Mountain)** and **low-volatility (Midwest)** markets for stable long-term performance.  
- Track volatility metrics and YoY shifts as early signals of market overheating.  

**For Developers**  
- Focus on affordable, fast-growing states such as **Texas, Georgia, and North Carolina**.  
- Use rental performance data to identify emerging suburban demand centers.  

**For Policymakers**  
- Monitor **rent-to-income ratios** in high-growth states to address affordability challenges.  
- Support balanced regional development through housing supply incentives and zoning reforms.  

---

## 👤 Author
**Qin QIN**  
Data Analytics Portfolio | Real Estate · Market Trends · Visualization  
🔗 [GitHub Portfolio](https://github.com/Qin717) | [LinkedIn](https://www.linkedin.com/in/qinqin0717)


