# ------------------------------------------------------------
# Q1: YoY Rent Growth by State (2016–2025) — Heatmap
# ------------------------------------------------------------
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import matplotlib.ticker as ticker

# 1️⃣ Load the data
df = pd.read_csv('../outputs/csv_files/Q1_yoy_rent_growth_by_state.csv', index_col=0)

# Ensure numeric sorting of columns (years)
df.columns = df.columns.astype(int)
df = df.sort_index(axis=1)

# 2️⃣ Configure figure
plt.figure(figsize=(16, 12))

# 3️⃣ Draw heatmap
ax = sns.heatmap(
    df,
    annot=True,              # show numbers
    fmt=".2f",               # two decimal places
    cmap="RdYlGn",           # red–yellow–green palette
    center=0,                # color balance at 0
    vmin=-10, vmax=40,       # match your chart scale
    cbar_kws={'label': 'YoY Growth (%)', 'shrink': 0.8},
    linewidths=0.5,          # white gridlines
    linecolor='white',
    square=False
)

# 4️⃣ Title and labels
plt.title('YoY Rent Growth by State (2016 – 2025)',
          fontsize=18, fontweight='bold', pad=20)
plt.xlabel('Year', fontsize=14)
plt.ylabel('State', fontsize=14)

# 5️⃣ Move x-axis labels to top (like your Excel chart)
ax.xaxis.tick_top()
ax.xaxis.set_label_position('top')

# 6️⃣ Label formatting
plt.xticks(rotation=0, fontsize=12)
plt.yticks(rotation=0, fontsize=10)

# 7️⃣ Make rows slightly wider and cleaner
ax.set_aspect('auto')

# Force cbar tick format
cbar = ax.collections[0].colorbar
cbar.ax.yaxis.set_major_formatter(ticker.FormatStrFormatter('%.0f'))

# 8️⃣ Tight layout and save
plt.tight_layout()
plt.savefig('../outputs/charts/q1_yoy_rent_growth_by_state.png',
            dpi=300, bbox_inches='tight')
plt.show()
