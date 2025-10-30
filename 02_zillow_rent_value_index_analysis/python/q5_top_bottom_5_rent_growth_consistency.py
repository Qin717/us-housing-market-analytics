# ------------------------------------------------------------
# Q5: Top & Bottom 5 States by Rent Growth Consistency (2015–2025)
# Simpler, clean version (horizontal bars + insight box)
# ------------------------------------------------------------
import pandas as pd
import matplotlib.pyplot as plt
from matplotlib.patches import Patch

# 1️⃣ Load dataset
file_path = "../outputs/csv_files/Q5_top_bottom_5_rent_growth_consistency.csv"
df = pd.read_csv(file_path)

# 2️⃣ Prepare data for plotting
data = df.copy()
# Convert consistency_index back to numeric for plotting (remove % and convert to float)
data['consistency_index_numeric'] = data['consistency_index'].str.replace('%', '').astype(float)

# 3️⃣ Plot
plt.figure(figsize=(10, 6))
colors = ['limegreen'] * 5 + ['steelblue'] * 5  # green=consistent, blue=inconsistent
bars = plt.barh(data['state'], data['consistency_index_numeric'], color=colors)

# Add labels to bars
for bar in bars:
    width = bar.get_width()
    plt.text(width + 0.05, bar.get_y() + bar.get_height()/2,
             f"{width:.2f}%", va='center', fontsize=10)

# 4️⃣ Titles and labels
plt.suptitle("Top & Bottom 5 States by Rent Growth Consistency (2015–2025)", 
             fontsize=15, weight='bold', y=0.95)
plt.figtext(0.5, 0.88, "Measured as Avg YoY Growth / Rent Volatility (STDEV.P)", 
            ha='center', va='center', fontsize=10, color='gray')
plt.xlabel("Consistency Index (Higher = More Stable Growth)", fontsize=8)
plt.ylabel("State", fontsize=12)
plt.gca().invert_yaxis()  # show most consistent on top

# Add vertical grid lines
plt.grid(True, axis='x', alpha=0.3, linestyle='-', linewidth=0.5)
# Add border around the chart
ax = plt.gca()
for spine in ax.spines.values():
    spine.set_visible(True)
    spine.set_linewidth(1)

# Format axes
ax.set_xlim(0, data['consistency_index_numeric'].max() + 0.5)
# Set 4 tick marks on x-axis
ax.set_xticks([0, 1, 2, 3])
ax.set_xticklabels(['0%', '1%', '2%', '3%'], fontsize=10)

# 5️⃣ Legend
legend = [Patch(facecolor='limegreen', label='Most Consistent'),
          Patch(facecolor='steelblue', label='Least Consistent')]
plt.legend(handles=legend, loc='lower right', fontsize=8)

# 6️⃣ Insight box
plt.figtext(0.5, -0.08,
    "Insight:\nRhode Island, Alabama, and Colorado showed the most stable rent growth, "
    "reflecting strong, balanced housing demand, while Vermont and West Virginia displayed "
    "high volatility, indicating less predictable and more fragile rental markets.",
    ha='center', va='top', wrap=True, fontsize=10,
    bbox=dict(facecolor='white', edgecolor='black', boxstyle='round,pad=0.6'))

# 7️⃣ Save chart
plt.tight_layout(rect=[0, 0, 1, 0.95])
plt.savefig('../outputs/charts/q5_top_bottom_5_rent_growth_consistency.png',
            dpi=300, bbox_inches='tight')
plt.show()

print("Chart saved successfully!")
