"""
Create scatterplot for Q4: Undersupplied Markets with Upward Pressure

This script creates a scatterplot showing listings YoY growth vs price YoY growth,
with reference lines at 0 to identify undersupplied markets.
Uses Zillow color palette and styling.
"""

import pandas as pd
import matplotlib.pyplot as plt
from pathlib import Path

# Define paths
project_root = Path(__file__).parent.parent.parent.parent
data_file = project_root / "03_for_sale_listings_analysis" / "outputs" / "summary" / "q4_undersupplied_markets_upward_pressure.csv"
output_file = project_root / "03_for_sale_listings_analysis" / "outputs" / "charts" / "q4_undersupplied_markets_upward_pressure.png"

print("=" * 60)
print("Creating Q4 Scatterplot: Undersupplied Markets with Upward Pressure")
print("=" * 60)

# === Load and clean data ===
print("\nReading data...")
df = pd.read_csv(data_file)

# Ensure numeric columns are floats
df[["listings_yoy", "price_yoy"]] = df[["listings_yoy", "price_yoy"]].astype(float)

# === Zillow brand palette ===
zillow_bg = "#6AB6FF"   # sky blue background
zillow_yellow = "#FFD84D"  # for stable/recovering
zillow_red = "#D62828"     # for undersupplied
white = "#FFFFFF"

# === Figure setup ===
fig, ax = plt.subplots(figsize=(10, 6))
fig.patch.set_facecolor(zillow_bg)
ax.set_facecolor(zillow_bg)

# === Set axis limits ===
x_min, x_max = df["listings_yoy"].min() - 2, df["listings_yoy"].max() + 2
y_min, y_max = df["price_yoy"].min() - 1, df["price_yoy"].max() + 1
ax.set_xlim(x_min, x_max)
ax.set_ylim(y_min, y_max)

# === Quadrant shading (using 0 as threshold) ===
alpha = 0.08
for x0, x1, y0, y1 in [
    (x_min, 0, y_min, 0),
    (0, x_max, y_min, 0),
    (x_min, 0, 0, y_max),
    (0, x_max, 0, y_max),
]:
    ax.add_patch(
        plt.Rectangle((x0, y0), x1 - x0, y1 - y0,
                      facecolor="white", alpha=alpha, zorder=1)
    )

# === Scatter points ===
for cond, color, fill, label in [
    ("Stable or recovering", zillow_yellow, zillow_yellow, "Stable or recovering"),
    ("⚠️ Slightly undersupplied", zillow_red, zillow_red, "Slightly undersupplied"),
    ("⚠️ Undersupplied — upward pressure", zillow_red, zillow_red, "Undersupplied — upward pressure"),
]:
    subset = df[df["market_condition"] == cond]
    if len(subset) > 0:
        ax.scatter(subset["listings_yoy"], subset["price_yoy"],
                   edgecolors=white, facecolors=fill,
                   linewidths=1.2, s=60, label=label, zorder=3)
        # right-side labels
        for _, row in subset.iterrows():
            ax.text(
                row["listings_yoy"] + 0.4,
                row["price_yoy"],
                row["state"],
                ha="left", va="center",
                color=white, fontsize=7.5
            )

# === Reference lines at 0 ===
ax.axvline(0, color=white, linestyle="--", linewidth=1.2, zorder=2)
ax.axhline(0, color=white, linestyle="--", linewidth=1.2, zorder=2)

# === Annotations for reference lines ===
zillow_blue_text = "#1E63FF"
ax.text(0 + 0.5, y_max - 0.5, "Listings Growth = 0%",
        color=zillow_blue_text, fontsize=8.5, ha="left", va="top", fontweight="bold")
ax.text(x_max - 1, 0 + 0.1, "Price Growth = 0%",
        color=zillow_blue_text, fontsize=8.5, ha="right", va="bottom", fontweight="bold")

# === Titles ===
plt.title(
    "Undersupplied U.S. Housing Markets with Upward Pressure (2024)",
    color=white, fontsize=13, fontweight="bold", pad=18
)
ax.set_xlabel("Listings YoY Growth (%)", color=white, fontsize=10, fontweight="bold")
ax.set_ylabel("Price YoY Growth (%)", color=white, fontsize=10, fontweight="bold")

# === Axis & legend styling ===
ax.tick_params(colors=white, labelsize=8.5)
for spine in ax.spines.values():
    spine.set_visible(False)

legend = ax.legend(
    facecolor=zillow_bg,
    frameon=False,
    fontsize=8.5,
    loc="upper left",
    labelcolor=white
)
for text in legend.get_texts():
    text.set_color(white)

# === Add Zillow logo in bottom right corner ===
try:
    from matplotlib import image as mpimg
    from matplotlib.offsetbox import OffsetImage, AnnotationBbox
    from PIL import Image
    import numpy as np
    
    logo_path = project_root / "zillow_logo.png"
    if not logo_path.exists():
        logo_path = project_root / "zillow_logo.svg"
    
    if logo_path.exists():
        try:
            with open(logo_path, 'rb') as f:
                first_bytes = f.read(100)
                is_svg = b'<svg' in first_bytes or b'<?xml' in first_bytes
            
            if str(logo_path).lower().endswith('.svg') or is_svg:
                print("Note: Logo file appears to be SVG format.")
                print("Please convert zillow_logo.png to a PNG file with transparency.")
                raise Exception("SVG file detected. Please convert to PNG format.")
            else:
                pil_img = Image.open(logo_path)
            
            if pil_img.mode != 'RGBA':
                pil_img = pil_img.convert('RGBA')
            
            data = np.array(pil_img)
            if len(data.shape) == 3 and data.shape[2] == 4:
                white_threshold = 240
                mask = (data[:, :, 0] > white_threshold) & (data[:, :, 1] > white_threshold) & (data[:, :, 2] > white_threshold)
                data[:, :, 3][mask] = 0
            
            logo_img = Image.fromarray(data)
            logo_array = np.array(logo_img)
        except Exception as e:
            try:
                logo_array = mpimg.imread(logo_path)
                if logo_array.shape[2] == 3:
                    alpha = np.ones((logo_array.shape[0], logo_array.shape[1], 1)) * 255
                    logo_array = np.concatenate([logo_array, alpha], axis=2)
                white_threshold = 0.94
                if logo_array.shape[2] == 4:
                    mask = (logo_array[:, :, 0] > white_threshold) & (logo_array[:, :, 1] > white_threshold) & (logo_array[:, :, 2] > white_threshold)
                    logo_array[:, :, 3][mask] = 0
            except Exception as e2:
                print(f"Could not process logo: {e2}")
                logo_array = None
        
        if logo_array is not None:
            imagebox = OffsetImage(logo_array, zoom=0.03)
            ab = AnnotationBbox(imagebox, (0.99, 0.01), 
                               xycoords='axes fraction',
                               box_alignment=(1, 0),
                               frameon=False,
                               pad=0)
            ax.add_artist(ab)
            print("Zillow logo added to bottom right corner")
except Exception as e:
    print(f"Note: Could not load Zillow logo: {e}")

plt.tight_layout()

# Save the plot
output_file.parent.mkdir(parents=True, exist_ok=True)
plt.savefig(output_file, dpi=300, bbox_inches='tight', facecolor=zillow_bg)
print(f"\nChart saved to: {output_file}")

# Print summary statistics
undersupplied = df[df["market_condition"] == "⚠️ Undersupplied — upward pressure"]
slightly_undersupplied = df[df["market_condition"] == "⚠️ Slightly undersupplied"]
print(f"\n{'='*60}")
print("Summary Statistics:")
print(f"{'='*60}")
print(f"Total states: {len(df)}")
print(f"Undersupplied markets (upward pressure): {len(undersupplied)}")
print(f"Slightly undersupplied: {len(slightly_undersupplied)}")
print(f"Stable or recovering: {len(df) - len(undersupplied) - len(slightly_undersupplied)}")
print(f"\n{'='*60}")

plt.close()

