"""
Q3: Generate CSV for Housing Supply Shortage Impact on Fastest- and Slowest-Growing Markets
Runs the SQL query logic using pandas to generate the output CSV
"""

import pandas as pd
import os

# Set up paths
base_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
project01_data = os.path.join(base_dir, '..', '01_zillow_home_value_index_analysis', 'data', 'home_value_yoy_growth.csv')
project02_data = os.path.join(base_dir, '..', '02_zillow_rent_value_index_analysis', 'data', 'q1_state_avg_rent_yearly_clean.csv')
project03_data = os.path.join(base_dir, 'outputs', 'csv_files', 'q2_yoy_growth_listings_state_yearly.csv')
output_file = os.path.join(base_dir, 'outputs', 'csv_files', 'q3_supply_shortage_impact_on_prices_rents.csv')

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

# Load inventory YoY growth data (Project 03 - from Q2 output)
inventory_growth = pd.read_csv(project03_data)
inventory_growth['statename'] = inventory_growth['statename'].str.upper().str.strip()
inventory_growth['year'] = inventory_growth['year'].astype(int)
inventory_growth['inventory_yoy_growth'] = inventory_growth['yoy_growth_percent'].str.replace('%', '').astype(float)
print(f"  - Inventory growth: {len(inventory_growth)} records")

print("\nCalculating average metrics by state...")

# Join all three datasets by statename and year
merged = home_values[['statename', 'year', 'home_yoy_growth']].copy()
merged = merged.merge(
    rent_values[['state', 'year', 'rent_yoy_growth']].rename(columns={'state': 'statename'}),
    on=['statename', 'year'],
    how='inner'
)
merged = merged.merge(
    inventory_growth[['statename', 'year', 'inventory_yoy_growth']],
    on=['statename', 'year'],
    how='inner'
)

# Filter out rows with missing values
merged = merged.dropna()

print(f"  - Merged records with all data: {len(merged)}")

# Calculate average metrics for each state (2018-2025)
avg_metrics = merged.groupby('statename').agg({
    'home_yoy_growth': 'mean',
    'rent_yoy_growth': 'mean',
    'inventory_yoy_growth': 'mean'
}).round(2).reset_index()

avg_metrics.columns = ['statename', 'avg_home_growth', 'avg_rent_growth', 'avg_inventory_growth']

print(f"  - States with complete data: {len(avg_metrics)}")

# Rank states by home value growth
avg_metrics['rank_high'] = avg_metrics['avg_home_growth'].rank(ascending=False, method='min')
avg_metrics['rank_low'] = avg_metrics['avg_home_growth'].rank(ascending=True, method='min')

# Select Top 5 and Bottom 5 states
top_bottom = avg_metrics[
    (avg_metrics['rank_high'] <= 5) | (avg_metrics['rank_low'] <= 5)
].copy()

# Sort by average home growth descending
top_bottom = top_bottom.sort_values('avg_home_growth', ascending=False)

# Format output
output = top_bottom[[
    'statename',
    'avg_home_growth',
    'avg_rent_growth',
    'avg_inventory_growth',
    'rank_high',
    'rank_low'
]].copy()

# Convert ranks to integers
output['rank_high'] = output['rank_high'].astype(int)
output['rank_low'] = output['rank_low'].astype(int)

# Add % signs to growth columns
output['avg_home_growth'] = output['avg_home_growth'].apply(lambda x: f"{x:.2f}%")
output['avg_rent_growth'] = output['avg_rent_growth'].apply(lambda x: f"{x:.2f}%")
output['avg_inventory_growth'] = output['avg_inventory_growth'].apply(lambda x: f"{x:.2f}%")

# Save to CSV
os.makedirs(os.path.dirname(output_file), exist_ok=True)
output.to_csv(output_file, index=False)

print(f"\n✅ CSV file saved: {output_file}")
print(f"✅ Total records: {len(output)} (Top 5 + Bottom 5 states)")
print(f"\nSample output:")
print(output.to_string(index=False))

print("\n" + "="*80)
print("Summary statistics:")
print(f"  - Top 5 fastest-growing markets (by home value growth)")
print(f"  - Bottom 5 slowest-growing markets (by home value growth)")
print(f"  - Shows average home growth, rent growth, and inventory growth for each")
