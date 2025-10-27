# Zillow Home Rent Index Analysis (2000–2025)

This project analyzes long-term U.S. rent trends using the Zillow Observed Rent Index (ZORI), focusing on rent growth, volatility, and post-pandemic recovery patterns across all 50 states.
It complements the Zillow Home Value Index project by examining how rental markets mirror and lag behind housing price dynamics.

## Executive Summary

Between 2015 and 2025, U.S. rent markets show strong divergence between high-growth Western states and stable Midwestern and Southern markets.
Key findings reveal growth surges during the pandemic, significant volatility in the Mountain West, and robust post-COVID recovery in inland and Southeastern states.

## Key Analyses

### 1. Year-over-Year Rent Growth by State (2016–2025)

Rent growth surged in 2021–2022, especially in Florida, Arizona, and Idaho, exceeding +10–15% YoY.

By 2023–2025, growth stabilized across most regions but remained above pre-pandemic averages in Western states.

**Insight:** Rent growth peaked nationwide in 2022 due to migration and supply constraints, before normalizing toward 2025.

📊 Chart available [here](outputs/charts/q1_yoy_rent_growth_by_state.png)

### 2. Top & Bottom 5 States by Total Rent Growth (2015–2025)

Colorado (+117%) and Idaho (+99%) led all states, with rents more than doubling.

Louisiana (+14%) and Wisconsin (+15%) experienced the slowest gains, reflecting steady affordability.

**Insight:** Western states benefited from population inflows and economic expansion, while the Midwest and South maintained steady but slower markets.

📊 Chart available [here](outputs/charts/q2_top_bottom_5_states_rent_growth.png)

### 3. Rent Volatility (2015–2025)

Montana (11.8%), Vermont (8.3%), and Wyoming (6.7%) recorded the highest volatility.

Ohio (1.8%), Missouri (1.9%), and Louisiana (2.1%) were the most stable.

**Insight:** Western states show greater rent swings tied to speculative surges, while Midwest states maintain consistent stability.

📊 Chart available [here](outputs/charts/q3_top_bottom5_states_by_rent_volatility.png)

### 4. Rent Growth Consistency Index (2015–2025)

Measured as average YoY growth ÷ volatility.

Most consistent: Rhode Island (2.86), Alabama (2.48), Colorado (2.40).

Least consistent: Vermont (0.17), West Virginia (0.25).

**Insight:** Balanced states like Rhode Island and Alabama achieved steady rent growth — ideal for long-term investment resilience.

📊 Chart available [here](outputs/charts/q4_top_bottom5_states_by_rent_growth_consistency.png)

### 5. Rent Recovery Post-COVID (2020–2023)

Montana (+68.7%) saw the strongest rebound, followed by Florida (+38.9%) and Georgia (+34.2%).

Recovery was moderate in Northeastern markets such as Connecticut and New Hampshire.

**Insight:** Migration and affordability drove rapid recovery in inland and Southeastern regions after 2020.

📊 Chart available [here](outputs/charts/q5_top10_states_by_rent_recovery_post_covid.png)

## Recommendations for Stakeholders

### For Real-Estate Companies & Developers:
Focus on high-growth, moderate-volatility states (e.g., Colorado, Georgia, North Carolina) for sustainable development.

### For Investors:
Diversify portfolios between high-return but volatile markets (Montana, Idaho) and stable yield regions (Ohio, Alabama).

### For Policymakers:
Expand housing supply in high-volatility areas to mitigate rent inflation and migration pressure.

## Data & Methodology

**Source:** Zillow Observed Rent Index (ZORI)

**Period:** 2000–2025 (latest: September 2025)

**Aggregation:** Monthly → Annual averages by state

**Tools:** SQL, Excel

✅ Clean, standardized dataset ready for rent growth, volatility, and recovery analysis.