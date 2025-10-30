"""
Q3: Top & Bottom 5 States by Rent Volatility (2015–2025)
Creates a horizontal bar chart showing most volatile and most stable states
"""

import pandas as pd
import matplotlib.pyplot as plt
from matplotlib.patches import Patch

# Load data
df = pd.read_csv('../outputs/csv_files/Q3_top_bottom_5_states_rent_volatility.csv')

# Create chart
fig, ax = plt.subplots(figsize=(10, 6))

# Colors
red = "darkred"
blue = "steelblue"
colors = [red] * 5 + [blue] * 5

# Create horizontal bars
bars = ax.barh(df['state'], df['rent_volatility'], color=colors, height=0.6)

# Add value labels
for i, bar in enumerate(bars):
    width = bar.get_width()
    ax.text(width + 0.2, bar.get_y() + bar.get_height()/2,
            f"{width:.2f}%", ha='left', va='center', fontsize=10)

# Title and labels
plt.suptitle("Top & Bottom 5 States by Rent Volatility", fontsize=16, weight='bold', y=0.95)
plt.figtext(0.5, 0.88, "Measured as standard deviation of YoY rent growth (%) (2015–2025)", 
            ha='center', va='center', fontsize=10, color='gray')
ax.set_xlabel("Rent Volatility (%)", fontsize=10)
ax.set_ylabel("State", fontsize=10)

# Format axes
ax.set_xlim(0, df['rent_volatility'].max() + 2)
ax.invert_yaxis()
ax.set_xticks(range(0, 15, 2))
ax.set_xticklabels([f"{x:.2f}%" for x in range(0, 15, 2)], fontsize=10)
# Add vertical grid lines
ax.grid(True, axis='x', alpha=0.3, linestyle='-', linewidth=0.5)

# Legend
legend_elements = [
    Patch(facecolor=red, label='Most Volatile'),
    Patch(facecolor=blue, label='Most Stable')
]
ax.legend(handles=legend_elements, loc='lower right', frameon=True, fontsize=8)

# Insight box
insight_text = ("Western states like Montana, Vermont, and Wyoming experienced the highest rent volatility (6–12%),\n"
                "while Ohio, Missouri, and Louisiana showed the most stable rent patterns across 2015–2025.")
plt.figtext(0.5, -0.08, f"Insight:\n{insight_text}", ha='center', va='top',
            fontsize=10, linespacing=1.4,
            bbox=dict(facecolor='white', edgecolor='black', boxstyle='round,pad=0.6'))

# Save chart
plt.tight_layout(rect=[0, 0, 1, 0.95])
plt.savefig('../outputs/charts/q3_top_bottom_5_states_rent_volatility.png', dpi=300, bbox_inches='tight')
plt.show()

print("Chart saved successfully!")
