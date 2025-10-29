# ------------------------------------------------------------
# Q3: Top & Bottom 5 States by Rent Volatility (2015–2025)
# Replicates Excel-style chart (horizontal bars + insight)
# ------------------------------------------------------------
import pandas as pd
import matplotlib.pyplot as plt
import os

# 1️⃣ Load data
file_path = "/Users/qinqin/Desktop/Zillow/02_zillow_rent_value_index_analysis/outputs/csv_files/Q3_top_bottom_5_states_rent_volatility.csv"
df = pd.read_csv(file_path)

# 2️⃣ Prepare data for plotting
top_bottom = df.copy()

# 5️⃣ Plot setup
fig, ax = plt.subplots(figsize=(10, 6))
red = "#C00000"
blue = "#5B9BD5"

# Assign colors: top 5 red, bottom 5 blue
colors = [red]*5 + [blue]*5

# 6️⃣ Horizontal bars
bars = ax.barh(top_bottom['state'], top_bottom['rent_volatility'],
               color=colors, edgecolor='none', height=0.6)

# Add value labels to right of bars
for i, bar in enumerate(bars):
    width = bar.get_width()
    ax.text(width + 0.2, bar.get_y() + bar.get_height()/2,
            f"{width:.2f}%", ha='left', va='center', fontsize=10, color='black')

# 7️⃣ Title & subtitle
plt.title("Top & Bottom 5 States by Rent Volatility", fontsize=16, weight='bold', pad=10)
plt.suptitle("Measured as standard deviation of YoY rent growth (%)\n(2015–2025)",
             fontsize=11, y=0.91, color='gray')

# 8️⃣ Axis formatting
ax.set_xlabel("Rent Volatility (%)", fontsize=12)
ax.set_xlim(0, top_bottom['rent_volatility'].max() + 2)
ax.invert_yaxis()  # Top-down ordering (most volatile at top)
ax.set_xticks(range(0, 15, 2))
ax.set_xticklabels([f"{x:.2f}%" for x in range(0, 15, 2)], fontsize=10)

# Remove grid and box for a clean layout
ax.grid(False)
plt.box(False)

# 9️⃣ Custom legend
from matplotlib.patches import Patch
legend_elements = [
    Patch(facecolor=red, label='Most Volatile'),
    Patch(facecolor=blue, label='Most Stable')
]
ax.legend(handles=legend_elements, loc='lower right', frameon=True, fontsize=10)

# 🔟 Add insight box
insight_title = "Insight:"
insight_text = (
    "Western states like Montana, Vermont, and Wyoming experienced the highest rent volatility (6–12%), "
    "while Ohio, Missouri, and Louisiana showed the most stable rent patterns across 2015–2025."
)
plt.figtext(0.5, -0.08,
            f"{insight_title}\n{insight_text}",
            ha='center', va='top', wrap=True,
            fontsize=10, linespacing=1.4,
            bbox=dict(facecolor='white', edgecolor='black', boxstyle='round,pad=0.6'))

# 11️⃣ Save chart
plt.tight_layout(rect=[0, 0, 1, 0.95])
charts_dir = "/Users/qinqin/Desktop/Zillow/02_zillow_rent_value_index_analysis/outputs/charts"
os.makedirs(charts_dir, exist_ok=True)
output_path = os.path.join(charts_dir, "q3_top_bottom_5_states_rent_volatility.png")
plt.savefig(output_path, dpi=300, bbox_inches='tight')
plt.show()

print(f"✅ Chart saved to: {output_path}")
