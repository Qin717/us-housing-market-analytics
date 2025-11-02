"""
Home Value Year-over-Year (YoY) Growth Calculation
Simple script to calculate YoY growth from home_values_yearly_clean data
"""

import pandas as pd
import os

# Set paths
base_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
data_file = os.path.join(base_dir, 'data', 'home_values_yearly_clean.csv')
output_file = os.path.join(base_dir, 'data', 'home_value_yoy_growth.csv')

# Read the data
print("Loading data...")
df = pd.read_csv(data_file)

print(f"Total records: {len(df):,}")
print(f"Columns: {df.columns.tolist()}")
print("\nFirst few rows:")
print(df.head())
print("\n" + "="*80 + "\n")

# Calculate YoY growth by state (grouped by statename)
print("Calculating YoY growth by state...")

# Step 1: Calculate average home value by state and year
state_avg = df.groupby(['statename', 'year'], as_index=False)['yearlyindex'].mean()
state_avg['avg_home_value'] = state_avg['yearlyindex'].round(2)

# Step 2: Sort by state and year, then calculate previous year value
state_avg_sorted = state_avg.sort_values(['statename', 'year']).copy()
state_avg_sorted['previous_value'] = state_avg_sorted.groupby('statename')['avg_home_value'].shift(1)

# Step 3: Calculate YoY growth percentage
state_avg_sorted['yoy_growth_percent'] = (
    (state_avg_sorted['avg_home_value'] - state_avg_sorted['previous_value']) 
    / state_avg_sorted['previous_value'] * 100
).round(2)

# Filter out rows where previous_value is null (first year for each state)
result = state_avg_sorted[
    state_avg_sorted['previous_value'].notna()
][['statename', 'year', 'avg_home_value', 'previous_value', 'yoy_growth_percent']]

# Rename columns for clarity
result.columns = ['statename', 'year', 'current_value', 'previous_value', 'yoy_growth_percent']

# Calculate statistics before formatting
yoy_stats = result['yoy_growth_percent'].copy()

# Format yoy_growth_percent with % sign
result['yoy_growth_percent'] = result['yoy_growth_percent'].apply(lambda x: f"{x}%")

# Save to CSV
result.to_csv(output_file, index=False)

print(f"✅ CSV file saved: {output_file}")
print(f"✅ Total records with YoY growth: {len(result):,}")
print("\n" + "="*80 + "\n")
print("Sample output (first 20 rows):")
print(result.head(20).to_string(index=False))
print("\n" + "="*80 + "\n")
print("Summary statistics:")
print(f"  - Unique states: {result['statename'].nunique()}")
print(f"  - Year range: {result['year'].min()} to {result['year'].max()}")
print(f"  - Total state-year combinations: {len(result):,}")
print(f"  - Average YoY growth: {yoy_stats.mean():.2f}%")
print(f"  - Median YoY growth: {yoy_stats.median():.2f}%")
print(f"  - Min YoY growth: {yoy_stats.min():.2f}%")
print(f"  - Max YoY growth: {yoy_stats.max():.2f}%")

