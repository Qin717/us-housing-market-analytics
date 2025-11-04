# 🏡 Project 01 – Zillow Home Value Index Analysis (Excel-Based)

> **Business Question:**  
> How have U.S. home values evolved across all 50 states from 2000 to 2025, and which regions delivered the best long-term, risk-adjusted appreciation for investors, developers, and policymakers?

---

## 🎯 Objective
This project analyzes long-term housing-price dynamics using the **Zillow Home Value Index (ZHVI)** dataset.  
It serves as the **foundation of the U.S. Housing Market Analytics portfolio**, establishing the price-trend baseline before later modules explore rental values (Project 02) and for-sale inventory (Project 03).

---

## 🧩 Dataset Overview
- **Source:** [Zillow Research – ZHVI](https://www.zillow.com/research/data/)  
- **Metric:** *Typical home value* (seasonally adjusted, single-family homes)  
- **Coverage:** 2000 – 2025  |  **Frequency:** Monthly → aggregated to yearly averages  
- **Granularity:** State-level (50 states + District of Columbia)  
- **Files in `/data`**  
  - `/data/raw/zillow_home_value_raw_data.csv`  
  - `/data/clean/home_values_yearly_clean.csv`  
  - `/data/clean/home_value_yoy_growth.csv`

> **About ZHVI:** Zillow’s Home Value Index is a smoothed, seasonally adjusted estimate of typical home values for a given region and time. It reflects broad market trends rather than individual transactions.

---

## 🔍 Analytical Flow
1. **Define the Question & Context** – Identify long-term state-level growth and volatility.  
2. **Data Cleaning (Power Query)** – Remove missing years, aggregate monthly values to annual averages.  
3. **Metric Computation (Excel Formulas)** – CAGR (2000-2025), YoY Growth %, Volatility (STDEV.P).  
4. **Exploration & Visualization** – Six Excel files (q1–q6) each answer a specific business question.  
5. **Insight Synthesis** – Compare regional patterns and highlight top & bottom performers.  
6. **Business Recommendations & Next Steps** – Summarize investment and policy implications; connect to rental (Project 02) and inventory (Project 03) analyses.

---

---

## 📊 Key Analyses (Q1–Q6)

Each Excel workbook in the `/excel` folder answers one analytical question about U.S. home-value dynamics using the cleaned ZHVI dataset (2000–2025):

| ID | Excel Workbook | Analytical Focus | Output Chart |
|----|----------------|------------------|---------------|
| **Q1** | `q1_top10_states_average_values.xlsx` | Which states have the highest overall home values? | `q1_top10_states_average_values.png` |
| **Q2** | `q2_top5_home_values_growth.xlsx` | Which states show the strongest long-term CAGR (2000–2025)? | `q2_top5_home_values_growth.png` |
| **Q3** | `q3_top5_cities_absolute_and_percentage_growth.xlsx` | Which cities led in both absolute and percentage growth? | `q3_top5_cities_absolute_and_percentage_growth.png` |
| **Q4** | `q4_top5_states_highest_volatility.xlsx` | Which states experienced the highest price volatility (STDEV.P of YoY)? | `q4_top5_states_highest_volatility.png` |
| **Q5** | `q5_housing_market_crash_to_recovery_2007_2015.xlsx` | How did state markets recover after the 2008 housing crash? | `q5_housing_market_crash_to_recovery_2007_2015.png` |
| **Q6** | `q6_regional_housing_value_trends.xlsx` | What are the long-term regional trends (Northeast, Midwest, South, West)? | `q6_regional_housing_value_trends.png` |

---

## 🧭 Chart Overview (Visual Summary)

| Chart | Key Insight | Takeaway |
|--------|--------------|-----------|
| 🗺️ **Q1** | CA, TX, and FL dominate in absolute home values | Coastal states lead pricing; TX shows fast catch-up |
| 📈 **Q2** | Top CAGR: TX (+6.3%), ID (+6.1%), TN (+5.8%) | Sunbelt states outperform national median growth |
| 🏙️ **Q3** | Boise, Austin, and Phoenix show strongest % + absolute growth | Hybrid value + affordability advantage |
| ⚖️ **Q4** | NV (14%) and FL (13.5%) most volatile; IA & OH < 5% | Volatility concentrated in tourism-driven markets |
| 💥 **Q5** | NV & AZ recovered to 2007 levels by 2015 | Fastest post-crash rebounds in Sunbelt region |
| 🌎 **Q6** | South & West outperform Northeast & Midwest since 2010 | Structural shift toward affordable, high-growth regions |

> **Visual Consistency Tip:**  
> All six charts use the same color palette, labels, and title format for professional presentation.  
> (Theme: *Muted blues + orange highlights for top performers*)

---

## 📈 Key Insights & Findings

- 🏠 **National Growth:**  
  Average U.S. home values increased **+145% (2000–2025)**, equivalent to **CAGR ≈ 3.7%**.
  
- 🌞 **Regional Outperformance:**  
  The **South and West regions** doubled their average home values — **CAGR 5.8% vs 3.2% in Northeast/Midwest**.
  
- ⚖️ **Volatility Gap:**  
  Volatility (STDEV.P of YoY growth) ranged from **4% (IA)** to **14% (NV)** — a **3.5× spread** in market stability.
  
- 💥 **Crisis & Recovery:**  
  Post-2008, **12 states regained pre-crash levels by 2015**, led by NV, AZ, and FL; others (NJ, IL) lagged until 2018+.
  
- 🧮 **Risk–Return Relationship:**  
  States with **CAGR > 5%** also exhibit **volatility < 9%**, suggesting a favorable risk-return profile in TX, TN, AZ.

---

## 💡 Business Implications

| Stakeholder | What It Means | Recommended Action |
|--------------|---------------|--------------------|
| **Investors** | Growth leaders (TX, TN, AZ, ID) offer strong appreciation & moderate volatility | Prioritize diversification into inland states |
| **Developers** | Supply constraints + high CAGR zones = new development opportunities | Focus on suburban South & West corridors |
| **Policymakers** | Rising volatility + affordability risk in coastal metros | Promote balanced supply & lending policies |

---

## ⚠️ Limitations & Next Steps

- **Scope:** Analysis focuses only on *single-family ZHVI*; condos and rentals excluded.  
- **Inflation Adjustment:** Figures are nominal; real returns will be incorporated in later stages.  
- **Regional Aggregation:** Regional classifications follow U.S. Census definitions (NE, MW, S, W).  
- **Future Work:**  
  - Integrate **rental metrics (ZORI)** to assess price–rent ratios (Project 02)  
  - Compare **for-sale inventory trends** to supply tightness (Project 03)  
  - Merge into **04_market_synthesis** for price–rent–supply relationship analysis  

---

## 🔗 Project Context

This first module establishes the foundation for the **U.S. Housing Market Analytics (2000–2025)** portfolio.  
→ Next: [Project 02 – Zillow Rent Value Index Analysis](../02_zillow_rent_value_index_analysis)  
→ Followed by: [Project 03 – For-Sale Listings Analysis](../03_for_sale_listings_analysis)

---

## 🏁 Deliverables Summary

- `/data/clean/home_values_yearly_clean.csv` – yearly state-level ZHVI data  
- `/excel/q1_q6_analysis_files.xlsx` – Excel-based analyses and dashboards  
- `/outputs/charts/*.png` – exported visuals  
- `/outputs/summary/zhvi_summary.pdf` – optional one-page executive dashboard  

---

## 📜 Citation

> Zillow Research (2025). *Zillow Home Value Index (ZHVI), 2000–2025.*  
> [https://www.zillow.com/research/data/](https://www.zillow.com/research/data/)

