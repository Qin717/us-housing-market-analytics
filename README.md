<h1 align="center">Zillow</h1>

# U.S. Housing Marketing Performance Report  
### End-to-end insights across Zillow home values, rents, and inventory (2000 – 2025)

> A three-project portfolio that blends SQL, Python, and Excel to explain how U.S. housing prices, rents, and supply evolved through multiple market cycles.

---

## Project Background  
Zillow is the United States’ leading digital real-estate marketplace, curating national coverage of property values, rental prices, and for-sale inventory. This portfolio converts more than **108,000 observations** from Zillow Research into business-ready intelligence that helps real-estate operators, investors, policymakers, and community stakeholders make faster, better-informed housing decisions. Each project follows a consistent workflow—data acquisition, cleaning, enrichment, visualization, and storytelling—to surface how U.S. housing dynamics evolved from 2000 through 2025.

---

## Executive Summary  
- **Project 01 – Home Value Index Analysis (2000–2025):** Distills 25 years of Zillow Home Value Index (ZHVI) data to quantify **+140% national appreciation** ($153K → $366K), highlight regional volatility gaps, and identify the states that recovered fastest from the 2008 housing crisis.  
- **Project 02 – Rent Value Index Analysis (2015–2025):** Measures the pace and stability of rental inflation across every state, revealing **>95% rent growth** in high-demand Western markets, sub-20% growth in Midwest/Southern states, and a **moderate rent-to-price relationship (R² = 0.38)**.  
- **Project 03 – For-Sale Inventory Analysis (2018–2025):** Benchmarks supply recovery in the post-pandemic era, showing that roughly half of states remain undersupplied and that home prices are **insensitive to short-term inventory swings (R² ≈ 0.01)**—evidence that structural supply gaps keep pressure on affordability.

---

## Insights Deep-Dive  

### Project 01 — Home Value Index Analysis  
- **Real-estate companies:** Pinpoint long-term appreciation leaders to prioritize development pipelines and pricing strategies, while monitoring volatility to calibrate sales pacing and incentive design.  
- **Investors & lenders:** Balance portfolios by blending high-growth Sun Belt assets (Idaho, Utah, Arizona) with Midwest anchors that deliver steadier cash flows and lower downside risk.  
- **Local stakeholders:** Use recovery timelines and regional differentials to argue for zoning flexibility, infrastructure investment, and resilience planning in markets still lagging pre-crisis peaks.

### Project 02 — Rent Value Index Analysis  
- **Real-estate companies:** Align build-to-rent and multifamily expansion plans with states experiencing durable rent growth yet manageable volatility to maximize lease-up velocity.  
- **Investors & lenders:** Deploy underwriting guardrails in high-volatility markets (Montana, Vermont, Wyoming) while capturing stable coupons in Midwest/Southern states with sub-2% annual rent swings.  
- **Housing advocates & policymakers:** Target rental assistance, affordability programs, and zoning reform to Western metros where rent inflation far outpaces wage growth.

### Project 03 — For-Sale Inventory Analysis  
- **Real-estate companies:** Identify undersupplied Northeast and coastal markets where even modest new construction can command premium absorption and pricing power.  
- **Investors & builders:** Sequence capital toward inventory-recovering Sun Belt states to capture volume growth, while lobbying for entitlements in chronically undersupplied regions.  
- **Public stakeholders:** Quantify the structural nature of supply shortages to support long-term permitting reform, transportation investments, and public–private partnerships that unlock housing stock.

---

## Recommendations  
- **Scale supply where price pressure persists:** Fast-track permitting, infrastructure, and public–private initiatives in Northeast and coastal states that remain below national inventory benchmarks yet above-average price growth.  
- **Balance portfolios with volatility-aware deployment:** Pair Western/Mountain exposure (higher appreciation, higher swings) with Midwest/Southern holdings for resilient cash flow and risk-adjusted returns.  
- **Align rental strategies to affordability goals:** Expand multifamily development and rental vouchers in states posting double-digit rent growth while preserving naturally affordable stock in stable markets.  
- **Institutionalize integrated monitoring:** Maintain cross-market dashboards that track ZHVI, ZORI, and inventory in tandem so leadership teams can anticipate affordability shock points and time capital allocation.  
- **Advocate for systemic policy levers:** Support zoning modernization, infrastructure financing, and housing trust funds that enable sustained supply growth—short-term listing spikes alone will not resolve price pressure.

---

## Supporting Portfolio Overview  
- Synthesizes **108k+ housing observations** into actionable storylines for decision makers.  
- Connects **home-value appreciation (ZHVI)**, **rent dynamics (ZORI)**, and **for-sale inventory trends** to surface structural imbalances.  
- Demonstrates a repeatable analytics workflow: data acquisition → cleaning → enrichment → visualization → business recommendations.  
- Designed as a flagship piece for showcasing **market analytics, data storytelling, and stakeholder-ready deliverables**.

---

## Portfolio Scope & Objectives  
- Build a cohesive analytical narrative around Zillow’s **Home Value**, **Rent**, and **Inventory** datasets.  
- Quantify regional patterns, volatility, and market resilience across multiple economic cycles.  
- Translate quantitative findings into **investor, developer, and policy** recommendations.  
- Provide reproducible assets (SQL, Python, Excel, visual exports) for rapid stakeholder reuse.

---

## Project Spotlight  

### Project 01 — `01_zillow_home_value_index_analysis`  
- **Focus:** Two decades of U.S. home-value appreciation and volatility (2000–2025).  
- **Signature insights:** Western states deliver the fastest growth but highest swings; Midwest/South provide steady appreciation for risk-balanced portfolios.  
- **Deliverables:** Power Query pipeline, Excel dashboard, five executive-ready visuals.  
- **Sample output:**  
  <img src="01_zillow_home_value_index_analysis/outputs/charts/q1_top10_states_by_average_home_value_growth.png" alt="Top 10 States by Home Value Growth" width="60%">

### Project 02 — `02_zillow_rent_value_index_analysis`  
- **Focus:** Rent escalation, volatility, and rent-to-price dynamics (2015–2025).  
- **Signature insights:** Western/Mountain states lead rent inflation; rent growth tracks home-value gains with R² = 0.38, signaling interconnected affordability pressure.  
- **Deliverables:** SQL transformations, Excel reports, correlation analysis tying rents to ownership costs.  
- **Sample output:**  
  <img src="02_zillow_rent_value_index_analysis/outputs/charts/q3_correlation_between_rent_growth_and_home_value_appreciation.png" alt="Correlation Between Rent Growth and Home-Value Appreciation" width="60%">

### Project 03 — `03_for_sale_listings_analysis`  
- **Focus:** Inventory recovery and supply-pressure diagnostics (2018–2025).  
- **Signature insights:** Half of U.S. states remain undersupplied despite post-pandemic listing rebounds; price growth resists short-run inventory gains (R² ≈ 0.01).  
- **Deliverables:** SQL + Python workflows, Excel visuals, state-by-state supply benchmarking.  
- **Sample output:**  
  <img src="03_for_sale_listings_analysis/outputs/charts/q5_undersupplied_markets_vs_national_averages.png" alt="Undersupplied Markets vs National Averages" width="60%">

---

## Portfolio Snapshot  

| Project | Primary Question | Core Methods | Key Outputs |
|---------|------------------|--------------|-------------|
| **01 · Home Values** | How have state-level home values grown and rebounded since 2000? | Excel (Power Query, Pivot, Charts) | Growth leaderboards, volatility scorecard, crash-to-recovery analysis |
| **02 · Rent Index** | Which states lead rent inflation and how do rents track price gains? | SQL (window functions, aggregations) + Excel | Rent growth rankings, volatility heat map, rent–price correlation plot |
| **03 · Inventory** | Where does supply remain tight and what does that mean for prices? | SQL + Python (Pandas, Matplotlib) + Excel | YoY supply dashboards, inventory-price scatter, undersupply benchmark charts |

---

## Data Sources  

| Data Asset | Coverage | Frequency | Metrics | Used In |
|------------|----------|-----------|---------|---------|
| Zillow Home Value Index (ZHVI) | 2000–2025 | Monthly → annual avg | Median home value, YoY %, CAGR, volatility | Project 01 & cross-project benchmarks |
| Zillow Rent Index (ZORI) | 2015–2025 | Monthly → annual avg | Typical rent, YoY %, volatility, rent-price correlation | Project 02 & cross-project synthesis |
| Zillow For-Sale Inventory | 2018–2025 | Monthly → annual avg | Listings count, YoY growth, supply vs. price metrics | Project 03 & cross-project synthesis |

> Raw assets sourced from Zillow Research. All transformations documented inside project folders.

---

## Analytics Workflow & Tooling  
- **Data engineering:** SQL scripts and Power Query to reshape long time-series data.  
- **Analysis:** Python (Pandas, NumPy) and Excel to compute growth, volatility, and correlations.  
- **Visualization:** Matplotlib and Excel charting for stakeholder-ready figures.  
- **Quality controls:** Transparent folder structure, reproducible scripts, and cross-checks between rents, prices, and inventory to validate insights.  
- **Storytelling:** Executive summaries, business implications, and recommendations aligned to investor/developer/policy use cases.

---

## Cross-Market Signals  
- **Affordability strain is structural:** Inventories remain below national norms in coastal/Northeast markets, keeping both prices and rents elevated despite softening demand.  
- **Migration reshapes winners:** Mountain West and Sun Belt states capture outsized growth across values, rents, and listings, reflecting population inflows and development capacity.  
- **Risk management requires diversification:** Combining high-growth (West/Mountain) and steady (Midwest/South) markets balances return potential with cash-flow stability.  
- **Policy lever:** Zoning reform and long-term supply investment are critical; single-year listing spikes do not materially dent price trajectories.

---

## Repository Structure  

```
.
├── 01_zillow_home_value_index_analysis/
│   ├── data/ (raw ↔ clean)
│   ├── outputs/ (charts, summary tables)
│   ├── scripts/ (Excel workflow notes)
│   └── README.md
├── 02_zillow_rent_value_index_analysis/
│   ├── data/
│   ├── outputs/
│   ├── scripts/sql/
│   └── README.md
├── 03_for_sale_listings_analysis/
│   ├── data/
│   ├── outputs/
│   ├── scripts/ (Python + SQL)
│   └── README.md
└── README.md  ← you are here
```

---

## How to Reproduce  
1. Clone the repository and install Python 3.11+ if running the inventory analysis notebooks/scripts.  
2. Download the Zillow datasets (links embedded in each project README) into the `data/raw/` folders.  
3. Follow project-specific instructions:  
   - **Project 01:** Open the Excel workbook, enable Power Query, refresh connections.  
   - **Project 02:** Execute SQL scripts in `02_zillow_rent_value_index_analysis/scripts/sql/`, then refresh linked Excel charts.  
   - **Project 03:** Run Python scripts in `03_for_sale_listings_analysis/scripts/python/` to regenerate processed tables and figures.  
4. Compare regenerated charts with the `outputs/` folders to validate results.  
5. Use the visuals and executive summaries for presentation decks or stakeholder briefings.

---

## Next Steps  
- Extend analyses to metro-level cuts to highlight local affordability hotspots.  
- Layer in macro drivers (mortgage rates, income growth, employment) for multi-factor modeling.  
- Build an interactive Tableau/Power BI dashboard that unifies the three datasets for real-time storytelling.  
- Automate scheduled refreshes to maintain an up-to-date housing analytics observatory.

---

## Data Attribution  
Data © Zillow Group, Inc. (ZHVI, ZORI, For-Sale Inventory) — used under Zillow Research Terms of Use for educational, non-commercial analysis.

---

## 👤 Author  
**Qin Qin**  
Data Analytics Portfolio · Real Estate · Market Trends  
🔗 [GitHub](https://github.com/Qin717) · [LinkedIn](https://www.linkedin.com/in/qinqin0717)

> This portfolio aligns with best practices for housing market analytics, echoing professional storytelling standards showcased in industry case studies such as TechSphere’s e-commerce analytics report^[https://github.com/CamilingJS/TechSphere_Ecommerce?tab=readme-ov-file] while adapting them to the U.S. real-estate landscape.
