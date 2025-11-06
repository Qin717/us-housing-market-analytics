"""
Calculate Average Home Value for the Entire US (2000-2025)

This script calculates the average home value across all regions in the US
for each year from 2000 to 2025 using the home_values_yearly_clean.csv file.
"""

import pandas as pd
from pathlib import Path

# Define paths
project_root = Path(__file__).parent.parent.parent.parent
data_file = project_root / "01_zillow_home_value_index_analysis" / "data" / "clean" / "home_values_yearly_clean.csv"
output_file = project_root / "01_zillow_home_value_index_analysis" / "outputs" / "summary" / "us_average_home_value_2000_2025.csv"

print("=" * 60)
print("Calculating US Average Home Value (2000-2025)")
print("=" * 60)

# Read the data
print("\nReading data...")
df = pd.read_csv(data_file)

# Filter for years 2000-2025
df_filtered = df[df['year'].between(2000, 2025)].copy()

print(f"Total records: {len(df_filtered):,}")
print(f"Years: {sorted(df_filtered['year'].unique())}")

# Calculate average home value for the entire US by year
# This averages across all regions (cities/metros) for each year
us_avg_by_year = df_filtered.groupby('year')['yearlyindex'].agg([
    ('avg_home_value', 'mean'),
    ('min_home_value', 'min'),
    ('max_home_value', 'max'),
    ('median_home_value', 'median'),
    ('num_regions', 'count')
]).reset_index()

# Round to 2 decimal places
us_avg_by_year['avg_home_value'] = us_avg_by_year['avg_home_value'].round(2)
us_avg_by_year['min_home_value'] = us_avg_by_year['min_home_value'].round(2)
us_avg_by_year['max_home_value'] = us_avg_by_year['max_home_value'].round(2)
us_avg_by_year['median_home_value'] = us_avg_by_year['median_home_value'].round(2)

# Calculate overall average across all years
overall_avg = us_avg_by_year['avg_home_value'].mean()
overall_median = us_avg_by_year['median_home_value'].mean()

print(f"\n{'='*60}")
print("Results:")
print(f"{'='*60}")
print(f"\nOverall Average Home Value (2000-2025): ${overall_avg:,.2f}")
print(f"Overall Median Home Value (2000-2025): ${overall_median:,.2f}")

print(f"\n{'Year':<6} {'Avg Home Value':<18} {'Median':<18} {'Min':<18} {'Max':<18} {'Regions':<10}")
print("-" * 90)
for _, row in us_avg_by_year.iterrows():
    print(f"{int(row['year']):<6} ${row['avg_home_value']:>15,.2f}  ${row['median_home_value']:>15,.2f}  ${row['min_home_value']:>15,.2f}  ${row['max_home_value']:>15,.2f}  {int(row['num_regions']):>8}")

# Save to CSV
output_file.parent.mkdir(parents=True, exist_ok=True)
us_avg_by_year.to_csv(output_file, index=False)

print(f"\n{'='*60}")
print(f"Output saved to: {output_file}")
print(f"{'='*60}")


