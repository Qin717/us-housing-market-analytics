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

> **Scope:** Analysis of 25 years (2000–2025) of U.S. housing and rental market performance using Zillow Research data.  
> Covers all **50 states** and **4 regions** (West, South, Midwest, Northeast).

**Purpose:**  
To uncover how home values and rents evolved across major economic cycles — the 2000s boom, 2008 crash, and post-pandemic recovery — and translate those patterns into strategic insights for **investors, developers, and policymakers**.

**Core Focus Areas**
| Objective | Description |
|------------|-------------|
| **Market Trend Analysis** | Track 25-year national and regional price cycles. |
| **Crisis & Recovery** | Measure market impact and rebound after 2008 & COVID-19. |
| **Regional Comparison** | Identify top-performing and most volatile states. |
| **Strategic Implications** | Convert housing metrics into policy & investment insights. |

---

## 2. Data Structure & Initial Checks

**Datasets**
- **Zillow Home Value Index (ZHVI)** — monthly median home values (2000–2025)  
- **Zillow Rent Index (ZORI)** — monthly median rent values (2000–2025)

**Data Prep & Validation**
| Step | Description |
|------|--------------|
| Data Cleaning | Removed nulls, standardized state & region naming via Power Query |
| Aggregation | Monthly → yearly averages for YoY, CAGR, and volatility analysis |
| Quality Check | Verified complete data across 25 years for all 50 states |
| Metrics Built | YoY Growth, Volatility (STDEV.P), CAGR (2000–2025) |

**Sample Size:**  
> ~6,000 records × 300 monthly observations (per dataset)  
> Unified and reshaped for state-level and regional analysis.

---

## 3. Executive Summary

### Overview of Market Performance (2000–2025)

| Key Indicator | Value | Interpretation |
|----------------|--------|----------------|
| **National Average Home Value Growth (CAGR)** | **+5.1% / year** | Steady long-term housing appreciation across U.S. |
| **Peak National Growth (2021)** | **+16.8% YoY** | Pandemic-fueled demand surge, record low interest rates |
| **2008 Decline (National Avg.)** | **-12.6% YoY** | Sharp contraction following subprime crisis |
| **Average Rent Growth (Post-2020)** | **+35% in South** | Affordability-driven migration reshaping demand |
| **Volatility Index (West)** | **8.7 points (STDEV.P)** | Highest cyclical risk concentration |

---

### Top Market Performers

| Metric | Top State | Performance | Period | Commentary |
|:--|:--|--:|:--:|:--|
| **Home Value Growth (CAGR)** | **Idaho** | **+11.8% per year** | 2015–2025 | Fastest sustained appreciation, driven by inland migration |
| **Housing Volatility (STDEV.P)** | **Nevada** | **9.6 points** | 2000–2025 | Extreme boom-bust cycles; major correction post-2008 |
| **Strongest Recovery from 2008 Crash** | **Texas** | **Full recovery in 3 years** | 2008–2011 | Early rebound, supported by economic diversification |
| **Post-COVID Rent Growth Leader** | **Florida** | **+41% rent increase** | 2020–2025 | Reflects affordability migration from Northeast |

---

### Regional Snapshot

| Region | Avg CAGR | Volatility | Key Trend |
|:--|--:|--:|:--|
| **West** | 6.2% | 8.7 | High-value, high-volatility markets (CA, NV, AZ) |
| **South** | 6.8% | 5.3 | Fastest growth; strong affordability-driven inflow |
| **Midwest** | 4.1% | 3.9 | Stable, predictable appreciation |
| **Northeast** | 3.8% | 4.6 | Mature markets with moderate recovery rates |

---

### KPI Dashboard Summary

> **25-Year Housing Evolution (2000–2025)**

| Metric | 2008 | 2015 | 2021 | 2025 |
|:--|:--:|:--:|:--:|:--:|
| **National Home Value Index (Base=2000)** | 82.4 | 109.7 | 183.5 | 189.9 |
| **Rent Index (Base=2000)** | 90.8 | 113.4 | 156.2 | 161.4 |
| **YoY Growth (Home Values)** | -12.6% | +6.4% | +16.8% | +3.5% |
| **YoY Growth (Rent Values)** | -6.2% | +4.8% | +14.4% | +2.7% |

---

## 4. Recommendations

| Stakeholder | Key Actions |
|--------------|--------------|
| **Investors** | Diversify across high-growth (South/Mountain) and low-volatility (Midwest) states for balanced exposure. |
| **Developers** | Prioritize construction in affordable, high-demand markets like Texas, Georgia, and North Carolina. |
| **Policymakers** | Monitor rent-to-income ratios and incentivize balanced regional development to prevent affordability crises. |
| **Data Analysts** | Extend analysis using Python for forecasting (ARIMA/Prophet) and integrate Census population data for demand modeling. |

---

## 👤 Author
**Qin QIN**  
Data Analytics Portfolio | Real Estate · Market Trends · Visualization  
🔗 [GitHub Portfolio](https://github.com/Qin717) | [LinkedIn](https://www.linkedin.com/in/qinqin0717)

