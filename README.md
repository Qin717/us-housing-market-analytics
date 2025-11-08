# U.S. For-Sale Listings Analysis (Zillow Inventory Data)  
### Project 03 | U.S. Housing Market Analytics Portfolio  

---

## Background  
This project analyzes how U.S. housing for-sale listings have changed from 2018 to 2025 using Zillow’s For-Sale Listings dataset.  
It measures state-level supply growth and benchmarks each state’s listings trend against the national average to identify which markets remain undersupplied.  
By linking inventory growth to home-price performance, the analysis reveals where limited supply continues to sustain price pressure and affordability challenges.  

---

## Executive Summary  
This project delivers a SQL- and Excel-based analysis of Zillow’s For-Sale Listings dataset to evaluate housing-supply dynamics across the United States.  
It cross-references Zillow Home Value Index (ZHVI) and Zillow Rent Index (ZORI) data to present a unified view of market balance.  
By examining how listings growth aligns with home-value and rent trends, the analysis identifies which states remain undersupplied, how this affects price pressure, and what it implies for long-term housing equilibrium.  

---

## Objectives  
- Measure **state-level listings growth** across the U.S. (2018–2025).  
- Track yearly **YoY listings growth** to reveal supply-recovery trends.  
- Examine how **inventory growth relates to home-value and rent growth** to understand market balance and affordability.  
- Benchmark each state against **national averages** to identify:  
  - Undersupplied markets with continued upward pressure  
  - Stable or recovering markets  
- Visualize results through clear, data-driven charts showing where supply recovery lags and price pressure remains strong.  

---

## Dataset Overview  

<div align="center">

| **Feature** | **Description** |
|--------------|----------------|
| **Source** | Zillow Research – For-Sale Listings Inventory |
| **Coverage** | 2018 – 2025 |
| **Geography** | 50 U.S. states |
| **Frequency** | Monthly → aggregated to yearly averages |
| **Metrics** | Listings YoY Growth (%) and Price YoY Growth (%) |
| **File** | [Zillow_For_Sale_Listings_State.csv](https://github.com/Qin717/us-housing-market-analytics/blob/main/03_for_sale_listings_analysis/raw_data/Zillow_For_Sale_Listings_State.csv) |

</div>

---

## Methodology (SQL + Excel Workflow)  

**Data Cleaning:** Filtered Zillow data (2018–2025) and standardized state names.  
**Aggregation:** Converted monthly listings into yearly state averages.  
**Computation:** Calculated yearly growth for listings, prices, and rents.  
**Integration:** Merged supply data with home-value and rent trends.  
**Visualization:** Built Excel charts to show growth patterns and undersupplied states.  

---

## Key Results & Visualizations  

### 1️⃣ How Have For-Sale Listings Evolved Across States (2018–2025)?


**Insight:**  
Inventory recovery across the U.S. has been broad but uneven. Southern and Mountain West markets—particularly Florida, Texas, and South Carolina—have shown sustained expansion in listings since 2020, driven by population inflows and land availability. In contrast, the Northeast and parts of the Midwest remain supply-constrained, reflecting slower permitting processes, higher construction costs, and limited developable land.

**Business Interpretation:**  
The divergence in supply growth indicates structural differences in market elasticity. Regions with higher development capacity and pro-growth zoning continue to absorb national housing demand, while mature, land-limited markets are structurally undersupplied. This imbalance reinforces long-term affordability pressures and highlights how regional construction capacity has become a key determinant of market stability.

---

### 2️⃣ What Is the Relationship Between Inventory Growth and Home-Value Growth?



<div align="center">
  <img src="https://github.com/Qin717/us-housing-market-analytics/blob/main/03_for_sale_listings_analysis/outputs/charts/q2_correlation_inventory_home_value_growth_2018_2025.png?raw=true" alt="Correlation between Inventory and Home-Value Growth" width="70%">
</div>  

**Insight:**  
Correlation analysis reveals that home-value growth is largely insensitive to short-term inventory fluctuations (R² ≈ 0.01). In most states, prices continued to rise despite increasing listings, suggesting that demand-side factors such as income growth, household formation, and borrowing costs play a more dominant role than supply adjustments in the near term.

**Business Interpretation:**  
This pattern underscores the inelastic nature of housing prices in the short run. Even when new listings increase, the market’s ability to translate supply expansion into price moderation remains limited without parallel adjustments in demand fundamentals. Long-term price stability depends on persistent, multi-year increases in housing stock rather than cyclical listing growth.

---

### 3️⃣ How Does Inventory Growth Compare with Rent Growth?


**Insight:**  
A mild inverse relationship exists between inventory growth and rent appreciation. States that experienced limited supply expansion—such as Hawaii, New York, and Massachusetts—also recorded the highest rent growth, while those with faster inventory recovery, including Texas and Georgia, saw comparatively stable rental prices.

**Business Interpretation:**  
The data confirm that rental affordability and ownership supply are interlinked. Markets with restricted for-sale inventory tend to experience downstream rent inflation, as constrained ownership options push demand into the rental sector. Sustained rental pressure signals broader structural tightness across both ownership and rental markets, emphasizing the need for balanced housing production across tenure types.

---

### 4️⃣ Which Markets Remain Undersupplied and Face Continued Upward Pressure?


**Insight:**  
As of 2024, roughly half of U.S. states remain below the national average in listings growth (11.5%) while exceeding the national average in price growth (3.65%). This cluster—led by Connecticut, New Jersey, and Rhode Island—exhibits persistent undersupply alongside continued home-value acceleration, indicating long-standing constraints on new housing production.

**Business Interpretation:**  
These results highlight persistent structural shortages rather than temporary market imbalances. States with chronically low supply elasticity and high price persistence are likely to maintain upward price pressure through 2025 and beyond. Without significant increases in housing starts, these regions risk prolonged affordability erosion and declining mobility within local labor markets.

---

### 5️⃣ How Do States Compare to National Supply Benchmarks?



<div align="center">
  <img src="https://github.com/Qin717/us-housing-market-analytics/blob/main/03_for_sale_listings_analysis/outputs/charts/q5_undersupplied_markets_vs_national_averages.png?raw=true" alt="Undersupplied Markets vs National Averages" width="70%">
</div>  

**Insight:**  
When benchmarked against national averages, most Southern and Mountain West states exhibit inventory growth above 11.5%, while many Northeastern markets remain below. The regional divide suggests that supply recovery is concentrated in states with more flexible development environments and stronger in-migration, while legacy markets are adjusting more slowly.

**Business Interpretation:**  
The uneven recovery underscores a structural bifurcation of the U.S. housing market. Supply-responsive regions are gradually stabilizing, with inventory levels returning toward pre-2020 norms, while supply-constrained regions remain chronically tight. This geographic imbalance will continue to influence national affordability, migration trends, and regional investment patterns.

---

## Business Implications & Recommendations  

Persistent regional disparities highlight that housing supply is a **structural, not cyclical, variable**.  
- In supply-responsive regions, inventory levels are normalizing and price growth is cooling gradually, signaling a transition toward balance.  
- In constrained regions, limited land availability and restrictive zoning continue to suppress new construction, sustaining affordability pressures.  
- A coordinated policy focus on land-use flexibility, permitting reform, and infrastructure expansion is essential to achieve long-term market stability.  

---

## Next Steps  
- Extend analysis to metro- and ZIP-level inventory patterns.  
- Integrate rental and vacancy datasets for a complete supply-demand assessment.  
- Develop an interactive Tableau dashboard to visualize regional recovery trajectories.  

---

## Data Attribution  
Data © Zillow Group, Inc. – For-Sale Listings Inventory (2025)  
Used under Zillow Research Terms of Use.  
Analysis conducted for educational and non-commercial purposes.  

---

## 👤 Author

**Qin Qin**  
Data Analytics Portfolio | Real Estate · Market Trends · Visualization  
🔗 [GitHub Portfolio](https://github.com/Qin717) | [LinkedIn](https://www.linkedin.com/in/qinqin0717)

---

> 🧩 *This portfolio demonstrates an end-to-end analytics workflow — from data cleaning and SQL aggregation to Python visualization and storytelling — designed to extract actionable insights from Zillow’s long-term U.S. housing data.*
