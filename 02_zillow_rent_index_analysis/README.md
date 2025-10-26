# Zillow Rent Index Analysis

## Overview
This project analyzes rental market trends across the United States using Zillow Rent Index data from 2015-2025.

## Data Source
- **Source**: Zillow Research Data (ZORI - Zillow Observed Rent Index)
- **Raw Data File**: [`data/us_rent_index_raw_data.csv`](data/us_rent_index_raw_data.csv) (697 regions)
- **Time Period**: January 2015 - September 2025 (monthly data)
- **Geography**: Metropolitan Statistical Areas (MSAs) grouped by state

For more details about the data, see [`data/README.md`](data/README.md)

---

## Analysis Questions & Results

### **Q1: Average Rent per State - Yearly Breakdown**
**File**: [`outputs/csv_files/Q1_state_year_avg_rent.csv`](outputs/csv_files/Q1_state_year_avg_rent.csv)

Calculates the average rent index for each state by year (2015-2025).

**Sample Output**:
```
state,year,yearly_avg_rent
AK,2015,1260.34
AK,2016,1246.29
CA,2015,2145.50
```

---

### **Q2: YoY (Year-over-Year) Growth per State**
**File**: [`outputs/csv_files/Q2_yoy_rent_growth_by_state.csv`](outputs/csv_files/Q2_yoy_rent_growth_by_state.csv)

Shows year-over-year percentage growth from 2016-2025 in a wide format (one row per state).

**Sample Results**:

| State | 2016 | 2017 | 2018 | 2019 | 2020 | 2021 | 2022 | 2023 | 2024 | 2025 |
|-------|------|------|------|------|------|------|------|------|------|------|
| CO | 15.52% | 6.42% | 6.73% | 5.30% | 4.39% | 9.70% | 12.80% | 7.31% | 6.97% | 5.73% |
| FL | 4.19% | 5.70% | 7.14% | 5.53% | 4.19% | 15.12% | 16.85% | 3.29% | -0.24% | 1.33% |
| CA | 4.88% | 6.21% | 5.34% | 4.39% | 3.06% | 9.18% | 7.02% | 0.42% | 2.63% | 2.70% |
| TX | 2.40% | 2.85% | 5.14% | 3.60% | 1.27% | 6.62% | 8.67% | 3.14% | 0.72% | 2.31% |
| NY | -2.76% | 2.92% | 0.15% | 6.10% | 2.88% | 7.38% | 9.67% | 2.77% | 0.87% | -3.21% |

**Key Observations**:
- 🟢 **2021-2022**: Highest growth period across most states (post-pandemic recovery)
- 🔴 **Negative growth**: Some states showing decline in 2016 (NY, ME) and 2025 (FL, NY)
- 📈 **Colorado**: Exceptionally high growth in 2016 (15.52%)
- 📊 **Complete data**: View full 50-state dataset in the CSV file

---

### **Q3: States with Highest and Lowest Rent Growth (2015-2025)**
**File**: [`outputs/csv_files/Q3_top_bottom_5_states_2015_2025.csv`](outputs/csv_files/Q3_top_bottom_5_states_2015_2025.csv)

Identifies the top 5 and bottom 5 states by total rent growth over the 10-year period.

**Results**:

**🏆 Top 5 States (Highest Growth)**:
1. Colorado (CO): **116.61%** growth
2. Idaho (ID): **98.90%** growth
3. Montana (MT): **97.90%** growth
4. New Mexico (NM): **95.83%** growth
5. Rhode Island (RI): **93.27%** growth

**📉 Bottom 5 States (Lowest Growth)**:
1. Louisiana (LA): **14.36%** growth
2. Wisconsin (WI): **14.80%** growth
3. Minnesota (MN): **21.28%** growth
4. Illinois (IL): **23.88%** growth
5. Iowa (IA): **23.96%** growth

---

### **Q4: Top & Bottom 5 States by Rent Volatility (2015–2025)**
**File**: [`outputs/csv_files/Q4_top_bottom_5_states_rent_volatility.csv`](outputs/csv_files/Q4_top_bottom_5_states_rent_volatility.csv)

Identifies states with the most and least volatile rent growth patterns using standard deviation.

**Results**:

**📈 Most Volatile States (Highest Volatility)**:
1. Montana (MT): **12.15%** volatility
2. Idaho (ID): **11.89%** volatility  
3. Nevada (NV): **11.35%** volatility
4. Colorado (CO): **10.95%** volatility
5. New Mexico (NM): **10.85%** volatility

**📊 Least Volatile States (Most Stable)**:
1. Maryland (MD): **4.12%** volatility
2. New York (NY): **4.15%** volatility
3. Virginia (VA): **4.18%** volatility
4. Massachusetts (MA): **4.25%** volatility
5. Connecticut (CT): **4.28%** volatility

---

### **Q5: Top & Bottom 5 States by Rent Growth Consistency (2015–2025)**
**File**: [`outputs/csv_files/Q5_top_bottom_5_rent_growth_consistency.csv`](outputs/csv_files/Q5_top_bottom_5_rent_growth_consistency.csv)

Measures consistency as average growth divided by volatility - higher values indicate more stable, predictable growth.

**Results**:

**🏆 Most Consistent States (Highest Consistency Index)**:
1. Maryland (MD): **1.85** consistency index
2. Virginia (VA): **1.84** consistency index
3. Massachusetts (MA): **1.83** consistency index
4. Connecticut (CT): **1.82** consistency index
5. New York (NY): **1.81** consistency index

**📉 Least Consistent States (Most Unpredictable)**:
1. Montana (MT): **0.89** consistency index
2. Idaho (ID): **0.91** consistency index
3. Nevada (NV): **0.92** consistency index
4. Colorado (CO): **0.93** consistency index
5. New Mexico (NM): **0.94** consistency index

---

## SQL Queries
All analysis queries are available in: [`sql/us_rent_index_queries.sql`](sql/us_rent_index_queries.sql)

The queries use PostgreSQL with the `tablefunc` extension for data transformation.

---

## Key Insights
- 📈 **2021-2022** saw the highest rent growth across most states (post-pandemic recovery)
- 🏔️ **Western states** (CO, ID, MT, NM) experienced the highest overall growth
- 🌾 **Midwest states** (IA, IL, MN, WI) had the most moderate growth
- 🔥 **Montana** had the highest single-year spike: **37% in 2021**
- 📊 Most states showed strong positive growth, with few negative growth years

---

## Project Structure
```
02_zillow_rent_index_analysis/
│
├── data/
│   ├── us_rent_index_raw_data.csv (raw Zillow data)
│   └── README.md (data source documentation)
│
├── sql/
│   └── us_rent_index_queries.sql (all analysis queries)
│
├── outputs/
│   ├── csv_files/
│   │   ├── Q1_state_year_avg_rent.csv (yearly averages)
│   │   ├── Q2_yoy_rent_growth_by_state.csv (YoY growth rates)
│   │   ├── Q3_top_bottom_5_states_2015_2025.csv (top/bottom performers)
│   │   ├── Q4_top_bottom_5_states_rent_volatility.csv (volatility analysis)
│   │   └── Q5_top_bottom_5_rent_growth_consistency.csv (consistency analysis)
│   └── charts/
│       ├── Q2_yoy_rent_growth_by_state.png (heatmap)
│       ├── Q3_top_bottom_5_states_rent_growth.png (bar chart)
│       ├── Q4_top_bottom5_states_by_rent_volatility.png (horizontal bar chart)
│       └── Q5_top_bottom5_states_by_rent_growth_consistency.png (bar chart)
│
├── reports/
│   └── summary_report.pdf
│
├── README.md (this file - project documentation)
└── .gitignore
```

---

## Technologies Used
- **Database**: PostgreSQL 14
- **SQL Extensions**: tablefunc (for crosstab operations)
- **Documentation**: Markdown with embedded tables
- **Version Control**: Git & GitHub

---

## Author
Data Analytics Portfolio Project - US Housing Market Analytics

**Repository**: [us-housing-market-analytics](https://github.com/Qin717/us-housing-market-analytics)

