import pandas as pd
import numpy as np

# Method 1: Using Q1 data (original method)
print("Method 1: Using Q1 data")
print("=" * 50)

df_q1 = pd.read_csv('02_zillow_rent_index_analysis/outputs/Q1_state_year_avg_rent.csv')

def calculate_yoy_growth(df):
    yoy_data = []
    
    for state in df['state'].unique():
        state_df = df[df['state'] == state].sort_values('year').reset_index(drop=True)
        
        for i in range(1, len(state_df)):
            prev_rent = state_df.iloc[i-1]['yearly_avg_rent']
            curr_rent = state_df.iloc[i]['yearly_avg_rent']
            year = state_df.iloc[i]['year']
            
            if pd.notna(prev_rent) and pd.notna(curr_rent) and prev_rent != 0:
                yoy_growth_pct = round((curr_rent - prev_rent) / prev_rent * 100, 2)
                yoy_data.append({
                    'state': state,
                    'year': year,
                    'yoy_growth_pct': yoy_growth_pct
                })
    
    return pd.DataFrame(yoy_data)

yoy_df_q1 = calculate_yoy_growth(df_q1)
volatility_q1 = yoy_df_q1.groupby('state')['yoy_growth_pct'].agg(['std']).reset_index()
volatility_q1.columns = ['state', 'rent_volatility']
volatility_q1 = volatility_q1.dropna()
volatility_q1['rent_volatility'] = volatility_q1['rent_volatility'].round(2)

# Method 2: Using Q2 data (direct YoY growth)
print("Method 2: Using Q2 YoY growth data")
print("=" * 50)

df_q2 = pd.read_csv('02_zillow_rent_index_analysis/outputs/Q2_yoy_rent_growth_by_state.csv')

# Convert wide format to long format
df_q2_long = pd.melt(df_q2, id_vars=['state'], var_name='year', value_name='yoy_growth_pct')
df_q2_long['year'] = df_q2_long['year'].astype(int)
df_q2_long = df_q2_long.dropna()

# Calculate volatility using Q2 data
volatility_q2 = df_q2_long.groupby('state')['yoy_growth_pct'].agg(['std']).reset_index()
volatility_q2.columns = ['state', 'rent_volatility']
volatility_q2 = volatility_q2.dropna()
volatility_q2['rent_volatility'] = volatility_q2['rent_volatility'].round(2)

# Compare results
print("Top 5 Most Volatile - Method 1 (Q1):")
top_5_q1 = volatility_q1.nlargest(5, 'rent_volatility')
print(top_5_q1)

print("\nTop 5 Most Volatile - Method 2 (Q2):")
top_5_q2 = volatility_q2.nlargest(5, 'rent_volatility')
print(top_5_q2)

print("\nTop 5 Least Volatile - Method 1 (Q1):")
bottom_5_q1 = volatility_q1.nsmallest(5, 'rent_volatility')
print(bottom_5_q1)

print("\nTop 5 Least Volatile - Method 2 (Q2):")
bottom_5_q2 = volatility_q2.nsmallest(5, 'rent_volatility')
print(bottom_5_q2)

# Check if results are the same
print("\nComparison:")
print("=" * 50)
print("Are the top 5 most volatile states the same?", 
      set(top_5_q1['state']) == set(top_5_q2['state']))
print("Are the top 5 least volatile states the same?", 
      set(bottom_5_q1['state']) == set(bottom_5_q2['state']))

# Save Q2-based results
result_q2 = pd.concat([top_5_q2, bottom_5_q2])
result_q2 = result_q2.sort_values('rent_volatility', ascending=False)
result_q2.to_csv('02_zillow_rent_index_analysis/outputs/Q4_volatility_from_q2.csv', index=False)
print("\nQ2-based results saved to Q4_volatility_from_q2.csv")
