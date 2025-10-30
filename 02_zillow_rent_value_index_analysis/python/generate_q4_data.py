"""
Generate Q4 data with percentage formatting
"""

import pandas as pd

# Sample data based on the original Q4 results
data = {
    'state': ['RI', 'AL', 'CO', 'OH', 'MA', 'LA', 'ME', 'WI', 'WV', 'VT'],
    'avg_growth_pct': [6.838, 4.719, 8.087, 4.156, 4.892, 1.373, 3.383, 1.462, 0.799, 1.401],
    'rent_volatility': [2.391, 1.902, 3.368, 1.752, 2.183, 2.143, 6.415, 3.739, 3.254, 8.267],
    'consistency_index': [2.86, 2.481, 2.401, 2.372, 2.241, 0.641, 0.527, 0.391, 0.245, 0.17]
}

df = pd.DataFrame(data)

# Add percentage formatting to all numerical columns
df['avg_growth_pct'] = df['avg_growth_pct'].apply(lambda x: f"{x:.2f}%")
df['rent_volatility'] = df['rent_volatility'].apply(lambda x: f"{x:.2f}%")
df['consistency_index'] = df['consistency_index'].apply(lambda x: f"{x:.2f}%")

# Save the CSV
df.to_csv('../outputs/csv_files/Q4_top_bottom_5_rent_growth_consistency.csv', index=False)

print("Q4 CSV file generated with percentage formatting!")
print(df)
