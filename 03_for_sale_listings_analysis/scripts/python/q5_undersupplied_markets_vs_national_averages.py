"""
Q5: Which markets (states) remain undersupplied compared to national averages?

This script identifies undersupplied markets with continued upward pressure
by comparing state-level listings and price growth against national averages.
"""

import pandas as pd
import numpy as np
from pathlib import Path

# Define paths
project_root = Path(__file__).parent.parent.parent.parent
listings_file = project_root / "03_for_sale_listings_analysis" / "data" / "clean" / "avg_for_sale_listings_state_yearly.csv"
home_values_file = project_root / "01_zillow_home_value_index_analysis" / "data" / "clean" / "home_values_yearly_clean.csv"
output_file = project_root / "03_for_sale_listings_analysis" / "outputs" / "summary" / "q5_undersupplied_markets_vs_national_averages.csv"

print("=" * 60)
print("Q5: Undersupplied Markets vs National Averages (2024)")
print("=" * 60)

# Read listings data
print("\nReading listings data...")
listings_df = pd.read_csv(listings_file)
listings_df['statename'] = listings_df['StateName'].str.upper().str.strip()
listings_df = listings_df.sort_values(['statename', 'year'])

# Calculate listings YoY growth
print("Calculating listings YoY growth...")
listings_df['listings_yoy'] = listings_df.groupby('statename')['avg_inventory'].pct_change() * 100
listings_df['listings_yoy'] = listings_df['listings_yoy'].round(2)

# Read home values data
print("Reading home values data...")
home_values_df = pd.read_csv(home_values_file)
home_values_df['statename'] = home_values_df['statename'].str.upper().str.strip()

# Filter out null states
home_values_df = home_values_df[home_values_df['statename'].notna()].copy()

# Aggregate home values by state and year (average across regions)
print("Aggregating home values by state and year...")
home_values_agg = home_values_df.groupby(['statename', 'year'])['yearlyindex'].mean().reset_index()
home_values_agg.columns = ['statename', 'year', 'avg_home_value']
home_values_agg['avg_home_value'] = home_values_agg['avg_home_value'].round(2)
home_values_agg = home_values_agg.sort_values(['statename', 'year'])

# Calculate price YoY growth
print("Calculating price YoY growth...")
home_values_agg['price_yoy'] = home_values_agg.groupby('statename')['avg_home_value'].pct_change() * 100
home_values_agg['price_yoy'] = home_values_agg['price_yoy'].round(2)

# Join listings and prices
print("Joining data...")
listings_clean = listings_df[['statename', 'year', 'listings_yoy']].copy()
prices_clean = home_values_agg[['statename', 'year', 'price_yoy']].copy()

joined = listings_clean.merge(
    prices_clean,
    on=['statename', 'year'],
    how='inner'
)

# Remove rows with NaN values
joined = joined.dropna()

# Calculate national averages for each year
print("Calculating national averages...")
national_avg = joined.groupby('year').agg(
    nat_listings_yoy=('listings_yoy', 'mean'),
    nat_price_yoy=('price_yoy', 'mean')
).reset_index()
national_avg['nat_listings_yoy'] = national_avg['nat_listings_yoy'].round(2)
national_avg['nat_price_yoy'] = national_avg['nat_price_yoy'].round(2)

# Join with national averages
print("Comparing states against national averages...")
merged_data = joined.merge(
    national_avg,
    on='year',
    how='inner'
)

# Filter for 2024
merged_data = merged_data[merged_data['year'] == 2024].copy()

# Apply market condition logic
def get_market_condition(row):
    listings_yoy = row['listings_yoy']
    price_yoy = row['price_yoy']
    nat_listings_yoy = row['nat_listings_yoy']
    nat_price_yoy = row['nat_price_yoy']
    
    if listings_yoy < nat_listings_yoy and price_yoy > nat_price_yoy:
        return '⚠️ Undersupplied — upward pressure'
    else:
        return 'Stable or recovering'

merged_data['market_condition'] = merged_data.apply(get_market_condition, axis=1)

# Prepare output
output_df = merged_data[[
    'statename',
    'year',
    'listings_yoy',
    'price_yoy',
    'nat_listings_yoy',
    'nat_price_yoy',
    'market_condition'
]].copy()

# Rename columns
output_df.rename(columns={'statename': 'state'}, inplace=True)

# Sort by price_yoy descending (as in SQL query)
output_df = output_df.sort_values('price_yoy', ascending=False)

# Save to CSV
output_file.parent.mkdir(parents=True, exist_ok=True)
output_df.to_csv(output_file, index=False)

print(f"\n{'='*60}")
print("Results:")
print(f"{'='*60}")
print(f"\nTotal states analyzed: {len(output_df)}")
print(f"\nNational averages for 2024:")
print(f"  National listings YoY: {output_df['nat_listings_yoy'].iloc[0]:.2f}%")
print(f"  National price YoY: {output_df['nat_price_yoy'].iloc[0]:.2f}%")
print(f"\nUndersupplied markets (upward pressure): {len(output_df[output_df['market_condition'] == '⚠️ Undersupplied — upward pressure'])}")
print(f"Stable or recovering: {len(output_df[output_df['market_condition'] == 'Stable or recovering'])}")
print(f"\nOutput saved to: {output_file}")
print(f"\nFirst 10 rows:")
print(output_df.head(10).to_string(index=False))
print(f"\n{'='*60}")

