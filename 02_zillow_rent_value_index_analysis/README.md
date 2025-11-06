# 💰 Zillow Rent Value Index Analysis (2015–2025)

---

## 🏙️ Background  
From 2015 to 2025, the U.S. rental housing market experienced a decade of strong divergence.  
While rents surged in high-demand states across the **West and Mountain regions**, many **Midwestern and Southern** markets remained comparatively stable and affordable.  
Understanding these differences is essential for **investors, developers, and policymakers** navigating housing affordability, investment risk, and long-term market sustainability.  

This project analyzes rent trends across all 50 U.S. states using the **Zillow Rent Index (ZORI)** — a measure of typical market rents weighted by housing stock.  
It forms part of the broader **U.S. Housing Market Analytics Portfolio**, which also examines **home-value** and **for-sale inventory** data to provide a comprehensive view of national housing dynamics.

---

## 📘 Executive Summary  
This analysis explores the evolution of the **Zillow Rent Index (ZORI)** between 2015 and 2025 to uncover long-term patterns and regional disparities.  
It focuses on three core dimensions:  
1. Rent growth trends across states.  
2. Rent volatility and market stability.  
3. The relationship between rent growth and home-value appreciation.  

The project demonstrates advanced **SQL analysis**, complemented by **Excel visualizations** that communicate insights clearly and effectively.

---

## 🎯 Objectives  
- Quantify rent growth across all 50 U.S. states during 2015–2025.  
- Measure volatility to identify stable versus high-risk rental markets.  
- Examine the relationship between rent growth and home-value appreciation.  
- Translate analytical findings into actionable business insights.  

---

## 🧾 Dataset Overview  
- **Source:** Zillow Rent Index (ZORI)  
- **Coverage:** 50 U.S. states | Monthly data from 2015–2025  
- **Metric Definition:** Typical market rent weighted by local housing characteristics.  
- **Transformation:** Monthly data aggregated into **annual averages** for trend and volatility analysis.  
- **Supplementary Data:** Zillow Home Value Index (ZHVI) for correlation analysis.  
- **Variables Derived:**  
  - Rent Growth (%)  
  - Year-over-Year % Change  
  - Rent Volatility (Standard Deviation of YoY %)  
  - Correlation with Home-Value Growth  

---

## ⚙️ Methodology  
1. **Data Cleaning:** Removed missing values, standardized state names, and ensured continuous annual coverage (2015–2025).  
2. **Aggregation:** Transformed monthly rent data into yearly averages to capture long-term trends.  
3. **Computation:** Calculated total rent growth, year-over-year changes, and volatility (standard deviation of YoY %).  
4. **Integration:** Combined rent metrics with home-value data to assess their relationship.  
5. **Visualization:** Created Excel charts illustrating rent growth, volatility, and correlation patterns.  

---

## 📊 Key Results  

---

### 🏠 1️⃣ Which U.S. States Experienced the Fastest and Slowest Rent Growth (2015–2025)?  

<p align="center">
  <img src="outputs/charts/q1_top_bottom_5_states_rent_growth_2015_2025.png"
       alt="Top and Bottom States by Rent Growth (2015–2025)"
       width="70%">
</p>

Between 2015 and 2025, rent values grew unevenly across the United States.  
**Colorado, Idaho, and Montana** led the nation with increases above **95 %**, while **Wisconsin** and **Louisiana** recorded growth below **20 %**.  
The data reveals a clear regional divide — Western states experienced the strongest rent escalation, whereas the Midwest and South remained more stable.  

💡 **Business Interpretation:**  
High-growth states indicate strong demand but growing affordability pressure, while slower-growth markets remain stable and accessible.  

---

### 📈 2️⃣ Where Were Rental Markets the Most Volatile — and Which States Remained Stable?  

<p align="center">
  <img src="outputs/charts/q2_top_bottom_5_states_rent_volatility.png"
       alt="Rent Volatility by U.S. State (2015–2025)"
       width="70%">
</p>

Rent fluctuations varied widely across regions.  
**Montana (11.8 %)**, **Vermont (8.3 %)**, and **Wyoming (6.7 %)** recorded the highest volatility, showing larger year-to-year swings.  
In contrast, **Ohio (1.7 %)**, **Missouri (1.9 %)**, and **Alabama (1.9 %)** remained the most stable, with minimal variation throughout the decade.  
These differences highlight contrasting market dynamics — some states saw sharp annual changes while others maintained consistent rental patterns.  

💡 **Business Interpretation:**  
High-volatility markets carry greater short-term potential and risk, while stable states offer predictable, long-term rental returns.  

---

### 💡 3️⃣ The Relationship Between Home-Value Appreciation and Rent Growth Across U.S. States (2015–2025)  

<p align="center">
  <img src="outputs/charts/q3_correlation_between_rent_growth_and_home_value_appreciation.png"
       alt="Relationship Between Home-Value Appreciation and Rent Growth (2015–2025)"
       width="70%">
</p>

The analysis reveals a **moderate positive relationship (R² = 0.38)** between rent growth and home-value appreciation.  
States with faster home-value increases generally experienced stronger rent growth, although the strength of this link varied by region.  
This pattern suggests that property and rental markets often move together, reflecting shared economic pressures.  

💡 **Business Interpretation:**  
As home values rise, rents tend to follow — reinforcing the relationship between property appreciation and rental affordability across states.  

---

## 💼 Business Implications & Recommendations  

**For Investors:**  
Balance exposure between high-growth (West, Mountain) and stable (Midwest, South) states to optimize returns while managing volatility.  
Use volatility metrics to evaluate cash-flow stability and risk.  

**For Developers:**  
Focus new construction in high-growth states such as **Colorado, Idaho, and Montana**.  
Use volatility insights to time market entry for better risk-adjusted returns.  

**For Policymakers:**  
Expand housing supply in rent-burdened states to mitigate affordability issues.  
Encourage zoning reforms and affordable-housing initiatives.  

**For Renters and Advocates:**  
Track regional rent trends to anticipate future cost-of-living changes.  
Consider stable markets for long-term affordability.  

---

## 🧠 Data Reproducibility & Transparency  
- All transformations and calculations are reproducible using SQL scripts in the `/sql_scripts/` folder.  
- Steps for data cleaning, aggregation, and metric calculation are clearly documented.  
- Excel visualizations reference processed outputs directly to ensure accuracy and consistency.  
- Anyone can replicate the analysis by running the SQL workflow and reviewing the charts.  

---

## 🚀 Next Steps  
- Expand analysis to **metro and county levels** for greater granularity.  
- Integrate **income and vacancy data** to model affordability risk and rental pressure.  
- Combine rent, home-value, and inventory datasets to study supply-demand relationships.  
- Develop an **interactive Tableau dashboard** connecting rent, value, and inventory metrics.  

---

⭐ *Part of the [U.S. Housing Market Analytics](https://github.com/Qin717/us-housing-market-analytics) portfolio — a data-driven exploration of America’s real-estate dynamics.*
