<!-- Zillow Logo -->
<p align="center">
  <img src="./assets/z-logo-default.svg" alt="Zillow Logo" width="220">
</p>



# U.S. Housing Market Performance Report (2000–2025)

End-to-End Insights Across Zillow Home Values, Rents, and Inventory  
A data-analytics portfolio combining SQL, Python, and Excel to uncover how housing prices, rents, and supply evolved through multiple U.S. market cycles.

## Client Background

Zillow is the United States' leading digital real-estate marketplace, curating nationwide data on home values, rental prices, and for-sale listings. Established in 2006, the company’s housing research platform has become the industry benchmark for measuring property-market trends across all 50 states.

As the U.S. housing market entered two decades of economic transformation — spanning the 2008 housing crash, post-crisis recovery, pandemic-driven surge, and post-2022 affordability reset — Zillow’s datasets provide an unparalleled window into how property values, rents, and inventory levels evolved across states and regions.

This portfolio converts over 108,000 data observations from Zillow Research into actionable insights that help investors, developers, and policymakers understand market cycles, assess regional performance, and anticipate future affordability pressures.

Reporting to housing-sector stakeholders, this comprehensive analysis evaluates Zillow data from 2000 to 2025 to surface key patterns in value appreciation, rent growth, and inventory shifts — and connects them to underlying economic realities.

## Northstar Metrics

The report focuses on four primary lenses of housing-market performance:

- Home Value Trends: Long-term appreciation, volatility cycles, and regional divergence (2000–2025).
- Rent Value Trends: Rental inflation, affordability, and correlation to home values (2015–2025).
- For-Sale Inventory Trends: Supply recovery, structural shortages, and post-pandemic resilience (2018–2025).
- Cross-Metric Relationships: Interactions between supply, home values, and rents that drive affordability.

## Executive Summary

Project 01 — Home Value Index Analysis (2000–2025)

Over 25 years of Zillow Home Value Index (ZHVI) data show that U.S. home values rose by +140% (from $153K to $366K).  
While national appreciation has been strong, it masks widening volatility gaps: Mountain West and Sun Belt states led growth post-2011, while Midwest states displayed steady resilience. The 2008 crash revealed that regions with flexible supply and affordability — like Arizona and Colorado — recovered faster than constrained coastal markets.

Project 02 — Rent Value Index Analysis (2015–2025)

Across a decade of Zillow Rent Index (ZORI) data, rents surged over 95% in Western markets but grew less than 20% in the Midwest and South. Rental volatility peaked between 2021–2022, reflecting migration and affordability stress. Rent and home-value appreciation remain moderately correlated (R² = 0.38), confirming that both ownership and rental pressures move together.

Project 03 — For-Sale Inventory Analysis (2018–2025)

Post-pandemic inventory data reveal that nearly half of U.S. states remain structurally undersupplied.  
Despite listing growth in flexible Southern and Mountain West regions, home prices show minimal short-term sensitivity (R² ≈ 0.01) to inventory fluctuations — proving that affordability challenges stem from chronic supply deficits rather than temporary demand shocks.

Overall takeaway: The U.S. housing market’s affordability crisis is structural — fueled by long-term supply shortages, regional migration, and persistent price inelasticity.

## Dataset Structure and ERD

| Dataset | Coverage | Key Metrics | Purpose |
|----------|-----------|-------------|----------|
| ZHVI (Home Values) | 2000–2025 | Median value, YoY %, CAGR, volatility | Measure appreciation, resilience, and volatility |
| ZORI (Rent Index) | 2015–2025 | Typical rent, YoY %, volatility | Track rental inflation and affordability |
| For-Sale Inventory | 2018–2025 | Listings count, YoY %, supply ratio | Benchmark supply and housing tightness |

ZHVI (state, year, zhvi) ──┬──► joined on [state, year]
ZORI (state, year, zori) ──┤
LISTINGS (state, year, inventory) ──┘
→ Output Table: avg_for_sale_listings_state_yearly_int


---

## Insights Deep-Dive

### Project 01 — Home Value Index Analysis (2000–2025)

#### 1. How have home values evolved nationally over 25 years?

<div align="center">
  <img src="01_zillow_home_value_index_analysis/outputs/charts/q1_top10_states_by_average_home_value_growth.png" width="700">
</div>

U.S. median home values increased +140% (from $153K in 2000 to $366K in 2025).  
The appreciation trend reflects sustained demand, constrained new supply, and demographic migration toward mid-cost states.  
The Mountain West (ID, UT, CO) emerged as the new growth frontier, while coastal markets (CA, HI) retained top-tier valuations despite slower gains.

#### 2. Which states achieved the fastest sustained home-value growth?

<div align="center">
  <img src="01_zillow_home_value_index_analysis/outputs/charts/q2_top5_states_by_home_value_growth_absolute_vs_percentage.png" width="700">
</div>

Idaho (+290%) and Utah (+240%) led the nation in percentage growth, driven by affordability and inbound migration.  
Hawaii, though slower in percentage terms, added over $650K per home — underscoring the persistence of premium-market value retention.  
→ Combined, these trends mark a geographic redistribution of wealth creation across housing markets.

#### 3. Which markets were most volatile versus most stable?

<div align="center">
  <img src="01_zillow_home_value_index_analysis/outputs/charts/q3_top5_u.s.%20_states_with_the_most_volatile_home_values.png" width="700">
</div>

Western markets such as Nevada, Arizona, and Florida showed volatility above 10%, while Iowa, Alaska, and Louisiana remained below 4%.  
This divergence indicates that supply elasticity and income stability strongly govern market risk levels.

#### 4. How did states experience and recover from the 2008 housing crash?

<div align="center">
  <img src="01_zillow_home_value_index_analysis/outputs/charts/q4_housing_market_crash_to_recovery_2007_2015.png" width="700">
</div>

Coastal and speculative states lost more than 20% of value in 2008–2010, while affordable markets (AZ, WY, OK) rebounded within five years.  
Markets with flexible construction pipelines recovered fastest — evidence that supply responsiveness improves crisis resilience.

#### 5. How do regional housing cycles differ across the U.S.?

<div align="center">
  <img src="01_zillow_home_value_index_analysis/outputs/charts/q5_home_value_trends_vary_across_u.s._regions.png" width="700">
</div>

Western markets show wide amplitude (+16% to –17%), whereas the Midwest and Northeast remain stable with single-digit variation.  
This dual-speed structure underscores the strategic value of regional diversification for both investors and policymakers.

---

### Project 02 — Rent Value Index Analysis (2015–2025)

#### 1. Which states experienced the fastest and slowest rent growth?

<div align="center">
  <img src="./02_zillow_rent_value_index_analysis/outputs/charts/q1_top_bottom_5_states_rent_growth_2015_2025.png" width="700">
</div>

Rents rose over 95% in Colorado, Idaho, and Montana, versus less than 20% in Wisconsin, Louisiana, and Alabama.  
The West’s explosive rent growth reflects concentrated demand, limited multifamily stock, and pandemic-era migration trends.

#### 2. Which rental markets were the most volatile or stable?

<div align="center">
  <img src="./02_zillow_rent_value_index_analysis/outputs/charts/q2_top_bottom_5_states_rent_volatility.png" width="700">
</div>

Volatility peaked in Montana (11.8%) and Vermont (8.3%), while Ohio, Missouri, and Alabama maintained sub-2% variation.  
This highlights two distinct profiles: speculative high-yield markets versus stable cash-flow markets preferred by institutional investors.

#### 3. What is the relationship between rent growth and home-value appreciation?

<div align="center">
  <img src="./02_zillow_rent_value_index_analysis/outputs/charts/q3_correlation_between_rent_growth_and_home_value_appreciation.png" width="700">
</div>

A moderate positive correlation (R² = 0.38) indicates rents generally rise in tandem with home values, with a 6–12 month lag.  
This interdependence confirms that ownership and rental affordability cannot be addressed in isolation.

---

### Project 03 — For-Sale Inventory Analysis (2018–2025)

#### 2. What is the relationship between inventory growth and home-value change?

<div align="center">
  <img src="./03_for_sale_listings_analysis/outputs/charts/q2_correlation_inventory_home_value_growth_2018_2025.png" width="700">
</div>

Correlation is near zero (R² ≈ 0.01) — prices remain elevated even as listings increase.  
Demand strength and long-term supply deficits dominate short-term price adjustments.

#### 5. Which states remain structurally undersupplied?

<div align="center">
  <img src="./03_for_sale_listings_analysis/outputs/charts/q5_undersupplied_markets_vs_national_averages.png" width="700">
</div>

Connecticut, New Jersey, and Rhode Island remain below national inventory recovery levels yet continue to post above-average price growth.  
These states represent entrenched supply bottlenecks with elevated affordability risk.

---

### Cross-Metric Summary

Home values and rents move together, with rent growth lagging ownership cycles by roughly one year.  
Inventory recovery correlates negatively with both value and rent acceleration, confirming supply constraints as the primary affordability driver.  
Elastic markets (TX, FL, CO) maintain price stability and rental balance, while constrained markets (HI, MA, NJ) remain under chronic affordability stress.  
→ Collectively, the data confirms that supply elasticity—not demand fluctuation—is the defining determinant of long-term housing affordability.

---

## Key Recommendations

| Focus Area | Recommendation | Strategic Rationale |
|-------------|----------------|---------------------|
| Supply Expansion | Streamline permits and zoning to accelerate construction in undersupplied regions. | Structural shortages are the root cause of affordability issues. |
| Portfolio Diversification | Balance volatile, high-growth Western states with steady Midwest markets. | Reduces portfolio risk and ensures stable returns. |
| Affordability Alignment | Prioritize multifamily and rental housing investment in high-growth regions. | Tackles parallel pressures in both ownership and rental markets. |
| Cross-Metric Monitoring | Create dashboards combining ZHVI, ZORI, and Inventory trends. | Enables early detection of affordability shifts. |
| Policy Innovation | Support housing trust funds and infrastructure financing. | Promotes long-term, sustainable supply growth. |

---

## Analytics Workflow and Tooling

Data Engineering: SQL CTEs and Excel Power Query for reshaping time-series data.  
Analysis: Python (Pandas, NumPy) and Excel for calculating growth, volatility, and correlation.  
Visualization: Matplotlib, Excel charts, and Tableau dashboards for presentation-ready visuals.  
Validation: Cross-checks between values, rents, and inventory data.  
Storytelling: Executive summaries and investor-focused narratives translating analytics into strategic decisions.

---

## Cross-Market Insights

Affordability is structurally constrained — inventory shortages keep both prices and rents high.  
Migration reshapes opportunity — Mountain West and Sun Belt regions attract population and investment.  
Diversification mitigates volatility — balanced exposure across regions stabilizes returns.  
Policy levers matter — sustained infrastructure and supply-side incentives outperform short-term fixes.

---

## Data Attribution

Data © Zillow Group, Inc. (ZHVI, ZORI, For-Sale Inventory) — used under Zillow Research Terms of Use for educational, non-commercial analysis.
