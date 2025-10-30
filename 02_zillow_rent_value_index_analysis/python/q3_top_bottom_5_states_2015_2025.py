"""
Q3: Top & Bottom 5 States by Rent Growth (2015-2025)
Creates a combination chart showing rent values and growth percentages
"""

import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

# Load data
df = pd.read_csv('../outputs/csv_files/Q3_top_bottom_5_states_2015_2025.csv')

# Create figure and axes
fig, ax1 = plt.subplots(figsize=(16, 10))
ax2 = ax1.twinx()

# Set up positions and width for bars
x_pos = np.arange(len(df))
width = 0.35

# Create bar charts
ax1.bar(x_pos - width/2, df['rent_2015'], width, label='rent_2015', color='#1f77b4')
ax1.bar(x_pos + width/2, df['rent_2025'], width, label='rent_2025', color='#2ca02c')

# Create line chart for growth percentage
ax2.plot(x_pos, df['total_growth_pct'], color='red', marker='o', 
         linewidth=3, markersize=8, label='total_growth_pct')

# Customize axes
ax1.set_xlabel('State', fontsize=14, fontweight='bold')
ax1.set_ylabel('Average Rent ($)', fontsize=14, fontweight='bold')
ax2.set_ylabel('Total Growth (%)', fontsize=14, fontweight='bold')

# Set x-axis labels
ax1.set_xticks(x_pos)
ax1.set_xticklabels(df['state'], fontsize=12)

# Set y-axis ranges and formatting
ax1.set_ylim(0, 3000)
ax1.set_yticks([0, 500, 1000, 1500, 2000, 2500, 3000])
ax1.yaxis.set_major_formatter(plt.FuncFormatter(lambda x, p: f'{x:,.0f}'))

ax2.set_ylim(0, 140)
ax2.set_yticks([0, 20, 40, 60, 80, 100, 120, 140])

# Add value labels on line chart
for i, value in enumerate(df['total_growth_pct']):
    ax2.text(i, value + 3, f'{value:.2f}%', ha='center', va='bottom', 
             fontsize=10, fontweight='bold')

# Add legend
lines1, labels1 = ax1.get_legend_handles_labels()
lines2, labels2 = ax2.get_legend_handles_labels()
ax1.legend(lines1 + lines2, labels1 + labels2, loc='upper left', fontsize=12)

# Add title
plt.title('Top & Bottom 5 States by Rent Growth (2015 – 2025)', 
          fontsize=18, fontweight='bold', pad=20)

# Add insight box
insight_text = ("Insight: Western states like Colorado and Idaho saw rents more than double over the decade,\n"
                "reflecting population and economic growth, while Midwest and Southern states showed minimal\n"
                "rent increases, suggesting stable but slower housing markets.")
plt.figtext(0.5, 0.05, insight_text, ha='center', va='bottom', 
            fontsize=11, bbox=dict(boxstyle="round,pad=0.8", facecolor="white", edgecolor="black"))

# Save chart
plt.tight_layout()
plt.subplots_adjust(bottom=0.2)
plt.savefig('../outputs/charts/q3_top_bottom_5_states_2015_2025.png', dpi=300, bbox_inches='tight')
plt.show()

print("Chart saved successfully!")
