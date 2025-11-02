"""
Q3: Generate CSV for Top 5 States with Strongest Divergence Between 
    Home Value Growth and Rent Growth
"""

import pandas as pd
import os

# Set up paths
base_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
project01_data = os.path.join(base_dir, '..', '01_zillow_home_value_index_analysis', 'data', 'home_value_yoy_growth.csv')
project02_data = os.path.join(base_dir, '..', '02_zillow_rent_value_index_analysis', 'data', 'q1_state_avg_rent_yearly_clean.csv')
project03_data = os.path.join(base_dir, 'data', 'q1_avg_for_sale_listings_state_yearly.csv')
output_file = os.path.join(base_dir, 'outputs', 'csv_files', 'q3_largest_gap_home_price_rent_growth_inventory.csv')

print("Loading data files...")

# Load home value data (Project 01)
home_values = pd.read_csv(project01_data)
home_values['statename'] = home_values['statename'].str.upper().str.strip()
home_values['year'] = home_values['year'].astype(int)
home_values['home_yoy_growth'] = home_values['yoy_growth_percent'].str.replace('%', '').astype(float)
home_values = home_values[(home_values['year'] >= 2018) & (home_values['year'] <= 2025)]
print(f"  - Home values: {len(home_values)} records")

# Load rent data (Project 02)
rent_values = pd.read_csv(project02_data, quotechar='"')
rent_values['state'] = rent_values['state'].str.upper().str.strip().str.replace('"', '')
rent_values['year'] = rent_values['year'].astype(int)
rent_values['state_avg_rent'] = rent_values['state_avg_rent'].astype(str).str.replace('"', '').astype(float)
rent_values = rent_values[(rent_values['year'] >= 2018) & (rent_values['year'] <= 2025)]
rent_values = rent_values.sort_values(['state', 'year'])

# Calculate rent YoY growth
rent_values['rent_yoy_growth'] = rent_values.groupby('state')['state_avg_rent'].pct_change() * 100
rent_values['rent_yoy_growth'] = rent_values['rent_yoy_growth'].round(2)
print(f"  - Rent values: {len(rent_values)} records")

print("\nCalculating average growth rates and divergence by state...")

# Join home and rent data
merged = home_values[['statename', 'year', 'home_yoy_growth']].merge(
    rent_values[['state', 'year', 'rent_yoy_growth']].rename(columns={'state': 'statename'}),
    on=['statename', 'year'],
    how='inner'
)

# Remove rows with missing values
merged = merged.dropna()
print(f"  - Merged records with all data: {len(merged)}")

# Calculate average growth rates per state
state_avg = merged.groupby('statename').agg({
    'home_yoy_growth': 'mean',
    'rent_yoy_growth': 'mean'
}).round(2).reset_index()

# Calculate divergence (absolute difference)
state_avg['growth_divergence'] = (state_avg['home_yoy_growth'] - state_avg['rent_yoy_growth']).abs().round(2)

# Add divergence type
state_avg['divergence_type'] = state_avg.apply(
    lambda row: 'Home prices growing faster than rents' if row['home_yoy_growth'] > row['rent_yoy_growth'] 
    else 'Rents growing faster than home prices' if row['rent_yoy_growth'] > row['home_yoy_growth']
    else 'Equal growth',
    axis=1
)

# Select top 5 states with strongest divergence
top5 = state_avg.nlargest(5, 'growth_divergence').copy()

print("\nMerging inventory data...")

# Load inventory data (Project 03)
inventory_data = pd.read_csv(project03_data)
inventory_data['StateName'] = inventory_data['StateName'].str.upper().str.strip()
inventory_data['year'] = inventory_data['year'].astype(int)
inventory_data = inventory_data[(inventory_data['year'] >= 2018) & (inventory_data['year'] <= 2025)]
inventory_data = inventory_data.sort_values(['StateName', 'year'])

# Calculate inventory YoY change
inventory_data['avg_inventory'] = inventory_data['avg_inventory'].astype(float)
inventory_data['yoy_inventory_change'] = inventory_data.groupby('StateName')['avg_inventory'].pct_change() * 100
inventory_data['yoy_inventory_change'] = inventory_data['yoy_inventory_change'].round(2)
print(f"  - Inventory data: {len(inventory_data)} records")

# Calculate average inventory change per state
inventory_avg = inventory_data.groupby('StateName')['yoy_inventory_change'].mean().round(2).reset_index()
inventory_avg.columns = ['state_name', 'avg_inventory_change']
print(f"  - States with inventory data: {len(inventory_avg)}")

# Merge inventory data with top 5 states
output = top5[[
    'statename',
    'home_yoy_growth',
    'rent_yoy_growth',
    'growth_divergence'
]].copy()

# Rename columns to match SQL output
output.columns = ['state_name', 'avg_home_growth', 'avg_rent_growth', 'growth_divergence']

# Merge with inventory data
output = output.merge(inventory_avg, on='state_name', how='left')

# Format growth columns with % signs
output['avg_home_growth'] = output['avg_home_growth'].apply(lambda x: f"{x:.2f}%")
output['avg_rent_growth'] = output['avg_rent_growth'].apply(lambda x: f"{x:.2f}%")
output['growth_divergence'] = output['growth_divergence'].apply(lambda x: f"{x:.2f}%")
output['avg_inventory_change'] = output['avg_inventory_change'].apply(lambda x: f"{x:.2f}%" if pd.notna(x) else "")

# Save to CSV
os.makedirs(os.path.dirname(output_file), exist_ok=True)
output.to_csv(output_file, index=False)

print(f"\n✅ CSV file saved: {output_file}")
print(f"✅ Total records: {len(output)} (Top 5 states)")
print(f"\nTop 5 States with Strongest Divergence:")
print(output.to_string(index=False))

print("\n" + "="*80)
print("Summary statistics:")
print(f"  - States analyzed: {len(state_avg)}")
print(f"  - Average divergence across all states: {state_avg['growth_divergence'].mean():.2f}%")
print(f"  - Maximum divergence: {state_avg['growth_divergence'].max():.2f}%")

