"""Create Q6 charts: rent recovery map and bar chart (simplified version)."""

import os

import matplotlib

matplotlib.use("Agg")
import matplotlib.pyplot as plt
import pandas as pd
import plotly.express as px
import plotly.graph_objects as go


CSV_FILE = "../outputs/csv_files/q6_top_10_states_by_rent_recovery_growth_post_covid.csv"
CHARTS_FOLDER = "../outputs/charts"
MAP_OUTPUT = "q6_top_10_states_by_rent_recovery_grwoth_post_covid_map.png"
BAR_OUTPUT = "q6_top_10_states_by_rent_recovery_grwoth_post_covid_chart.png"

STATE_CENTROIDS = {
    "RI": (-71.5, 41.6),
    "CT": (-72.7, 41.6),
    "NJ": (-74.5, 40.1),
    "DE": (-75.5, 39.0),
    "NH": (-71.7, 43.2),
}

CUSTOM_LABEL_OFFSETS = {
    "RI": (1.8, 0.0),
    "CT": (-1.6, 0.2),
    "NJ": (-1.5, 0.1),
    "DE": (-1.6, -0.1),
    "NH": (2.2, 0.0),
}



def load_top10_states() -> pd.DataFrame:
    """Load the prepared Q6 CSV and return the Top 10 states by recovery."""

    data = pd.read_csv(CSV_FILE)

    if "recovery_pct" in data.columns:
        recovery = data["recovery_pct"]
    else:
        recovery = data["recovery_growth_pct"].astype(str).str.replace("%", "", regex=False)

    data["recovery_pct"] = recovery.astype(float)
    top10 = data.sort_values("recovery_pct", ascending=False).head(10).reset_index(drop=True)
    return top10


def build_map(top10: pd.DataFrame) -> None:
    """Generate the choropleth map and save it to the charts folder."""

    fig = px.choropleth(
        top10,
        locations="state",
        locationmode="USA-states",
        color="recovery_pct",
        color_continuous_scale=["#CFE8FF", "#0070FF"],
        range_color=(top10["recovery_pct"].min(), top10["recovery_pct"].max()),
        scope="usa",
        labels={"recovery_pct": "Recovery (%)"},
        title=(
            "Top 10 States by Rent Recovery Post-COVID"
            "<br><sup>Measured as % increase in average rent from 2020 to 2023</sup>"
        ),
    )

    for _, row in top10.iterrows():
        state = row["state"]
        label = f"{state} {row['recovery_pct']:.0f}%"

        if state in CUSTOM_LABEL_OFFSETS:
            lon, lat = STATE_CENTROIDS[state]
            offset_lon, offset_lat = CUSTOM_LABEL_OFFSETS[state]
            fig.add_trace(
                go.Scattergeo(
                    lon=[lon + offset_lon],
                    lat=[lat + offset_lat],
                    text=label,
                    mode="text",
                    textfont=dict(size=3, color="black"),
                    showlegend=False,
                )
            )
        else:
            fig.add_scattergeo(
                locations=[state],
                locationmode="USA-states",
                text=label,
                mode="text",
                textfont=dict(size=3, color="black"),
                showlegend=False,
            )

    fig.update_layout(
        width=1600,
        height=800,
        title={"font": {"size": 18}, "x": 0.5, "xanchor": "center"},
        font={"size": 11},
        coloraxis=dict(cmin=30, cmax=70),
        coloraxis_colorbar={
            "title": {"text": "Recovery (%)", "font": {"size": 9}},
            "tickfont": {"size": 6},
            "len": 0.55,
            "thickness": 18,
            "x": 1.04,
            "xanchor": "left",
            "tickvals": [30, 50, 70],
            "ticktext": ["30%", "50%", "70%"],
        },
        margin={"l": 120, "r": 120, "t": 120, "b": 140},
    )

    fig.add_annotation(
        x=0.5,
        y=-0.12,
        xref="paper",
        yref="paper",
        text=(
            "<b>Insight:</b><br>Montana and other Mountain states led post-COVID rent rebounds as remote work demand shifted inland.<br>"
            "Florida, Georgia, and the wider Sun Belt saw strong recovery fueled by migration and job growth.<br>"
            "Northeastern markets recovered steadily with moderate rent gains and lower volatility."
        ),
        showarrow=False,
        align="center",
        xanchor="center",
        yanchor="top",
        font=dict(size=11, color="black"),
        bgcolor="white",
        bordercolor="#999999",
        borderwidth=1,
        borderpad=6,
    )

    os.makedirs(CHARTS_FOLDER, exist_ok=True)
    map_path = os.path.join(CHARTS_FOLDER, MAP_OUTPUT)

    try:
        import kaleido  # noqa: F401

        fig.write_image(map_path, scale=3)
        print(f"✅ Map saved: {os.path.abspath(map_path)}")
    except Exception as exc:  # pylint: disable=broad-except
        print(f"⚠️ Unable to save map PNG ({exc}). Install/repair Kaleido to export.")


def build_bar_chart(top10: pd.DataFrame) -> None:
    """Create the bar chart and save it as PNG."""

    os.makedirs(CHARTS_FOLDER, exist_ok=True)
    bar_path = os.path.join(CHARTS_FOLDER, BAR_OUTPUT)

    fig, ax = plt.subplots(figsize=(9, 5))
    bars = ax.bar(top10["state"], top10["recovery_pct"], color="#0099FF")

    for bar, value in zip(bars, top10["recovery_pct"]):
        ax.text(
            bar.get_x() + bar.get_width() / 2,
            value + 0.5,
            f"{value:.2f}%",
            ha="center",
            va="bottom",
            fontsize=9,
        )

    ax.set_title(
        "Top 10 States by Rent Recovery Growth Post-COVID",
        fontsize=13,
        fontweight="bold",
        pad=16,
    )
    ax.text(0.5, 1.02, "(% increase 2020–2023)", transform=ax.transAxes,
            ha="center", va="bottom", fontsize=10, color="gray")
    ax.set_xlabel("State")
    ax.set_ylabel("Recovery (%)")
    ax.grid(False)
    ax.spines["top"].set_visible(False)
    ax.spines["right"].set_visible(False)

    fig.tight_layout(rect=[0, 0, 1, 0.95])

    try:
        fig.savefig(bar_path, dpi=300, bbox_inches="tight")
        print(f"✅ Bar chart saved: {os.path.abspath(bar_path)}")
    except Exception as exc:  # pylint: disable=broad-except
        print(f"⚠️ Unable to save bar chart PNG ({exc}).")
    finally:
        plt.close(fig)


def main() -> None:
    top10_states = load_top10_states()

    build_map(top10_states)
    build_bar_chart(top10_states)

    print(
        """
📊 Insight:
Montana and other Mountain states led post-COVID rent rebounds as remote work demand shifted inland.
Florida, Georgia, and other Sun Belt markets posted strong gains, driven by migration and job growth.
Northeastern states recovered steadily with moderate rent increases and lower volatility.
"""
    )


if __name__ == "__main__":
    main()

