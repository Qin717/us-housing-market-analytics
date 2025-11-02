"""
Q3: Create chart for Top 5 States Showing the Largest Gap Between 
    Home-Price Growth and Rent Growth — and How Inventory Trends Related
"""

import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
import os

# Set up paths
base_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
csv_file = os.path.join(base_dir, 'outputs', 'csv_files', 'q3_largest_gap_home_price_rent_growth_inventory.csv')
chart_file = os.path.join(base_dir, 'outputs', 'charts', 'q3_largest_gap_home_price_rent_growth_inventory.png')

# Load data
df = pd.read_csv(csv_file)

# Remove % signs and convert to numeric
df['avg_home_growth'] = df['avg_home_growth'].str.replace('%', '').astype(float)
df['avg_rent_growth'] = df['avg_rent_growth'].str.replace('%', '').astype(float)
df['growth_divergence'] = df['growth_divergence'].str.replace('%', '').astype(float)
df['avg_inventory_change'] = df['avg_inventory_change'].str.replace('%', '').astype(float)

# Sort by divergence descending
df = df.sort_values('growth_divergence', ascending=False)

# Create figure with subplots
fig, (ax1, ax2) = plt.subplots(2, 1, figsize=(14, 12))
fig.suptitle('Top 5 States Showing the Largest Gap Between Home-Price Growth\nand Rent Growth — and How Inventory Trends Related (2018–2025)', 
             fontsize=16, fontweight='bold', y=0.995)

# Chart 1: Bar chart showing home growth vs rent growth with gap
x_pos = np.arange(len(df))
width = 0.35

bars1 = ax1.bar(x_pos - width/2, df['avg_home_growth'], width, 
                label='Home-Price Growth', color='#2c5aa0', alpha=0.8)
bars2 = ax1.bar(x_pos + width/2, df['avg_rent_growth'], width, 
                label='Rent Growth', color='#d62728', alpha=0.8)

# Add value labels on bars
for bars in [bars1, bars2]:
    for bar in bars:
        height = bar.get_height()
        ax1.text(bar.get_x() + bar.get_width()/2., height + 0.1,
                f'{height:.2f}%',
                ha='center', va='bottom', fontsize=9, fontweight='bold')

# Add divergence as text above bars
for i, row in df.iterrows():
    ax1.text(i, max(row['avg_home_growth'], row['avg_rent_growth']) + 1,
            f'Gap: {row["growth_divergence"]:.2f}%',
            ha='center', va='bottom', fontsize=10, fontweight='bold',
            bbox=dict(boxstyle='round,pad=0.3', facecolor='yellow', alpha=0.7))

ax1.set_xlabel('State', fontsize=12, fontweight='bold')
ax1.set_ylabel('Growth Rate (%)', fontsize=12, fontweight='bold')
ax1.set_xticks(x_pos)
ax1.set_xticklabels(df['state_name'], fontsize=11)
ax1.legend(loc='upper left', fontsize=11)
ax1.grid(axis='y', alpha=0.3, linestyle='--')
ax1.set_ylim(0, max(df['avg_home_growth'].max(), df['avg_rent_growth'].max()) + 3)

# Chart 2: Inventory change bar chart
colors = ['#ff6b6b' if x < 0 else '#51cf66' for x in df['avg_inventory_change']]
bars3 = ax2.bar(x_pos, df['avg_inventory_change'], width=0.6, 
                color=colors, alpha=0.8, edgecolor='black', linewidth=1.5)

# Add value labels on bars
for bar in bars3:
    height = bar.get_height()
    ax2.text(bar.get_x() + bar.get_width()/2., height + (0.3 if height > 0 else -0.8),
            f'{height:.2f}%',
            ha='center', va='bottom' if height > 0 else 'top', 
            fontsize=10, fontweight='bold')

ax2.set_xlabel('State', fontsize=12, fontweight='bold')
ax2.set_ylabel('Average Inventory Change (%)', fontsize=12, fontweight='bold')
ax2.set_xticks(x_pos)
ax2.set_xticklabels(df['state_name'], fontsize=11)
ax2.axhline(y=0, color='black', linestyle='-', linewidth=1)
ax2.grid(axis='y', alpha=0.3, linestyle='--')
ax2.set_title('Average Inventory Change (2018–2025)', fontsize=13, fontweight='bold', pad=10)

# Add text annotation explaining the relationship
fig.text(0.5, 0.02, 
        'Note: All 5 states show negative inventory change (supply shortages) while home prices grow faster than rents.',
        ha='center', fontsize=10, style='italic', color='#666666')

plt.tight_layout(rect=[0, 0.05, 1, 0.98])

# Save chart
os.makedirs(os.path.dirname(chart_file), exist_ok=True)
plt.savefig(chart_file, dpi=300, bbox_inches='tight')
print(f"✅ Chart saved: {chart_file}")

plt.close()

