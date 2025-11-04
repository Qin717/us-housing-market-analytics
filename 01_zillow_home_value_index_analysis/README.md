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

**Insight:** This analysis identifies the states with the highest average home value growth over the period.  
These states demonstrate strong appreciation trends driven by various factors including economic growth, population migration, and housing market dynamics.  

A chart can be downloaded [here](outputs/charts/q1_top10_u.s._states_by_average_home_value_growth.png).  

---

### 2. Top 5 U.S. States by Home Value Growth (Absolute vs Percentage)  

**Insight:** This analysis compares the top 5 states by both absolute dollar growth and percentage growth in home values.  
The visualization highlights how different states achieved growth through various patterns, showing both the magnitude of dollar increases and the relative percentage appreciation over the period.  

A chart can be downloaded [here](outputs/charts/q2_top5_u.s._states_by_home_value_growth_absolute_vs_percentage.png).

---

## Chart Overview (Visual Summary)

| Chart | Key Insight | Takeaway |
|--------|--------------|-----------|
| **Q1** | Top 10 states by average home value growth | States with highest long-term appreciation |
| **Q2** | Top 5 states by absolute vs percentage growth | Comparison of dollar growth vs percentage appreciation |
| **Q3** | Top 5 states with highest volatility | Volatility concentrated in tourism-driven markets |
| **Q4** | Impact and recovery from 2008 housing crash | Fastest post-crash rebounds in Sunbelt region |
| **Q5** | Regional housing value trends in the U.S. | Structural shift toward affordable, high-growth regions |

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

