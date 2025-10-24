import pandas as pd
import numpy as np

# Read Q2 data
df = pd.read_csv('02_zillow_rent_index_analysis/outputs/Q2_yoy_rent_growth_by_state.csv')

# Convert to long format
df_long = pd.melt(df, id_vars=['state'], var_name='year', value_name='yoy_growth_pct')
df_long['year'] = df_long['year'].astype(int)
df_long = df_long.dropna()

# Check specific states from screenshot
states_to_check = ['MT', 'VT', 'WY', 'ME', 'UT']

print("Checking volatility for states from screenshot:")
print("=" * 60)

for state in states_to_check:
    state_data = df_long[df_long['state'] == state]
    if not state_data.empty:
        volatility = state_data['yoy_growth_pct'].std()
        print(f"{state}: {volatility:.8f}")
        print(f"  Data: {state_data['yoy_growth_pct'].tolist()}")
    else:
        print(f"{state}: No data found")

# Calculate all volatilities
volatility_all = df_long.groupby('state')['yoy_growth_pct'].std().reset_index()
volatility_all.columns = ['state', 'rent_volatility']
volatility_all = volatility_all.dropna()
volatility_all['rent_volatility'] = volatility_all['rent_volatility'].round(8)

# Show top 5 most volatile
print("\nTop 5 Most Volatile States:")
print("=" * 30)
top_5 = volatility_all.nlargest(5, 'rent_volatility')
for _, row in top_5.iterrows():
    print(f"{row['state']}: {row['rent_volatility']:.8f}")

# Show bottom 5 least volatile
print("\nTop 5 Least Volatile States:")
print("=" * 30)
bottom_5 = volatility_all.nsmallest(5, 'rent_volatility')
for _, row in bottom_5.iterrows():
    print(f"{row['state']}: {row['rent_volatility']:.8f}")
