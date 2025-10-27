# 📁 Data Folder – Zillow Rent Value Index (ZORI)

This folder contains the raw and cleaned datasets used for the **Zillow Home Rent Index Analysis (2000-01 – 2025-09)**.

---

## 📂 File Descriptions

### `us_rent_value_index_raw_data.csv`
- Contains the original **Zillow Observed Rent Index (ZORI)** files downloaded from the [Zillow Research Data Portal](https://www.zillow.com/research/data/).
- Includes monthly rent value data by regionname, statename and year across the U.S.

### `state_avg_rent_yearly_clean.csv`
- Cleaned and standardized dataset created from the raw ZORI data.
- Aggregated **monthly rent data into annual averages at the state level** for long-term trend comparison.
- Columns:
  - regionname | statename | year | yearly_rent_index

## 🧹 Data Preparation Summary
- Removed missing or inconsistent records.
- Aggregated monthly Zillow rent data into **annual averages per state**.
- Standardized column names for consistency with the Home Value dataset.

> ✅ **Result:** A clean, structured dataset ready for annual rent trend, growth, and volatility analysis across U.S. states.
