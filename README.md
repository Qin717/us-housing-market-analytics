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
| ![Regional Housing Value Trends in the U.S.](01_zillow_home_value_index_analysis/outputs/charts/q1_top10_states_average_values.png) | ![Post-COVID Rent Recovery](02_zillow_rent_value_index_analysis/outputs/charts/Q5_top10_states_by_rent_recovery_post_covid.png) |

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
  
---


## 👤 Author
**Qin QIN**  
Data Analytics Portfolio | Real Estate · Market Trends · Visualization  
🔗 [GitHub Portfolio](https://github.com/Qin717) | [LinkedIn](https://www.linkedin.com/in/qinqin0717)






# U.S. Housing Market Analytics (2000–2025)

## 1. Project Background

The U.S. housing market — a $45 trillion cornerstone of the American economy — has experienced dramatic cycles over the past 25 years: the early-2000s boom, the 2008 crash, a decade-long recovery, and the post-pandemic surge and correction.  
Understanding these long-term shifts is vital for **investors, developers, and policymakers** aiming to balance growth opportunities with risk management.

This project leverages **Zillow Research’s Home Value Index (ZHVI)** and **Rent Index (ZORI)** data from **2000–2025**, transforming 300 months of housing metrics into actionable insights about **growth, volatility, and regional resilience**.

**Key Objectives**
- Analyze 25 years of home value and rent trends across 50 U.S. states.  
- Quantify the impact of major economic cycles — 2008 crisis and COVID-19 recovery.  
- Compare regions by growth, volatility, and recovery performance.  
- Translate findings into insights for investment and housing strategy.  

> **Scope:** 50 states · 4 U.S. regions · 25 years of housing and rent data (2000–2025)

---

## 2. Data Structure & Initial Checks

- **Datasets:** Zillow Home Value Index (ZHVI) and Zillow Rent Index (ZORI)  
- **Structure:** ~6,000 rows × 300 monthly observations per dataset  
- **Granularity:** State- and regional-level  
- **Processing:**  
  - Cleaned and reshaped using Excel Power Query  
  - Aggregated monthly data into yearly averages  
  - Computed key metrics — CAGR, YoY growth, and Volatility (STDEV.P)  
  - Validated consistency between home and rent datasets  

This process ensured a clean, unified foundation for long-term comparative analysis.

---

## 3. Executive Summary

### Market Overview

From 2000–2025, U.S. housing markets have **appreciated at an average rate of +5.1% per year**, with sharp disruptions around the 2008 crash (-12.6% YoY) and post-COVID rebound (+16.8% YoY in 2021).  
The **South and Mountain regions** have emerged as the strongest performers, while the **West remains the most volatile**.

---

### Key Highlights

| Indicator | Value | Period | Key Insight |
|------------|-------|--------|--------------|
| **Top Growth State** | **Idaho +11.8% CAGR** | 2015–2025 | Fastest sustained appreciation driven by migration and affordability |
| **Most Volatile State** | **Nevada – 9.6 volatility index** | 2000–2025 | Extreme boom–bust cycles tied to speculative activity |
| **Average U.S. Growth** | **+5.1% CAGR** | 2000–2025 | Long-term stable appreciation |
| **Peak National Surge** | **+16.8% YoY** | 2021 | Record-low interest rates and supply shortages |
| **Deepest Decline** | **-12.6% YoY** | 2009 | Post–subprime mortgage collapse |

---

> **Insight:** Idaho’s home values more than **tripled since 2010**, reflecting migration from high-cost coastal areas.  
> Nevada remains the most volatile market — with steep losses in 2008 and the fastest rebound by 2015.  
> The South’s affordability advantage has made it the nation’s post-pandemic growth leader.

---

### Regional Trends

The following snapshot summarizes average housing performance across major regions.

| Region | Avg Growth (CAGR) | Volatility | Market Characteristic |
|:--|:--:|:--:|:--|
| **West** | 6.2% | 8.7 | High-value, high-risk cyclical markets |
| **South** | 6.8% | 5.3 | Fastest growth; affordability-driven migration |
| **Midwest** | 4.1% | 3.9 | Stable, low-volatility appreciation |
| **Northeast** | 3.8% | 4.6 | Mature markets with moderate returns |

---

### Visual Summary

| Home Value Trends (2000–2025) | Rent Recovery (Post-COVID) |
|-------------------------------|-----------------------------|
| ![Regional Housing Trends](https://github.com/Qin717/us-housing-market-analytics/blob/main/01_zillow_home_value_index_analysis/outputs/charts/q6_regional_housing_value_trends.png) | ![Rent Recovery](https://github.com/Qin717/us-housing-market-analytics/blob/main/02_zillow_rent_value_index_analysis/outputs/charts/Q5_top10_states_by_rent_recovery_post_covid.png) |

*25-year comparison of regional home value growth and post-COVID rent recovery.*

---

## 4. Recommendations

**For Investors**
- Combine high-growth (South/Mountain) and low-volatility (Midwest) assets for balanced exposure.  
- Use volatility metrics to identify speculative risk zones and optimize timing.

**For Developers**
- Prioritize new projects in **affordable, fast-growing states** (TX, GA, NC, FL).  
- Align development with migration and income trends to maintain demand resilience.

**For Policymakers**
- Monitor **rent-to-income ratios** to prevent affordability crises.  
- Incentivize housing supply in high-demand regions to stabilize long-term growth.

**For Analysts & Researchers**
- Extend this dataset using **Python forecasting models (ARIMA, Prophet)**.  
- Integrate Census migration and income data to enrich future projections.

---

## 👤 Author
**Qin QIN**  
Data Analytics Portfolio | Real Estate · Market Trends · Visualization  
🔗 [GitHub Portfolio](https://github.com/Qin717) | [LinkedIn](https://www.linkedin.com/in/qinqin0717)






# U.S. Housing Market Analytics (2000–2025)

## 1. Project Background

The U.S. housing market — a $45 trillion cornerstone of the national economy — has undergone major cycles over the past 25 years:  
the early-2000s boom, the 2008 financial crash, a decade-long recovery, and the post-pandemic surge and correction.  
Understanding these shifts is essential for **investors, developers, and policymakers** seeking to manage risk, forecast demand, and identify long-term opportunities.

This portfolio analyzes **25 years of Zillow Research data (2000–2025)** through two complementary projects:

| Project | Toolset | Focus |
|----------|----------|-------|
| **01 · Zillow Home Value Index Analysis** | Excel (Power Query & Pivot Tables) | U.S. home-value growth, volatility, and regional resilience |
| **02 · Zillow Rent Value Index Analysis** | SQL (CTEs & Window Functions) | Rental-market growth, volatility, and post-COVID recovery |

> **Scope:** 50 states · 4 U.S. regions · 300 months of data (2000 – 2025)

---

## 2. Data Structure & Initial Checks

- **Datasets:**  
  - Zillow Home Value Index (ZHVI)  
  - Zillow Rent Index (ZORI)
- **Structure:** ~6 000 rows × 300 months each  
- **Granularity:** State & regional  
- **Processing Steps:**  
  - Cleaned and reshaped via Excel Power Query / SQL  
  - Aggregated monthly data to yearly averages  
  - Computed YoY Growth, CAGR, and Volatility (STDEV.P)  
  - Validated data consistency across years and regions  

---

## 3. Executive Summary

### 🏠 Project 1: Home Value Analysis (Excel)

#### Market Overview
From 2000 to 2025, U.S. home values grew at an average **+5.1% per year**, with sharp turning points:  
a **-12.6% drop in 2009** and a **+16.8% surge in 2021**.  
The **South and Mountain regions** outpaced the nation, while coastal markets in the West remained high-value but volatile.

#### Key Highlights
| Indicator | Value | Period | Insight |
|------------|-------|--------|---------|
| **Top Growth State** | **Idaho +11.8% CAGR** | 2015 – 2025 | Strong in-migration & affordability advantages |
| **Most Volatile State** | **Nevada (Volatility Index 9.6)** | 2000 – 2025 | Pronounced boom-bust cycles |
| **Fastest Recovery from 2008 Crash** | **Texas (≈ 3 yrs)** | 2008 – 2011 | Early rebound driven by diverse economy |
| **Peak National Growth** | **+16.8% YoY** | 2021 | Post-COVID demand and record-low rates |

> *Insight:* Home value growth has shifted from coastal metros to inland states offering space and affordability — a long-term structural trend in U.S. housing.

#### Regional Trends
| Region | Avg Growth (CAGR) | Volatility | Characteristic |
|:--|:--:|:--:|:--|
| **South** | 6.8% | 5.3 | Fastest appreciation; affordability-driven migration |
| **West** | 6.2% | 8.7 | High-value but cyclical markets |
| **Midwest** | 4.1% | 3.9 | Stable and predictable returns |
| **Northeast** | 3.8% | 4.6 | Mature markets with slower growth |

|  |  |
|--|--|
| ![Regional Housing Trends](https://github.com/Qin717/us-housing-market-analytics/blob/main/01_zillow_home_value_index_analysis/outputs/charts/q6_regional_housing_value_trends.png) | *25-year regional housing value trends (2000–2025).* |

---

### 🏢 Project 2: Rent Value Analysis (SQL)

#### Market Overview
Rental markets displayed parallel patterns but responded faster to macroeconomic shocks.  
From 2020 to 2025, rents rose **+35% in Southern states**, outpacing all other regions.  
Pandemic-era mobility and affordability migration shifted demand from urban centers to suburban and inland locations.

#### Key Highlights
| Indicator | Value | Period | Insight |
|------------|-------|--------|---------|
| **Fastest Rent Growth** | **Florida +41% (2020 – 2025)** | Post-COVID period | Remote work migration boosted demand |
| **Most Consistent Rent Market** | **Midwest (Volatility Index < 4)** | 2000 – 2025 | Stable affordability and low supply pressure |
| **Rent Rebound Leader** | **Texas (+29% YoY 2021)** | 2021 | Early pandemic recovery due to population growth |

|  |  |
|--|--|
| ![Rent Recovery](https://github.com/Qin717/us-housing-market-analytics/blob/main/02_zillow_rent_value_index_analysis/outputs/charts/Q5_top10_states_by_rent_recovery_post_covid.png) | *Top 10 states by post-COVID rent recovery (2020–2025).* |

---

## 4. Recommendations

**For Investors**  
- Combine high-growth (South/Mountain) and low-volatility (Midwest) markets to optimize risk-adjusted returns.  
- Monitor volatility as an early indicator of market corrections.

**For Developers**  
- Prioritize construction in fast-growing affordable states (TX, GA, NC, FL).  
- Use rental demand data to identify underserved regions with stable absorption rates.

**For Policymakers**  
- Target affordability and infrastructure support in regions experiencing rapid rent inflation.  
- Balance regional growth through supply-side and zoning incentives.

---

## 👤 Author
**Qin QIN**  
Data Analytics Portfolio | Real Estate · Market Trends · Visualization  
🔗 [GitHub Portfolio](https://github.com/Qin717) | [LinkedIn](https://www.linkedin.com/in/qinqin0717)
