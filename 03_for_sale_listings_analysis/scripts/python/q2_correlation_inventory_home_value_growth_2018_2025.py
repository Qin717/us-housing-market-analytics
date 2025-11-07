"""
Q2: Correlation Between Inventory and Home-Value Growth (2018–2025)

This script calculates the correlation between inventory growth percentage and 
home value growth percentage across all states from 2018 to 2025.
"""

import pandas as pd
import numpy as np
from pathlib import Path

# Define paths
project_root = Path(__file__).parent.parent.parent.parent
inventory_file = project_root / "03_for_sale_listings_analysis" / "data" / "clean" / "q1_avg_for_sale_listings_state_yearly.csv"
home_values_file = project_root / "01_zillow_home_value_index_analysis" / "data" / "clean" / "home_values_yearly_clean.csv"
output_file = project_root / "03_for_sale_listings_analysis" / "outputs" / "summary" / "q5_correlation_inventory_home_value_growth_2018_2025.csv"

# Read inventory data
print("Reading inventory data...")
inventory_df = pd.read_csv(inventory_file)
inventory_df['StateName'] = inventory_df['StateName'].str.upper().str.strip()

# Filter for 2018 and 2025
inventory_subset = inventory_df[inventory_df['year'].isin([2018, 2025])].copy()

# Calculate inventory growth percentage by state
inventory_growth = inventory_subset.groupby('StateName').agg(
    min_inventory=('avg_inventory', 'min'),
    max_inventory=('avg_inventory', 'max')
).reset_index()

inventory_growth['inventory_growth_pct'] = (
    (inventory_growth['max_inventory'] - inventory_growth['min_inventory']) 
    / inventory_growth['min_inventory'].replace(0, np.nan) * 100
)
inventory_growth = inventory_growth[['StateName', 'inventory_growth_pct']].round(2)

# Read home values data
print("Reading home values data...")
home_values_df = pd.read_csv(home_values_file)
home_values_df['statename'] = home_values_df['statename'].str.upper().str.strip()

# Filter for 2018 and 2025, and remove null states
home_values_subset = home_values_df[
    (home_values_df['year'].isin([2018, 2025])) & 
    (home_values_df['statename'].notna())
].copy()

# First, calculate state average home value by year (like SQL query does)
home_value_state_avg = home_values_subset.groupby(['statename', 'year'])['yearlyindex'].mean().reset_index()
home_value_state_avg.columns = ['statename', 'year', 'state_avg_home_value']
home_value_state_avg['state_avg_home_value'] = home_value_state_avg['state_avg_home_value'].round(2)

# Then calculate growth percentage by state (MAX - MIN across years)
home_value_growth = home_value_state_avg.groupby('statename').agg(
    min_value=('state_avg_home_value', 'min'),
    max_value=('state_avg_home_value', 'max')
).reset_index()

home_value_growth['home_value_growth_pct'] = (
    (home_value_growth['max_value'] - home_value_growth['min_value']) 
    / home_value_growth['min_value'].replace(0, np.nan) * 100
)
home_value_growth = home_value_growth[['statename', 'home_value_growth_pct']].round(2)
home_value_growth.rename(columns={'statename': 'StateName'}, inplace=True)

# Join the data
print("Joining data and calculating correlation...")
merged_data = inventory_growth.merge(
    home_value_growth, 
    on='StateName', 
    how='inner'
)

# Remove rows with NaN values
merged_data = merged_data.dropna()

# Calculate correlation coefficient
correlation_coef = merged_data['inventory_growth_pct'].corr(merged_data['home_value_growth_pct'])
correlation_coef = round(correlation_coef, 3)

# Add correlation coefficient to all rows
merged_data['correlation_coef'] = correlation_coef

# Rename columns to match SQL output
output_df = merged_data[[
    'StateName', 
    'inventory_growth_pct', 
    'home_value_growth_pct', 
    'correlation_coef'
]].rename(columns={
    'StateName': 'state',
    'inventory_growth_pct': 'inventory_growth_pct',
    'home_value_growth_pct': 'home_value_growth_pct',
    'correlation_coef': 'correlation_coef'
})

# Sort by inventory_growth_pct descending (as in SQL query)
output_df = output_df.sort_values('inventory_growth_pct', ascending=False)

# Save to CSV
output_file.parent.mkdir(parents=True, exist_ok=True)
output_df.to_csv(output_file, index=False)

print(f"\nCorrelation coefficient: {correlation_coef}")
print(f"Output saved to: {output_file}")
print(f"\nTotal states analyzed: {len(output_df)}")
print(f"\nFirst few rows:")
print(output_df.head(10))

