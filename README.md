# U.S. Housing Market Analytics Portfolio  
### End-to-end insights across Zillow home values, rents, and inventory (2000 – 2025)

> A three-project portfolio that blends SQL, Python, and Excel to explain how U.S. housing prices, rents, and supply evolved through multiple market cycles.

---

## Portfolio Overview  
- Synthesizes **108k+ housing observations** from Zillow Research into actionable storylines for real-estate decision makers.  
- Connects **home-value appreciation (ZHVI)**, **rent dynamics (ZORI)**, and **for-sale inventory trends** to surface structural imbalances.  
- Demonstrates a repeatable analytics workflow: data acquisition → cleaning → enrichment → visualization → business recommendations.  
- Designed as a flagship piece for showcasing **market analytics, data storytelling, and stakeholder-ready deliverables**.

---

## Executive Summary  
- **Long-term appreciation:** U.S. median home values more than doubled (**+140%, $153K → $366K**) from 2000–2025, led by Western and Mountain states with higher volatility than inland markets.  
- **Rental divergence:** Rent growth exceeded **95%** in high-demand Western states while staying below **20%** in parts of the Midwest/South; rent volatility and home-value appreciation show a **moderate positive link (R² = 0.38)**.  
- **Persistent undersupply:** Even as listings recovered in fast-growing states, price growth remains **insensitive to short-term supply changes (R² ≈ 0.01)**, underscoring structural inventory shortages in the Northeast and select coastal markets.  
- **Strategic takeaway:** Housing affordability hinges on sustained supply expansion plus policy support—short-cycle inventory bumps alone will not cool prices or rents in constrained regions.

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
