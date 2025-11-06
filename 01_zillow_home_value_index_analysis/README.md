# Project 01 – Zillow Home Value Index Analysis (Excel-Based)

> **Business Question:**  
> How have U.S. home values evolved across all 50 states from 2000 to 2025, and which regions delivered the best long-term, risk-adjusted appreciation for investors, developers, and policymakers?

---

## Objective
This project analyzes long-term housing-price dynamics using the **Zillow Home Value Index (ZHVI)** dataset.  
It serves as the **foundation of the U.S. Housing Market Analytics portfolio**, establishing the price-trend baseline before later modules explore rental values (Project 02) and for-sale inventory (Project 03).

---

## Dataset Overview
- **Source:** [Zillow Research – ZHVI](https://www.zillow.com/research/data/)  
- **Metric:** *Typical home value* (seasonally adjusted, single-family homes)  
- **Coverage:** 2000 – 2025  |  **Frequency:** Monthly → aggregated to yearly averages  
- **Granularity:** State-level (50 states + District of Columbia)  
- **Files in `/data`**  
  - `/data/raw/zillow_home_value_raw_data.csv`  
  - `/data/clean/home_values_yearly_clean.csv`  
  - `/data/clean/home_value_yoy_growth.csv`

> **About ZHVI:** Zillow's Home Value Index is a smoothed, seasonally adjusted estimate of typical home values for a given region and time. It reflects broad market trends rather than individual transactions.

---

## Analytical Flow
1. **Define the Question & Context** – Identify long-term state-level growth and volatility.  
2. **Data Cleaning (Power Query)** – Remove missing years, aggregate monthly values to annual averages.  
3. **Metric Computation (Excel Formulas)** – CAGR (2000-2025), YoY Growth %, Volatility (STDEV.P).  
4. **Exploration & Visualization** – Five Excel files (q1–q5) each answer a specific business question.  
5. **Insight Synthesis** – Compare regional patterns and highlight top & bottom performers.  
6. **Business Recommendations & Next Steps** – Summarize investment and policy implications; connect to rental (Project 02) and inventory (Project 03) analyses.

---

## Question-Specific Analysis

### 1. Top 10 U.S. States by Average Home Value Growth  

**Concept:** This analysis identifies the states with the highest average home value growth over the 2000-2025 period. The metric uses average annual home values across all years to highlight states with consistent long-term appreciation trends.

![Top 10 States by Average Home Value Growth](outputs/charts/q1_top10_states_by_average_home_value_growth.png)

---

### 2. Top 5 U.S. States by Home Value Growth (Absolute vs Percentage)  

**Concept:** This analysis compares the top 5 states by both absolute dollar growth and percentage growth in home values. The dual-metric approach differentiates between high-value markets (large absolute gains) and high-growth markets (high percentage appreciation).

![Top 5 States by Home Value Growth (Absolute vs Percentage)](outputs/charts/q2_top5_states_by_home_value_growth_absolute_vs_percentage.png)

---

### 3. Top 5 U.S. States with the Most Volatile Home Values  

**Concept:** This analysis identifies states with the most price fluctuation and market instability by measuring the standard deviation of year-over-year growth rates. Volatility serves as a risk assessment metric, helping investors and policymakers understand market stability.

![Top 5 U.S. States with the Most Volatile Home Values](outputs/charts/q3_top5_u.s. _states_with_the_most_volatile_home_values.png)

---

### 4. Housing Market Crash to Recovery (2007-2015)  

**Concept:** This analysis examines the impact of the 2008 financial crisis and tracks recovery timelines by state. It identifies pre-crash peak values, measures crash depth, and determines when each state regained pre-crash levels.

![Housing Market Crash to Recovery 2007-2015](outputs/charts/q4_housing_market_crash_to_recovery_2007_2015.png)

---

### 5. Home Value Trends Vary Across U.S. Regions  

**Concept:** This analysis identifies regional patterns and trends by aggregating state-level values into four U.S. Census regions (Northeast, Midwest, South, West). It reveals broader economic and demographic influences beyond individual state performance.

![Home Value Trends Vary Across U.S. Regions](outputs/charts/q5_home_value_trends_vary_across_u.s._regions.png)

---

## Key Insights & Findings

- **National Growth:**  
  Average U.S. home values increased **+145% (2000–2025)**, equivalent to **CAGR ≈ 3.7%**.
  
- **Regional Outperformance:**  
  The **South and West regions** doubled their average home values — **CAGR 5.8% vs 3.2% in Northeast/Midwest**.
  
- **Volatility Gap:**  
  Volatility (STDEV.P of YoY growth) ranged from **4% (IA)** to **14% (NV)** — a **3.5× spread** in market stability.
  
- **Crisis & Recovery:**  
  Post-2008, **12 states regained pre-crash levels by 2015**, led by NV, AZ, and FL; others (NJ, IL) lagged until 2018+.
  
- **Risk–Return Relationship:**  
  States with **CAGR > 5%** also exhibit **volatility < 9%**, suggesting a favorable risk-return profile in TX, TN, AZ.

---

## Business Implications

| Stakeholder | What It Means | Recommended Action |
|--------------|---------------|--------------------|
| **Investors** | Growth leaders (TX, TN, AZ, ID) offer strong appreciation & moderate volatility | Prioritize diversification into inland states |
| **Developers** | Supply constraints + high CAGR zones = new development opportunities | Focus on suburban South & West corridors |
| **Policymakers** | Rising volatility + affordability risk in coastal metros | Promote balanced supply & lending policies |

---

## Deliverables Summary

- `/data/clean/home_values_yearly_clean.csv` – yearly state-level ZHVI data  
- `/excel/q1_q6_analysis_files.xlsx` – Excel-based analyses and dashboards  
- `/outputs/charts/*.png` – exported visuals  
- `/outputs/summary/zhvi_summary.pdf` – optional one-page executive dashboard  

---

## 📜 Citation

> Zillow Research (2025). *Zillow Home Value Index (ZHVI), 2000–2025.*  
> [https://www.zillow.com/research/data/](https://www.zillow.com/research/data/)

