# Zillow Rent Index Analysis

## Overview
This project analyzes rental market trends across the United States using Zillow Rent Index data from 2015-2025.

## Data Source
- **Source**: Zillow Research Data (ZORI - Zillow Observed Rent Index)
- **Raw Data File**: `us_rent_index_raw_data.csv` (697 regions)
- **Time Period**: January 2015 - September 2025 (monthly data)
- **Geography**: Metropolitan Statistical Areas (MSAs) grouped by state

---

## Analysis Questions & Results

### **Q1: Average Rent per State - Yearly Breakdown**
**File**: [`Q1_state_year_avg_rent.csv`](Q1_state_year_avg_rent.csv)

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
**Files**: 
- CSV: [`Q2_state_yoy_growth_wide.csv`](Q2_state_yoy_growth_wide.csv)
- **📊 Interactive Visualization**: [`Q2_yoy_growth_visualization.html`](Q2_yoy_growth_visualization.html)

Shows year-over-year percentage growth from 2016-2025 in a wide format (one row per state).

#### **🎨 How to View the Interactive HTML Visualization**:

**Option 1 - Download & Open Locally** (Recommended):
1. Download the file: [`Q2_yoy_growth_visualization.html`](Q2_yoy_growth_visualization.html)
2. Double-click to open in your web browser
3. View the full interactive table with Excel-style conditional formatting

**Option 2 - Use HTML Preview Service**:
Click here to view online: [View Live Preview](https://htmlpreview.github.io/?https://github.com/Qin717/us-housing-market-analytics/blob/main/02_zillow_rent_index_analysis/Q2_yoy_growth_visualization.html)

**Features**:
- ✅ Excel-style conditional formatting with color gradients
- ✅ Green shades = positive growth (darker = higher growth)
- ✅ Orange/red shades = negative growth
- ✅ Sticky headers and state column for easy scrolling
- ✅ Hover effects on rows

**Sample Output**:
```
state,2016,2017,2018,2019,2020,2021,2022,2023,2024,2025
CO,15.52,6.42,6.73,5.30,4.39,9.70,12.80,7.31,6.97,5.73
```

---

### **Q3: States with Highest and Lowest Rent Growth (2015-2025)**
**File**: [`Q3_top_bottom_5_states_2015_2025.csv`](Q3_top_bottom_5_states_2015_2025.csv)

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

## SQL Queries
All analysis queries are available in: [`us_rent_index_queries.sql`](us_rent_index_queries.sql)

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
├── README.md (this file)
├── us_rent_index_queries.sql (SQL queries for all 3 questions)
├── us_rent_index_raw_data.csv (raw Zillow data)
├── Q1_state_year_avg_rent.csv (yearly averages)
├── Q2_state_yoy_growth_wide.csv (YoY growth rates)
├── Q2_yoy_growth_visualization.html (interactive visualization ⭐)
├── Q3_top_bottom_5_states_2015_2025.csv (top/bottom performers)
├── charts/ (visualizations)
└── summary_report.pdf
```

---

## Technologies Used
- **Database**: PostgreSQL 14
- **SQL Extensions**: tablefunc (for crosstab operations)
- **Visualization**: HTML/CSS/JavaScript with conditional formatting
- **Version Control**: Git & GitHub

---

## Author
Data Analytics Portfolio Project - US Housing Market Analytics

**Repository**: [us-housing-market-analytics](https://github.com/Qin717/us-housing-market-analytics)

