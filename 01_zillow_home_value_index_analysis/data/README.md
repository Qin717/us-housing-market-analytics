# 📁 Data Folder – Zillow Home Value Index (ZHVI)

This folder contains the raw and cleaned datasets used for the **Zillow Home Value Index Analysis (2000-01–2025-08)**.

---

## 📂 File Descriptions

### `raw_data/`
- Contains the original **Zillow Home Value Index (ZHVI)** files downloaded from the [Zillow Research Data Portal](https://www.zillow.com/research/data/).  
- Includes monthly housing value data by city, ZIP code, and metro area.

### `home_values_yearly_clean.csv`
- Cleaned and standardized dataset created from the raw ZHVI data.  
- Aggregated **monthly data into annual averages at the city level**, retaining state and metro information for higher-level analysis.  
- Columns:
regionname | statename | city | countyname | metro | year | yearlyindex

## 🧹 Data Preparation Summary
- Removed missing or inconsistent records.  
- Aggregated monthly Zillow data into **annual averages per city**.  
- Ensured consistent structure for long-term trend analysis across states and regions.

> ✅ Result: A clean, reliable dataset ready for analytical and visualization workflows.

  

✅ Clean, consistent data ready for analysis and visualization.
