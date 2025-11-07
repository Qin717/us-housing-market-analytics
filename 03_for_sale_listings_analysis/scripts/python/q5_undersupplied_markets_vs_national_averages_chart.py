"""
Create scatterplot for Q5: Undersupplied Markets vs National Averages

This script creates a scatterplot showing listings YoY growth vs price YoY growth,
with national averages as reference lines and color-coding by market condition.
Uses Zillow color palette and styling with quadrant shading.
"""

import pandas as pd
import matplotlib.pyplot as plt
from pathlib import Path

# Define paths
project_root = Path(__file__).parent.parent.parent.parent
data_file = project_root / "03_for_sale_listings_analysis" / "outputs" / "summary" / "q5_undersupplied_markets_vs_national_averages.csv"
output_file = project_root / "03_for_sale_listings_analysis" / "outputs" / "charts" / "q5_undersupplied_markets_vs_national_averages.png"

print("=" * 60)
print("Creating Q5 Scatterplot: Undersupplied Markets vs National Averages")
print("=" * 60)

# === Load and clean data ===
print("\nReading data...")
df = pd.read_csv(data_file)

# Ensure numeric columns are floats
df[["listings_yoy", "price_yoy"]] = df[["listings_yoy", "price_yoy"]].astype(float)

# === Constants ===
nat_list = df['nat_listings_yoy'].iloc[0]
nat_price = df['nat_price_yoy'].iloc[0]

print(f"National averages:")
print(f"  Listings YoY: {nat_list:.2f}%")
print(f"  Price YoY: {nat_price:.2f}%")

# === Zillow brand palette ===
zillow_bg = "#6AB6FF"   # sky blue background
zillow_yellow = "#FFD84D"  # for stable/recovering
zillow_red = "#D62828"     # for undersupplied
white = "#FFFFFF"

# === Figure setup ===
fig, ax = plt.subplots(figsize=(10, 6))
fig.patch.set_facecolor(zillow_bg)
ax.set_facecolor(zillow_bg)

# === Quadrant shading ===
x_min, x_max = df["listings_yoy"].min() - 2, df["listings_yoy"].max() + 2
y_min, y_max = df["price_yoy"].min() - 1, df["price_yoy"].max() + 1
ax.set_xlim(x_min, x_max)
ax.set_ylim(y_min, y_max)

alpha = 0.08
for x0, x1, y0, y1 in [
    (x_min, nat_list, y_min, nat_price),
    (nat_list, x_max, y_min, nat_price),
    (x_min, nat_list, nat_price, y_max),
    (nat_list, x_max, nat_price, y_max),
]:
    ax.add_patch(
        plt.Rectangle((x0, y0), x1 - x0, y1 - y0,
                      facecolor="white", alpha=alpha, zorder=1)
    )

# === Scatter points ===
for cond, color, fill, label in [
    ("Stable or recovering", zillow_yellow, zillow_yellow, "Stable or recovering"),
    ("⚠️ Undersupplied — upward pressure", zillow_red, zillow_red, "Undersupplied — upward pressure"),
]:
    subset = df[df["market_condition"] == cond]
    if len(subset) > 0:
        ax.scatter(subset["listings_yoy"], subset["price_yoy"],
                   edgecolors=white, facecolors=fill,
                   linewidths=1.2, s=60, label=label, zorder=3)
        # right-side labels (except NV and KY which go below)
        for _, row in subset.iterrows():
            if row["state"] in ["NV", "KY"]:
                # Position below the dot
                ax.text(
                    row["listings_yoy"],
                    row["price_yoy"] - 0.3,
                    row["state"],
                    ha="center", va="top",
                    color=white, fontsize=7.5
                )
            else:
                # Position to the right
                ax.text(
                    row["listings_yoy"] + 0.4,
                    row["price_yoy"],
                    row["state"],
                    ha="left", va="center",
                    color=white, fontsize=7.5
                )

# === Reference lines ===
ax.axvline(nat_list, color=white, linestyle="--", linewidth=1.2)
ax.axhline(nat_price, color=white, linestyle="--", linewidth=1.2)

# === Annotations for national averages ===
# Use Zillow blue to match logo
zillow_blue_text = "#1E63FF"
ax.text(nat_list + 0.5, y_max - 0.5, f"National Avg Listings\n({nat_list:.1f}%)",
        color=zillow_blue_text, fontsize=8.5, ha="left", va="top", fontweight="bold")
ax.text(x_max - 1, nat_price + 0.1, f"National Avg Price\n({nat_price:.2f}%)",
        color=zillow_blue_text, fontsize=8.5, ha="right", va="bottom", fontweight="bold")

# === Titles ===
plt.title(
    "Undersupplied U.S. Housing Markets vs National Averages (2024)",
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
    
    # Try both .png and .svg extensions
    logo_path = project_root / "zillow_logo.png"
    if not logo_path.exists():
        logo_path = project_root / "zillow_logo.svg"
    
    if logo_path.exists():
        try:
            # Check if file is actually SVG (XML content)
            with open(logo_path, 'rb') as f:
                first_bytes = f.read(100)
                is_svg = b'<svg' in first_bytes or b'<?xml' in first_bytes
            
            if str(logo_path).lower().endswith('.svg') or is_svg:
                # For SVG files, we need to convert them
                # Since SVG libraries may not be available, provide helpful message
                print("Note: Logo file appears to be SVG format.")
                print("Please convert zillow_logo.png to a PNG file with transparency, or install svglib/cairosvg.")
                raise Exception("SVG file detected. Please convert to PNG format.")
            else:
                # Try loading with PIL first
                pil_img = Image.open(logo_path)
            
            # Convert to RGBA if not already (to preserve transparency)
            if pil_img.mode != 'RGBA':
                pil_img = pil_img.convert('RGBA')
            
            # Remove background (make white/light pixels transparent)
            data = np.array(pil_img)
            # Create mask for background (white/light grey pixels)
            # Adjust threshold as needed
            if len(data.shape) == 3 and data.shape[2] == 4:  # RGBA
                # Make white/light pixels transparent
                white_threshold = 240
                mask = (data[:, :, 0] > white_threshold) & (data[:, :, 1] > white_threshold) & (data[:, :, 2] > white_threshold)
                data[:, :, 3][mask] = 0  # Set alpha to 0 for white pixels
            
            # Convert back to image
            logo_img = Image.fromarray(data)
            logo_array = np.array(logo_img)
        except Exception as e:
            # Fallback: try with matplotlib image reader
            try:
                logo_array = mpimg.imread(logo_path)
                # If it's RGB, convert to RGBA
                if logo_array.shape[2] == 3:
                    # Add alpha channel
                    alpha = np.ones((logo_array.shape[0], logo_array.shape[1], 1)) * 255
                    logo_array = np.concatenate([logo_array, alpha], axis=2)
                # Remove white background
                white_threshold = 0.94  # Normalized threshold
                if logo_array.shape[2] == 4:
                    mask = (logo_array[:, :, 0] > white_threshold) & (logo_array[:, :, 1] > white_threshold) & (logo_array[:, :, 2] > white_threshold)
                    logo_array[:, :, 3][mask] = 0
            except Exception as e2:
                print(f"Could not process logo: {e2}")
                logo_array = None
        
        if logo_array is not None:
            # Create offset image - make it smaller
            imagebox = OffsetImage(logo_array, zoom=0.03)  # Very small zoom for smaller logo
            # Position in bottom right corner
            ab = AnnotationBbox(imagebox, (0.99, 0.01), 
                               xycoords='axes fraction',
                               box_alignment=(1, 0),
                               frameon=False,
                               pad=0)
            ax.add_artist(ab)
            print("Zillow logo added to bottom right corner (smaller size)")
        else:
            print("Could not process logo image")
    else:
        print(f"Note: Logo file not found at {logo_path}")
except ImportError as e:
    print(f"Note: Required libraries for logo not available: {e}")
except Exception as e:
    print(f"Note: Could not load Zillow logo: {e}")

plt.tight_layout()

# Save the plot
output_file.parent.mkdir(parents=True, exist_ok=True)
plt.savefig(output_file, dpi=300, bbox_inches='tight', facecolor=zillow_bg)
print(f"\nChart saved to: {output_file}")

# Print summary statistics
undersupplied = df[df["market_condition"] == "⚠️ Undersupplied — upward pressure"]
print(f"\n{'='*60}")
print("Summary Statistics:")
print(f"{'='*60}")
print(f"Total states: {len(df)}")
print(f"Undersupplied markets: {len(undersupplied)}")
print(f"Stable or recovering: {len(df) - len(undersupplied)}")
print(f"\n{'='*60}")

plt.close()
