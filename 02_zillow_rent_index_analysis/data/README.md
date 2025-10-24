# Data Source

## Raw Data

**File**: `us_rent_index_raw_data.csv`

### About the Data
- **Source**: Zillow Research Data - ZORI (Zillow Observed Rent Index)
- **Geography**: Metropolitan Statistical Areas (MSAs) across the United States
- **Time Period**: January 2015 - September 2025 (monthly data)
- **Total Regions**: 697 MSAs grouped by state
- **Format**: CSV with monthly rent index values

### Data Structure
- `regionid`: Unique identifier for each region
- `sizerank`: Ranking by population size
- `regionname`: Name of the MSA
- `regiontype`: Type of region (MSA)
- `statename`: U.S. state abbreviation
- `YYYY_MM_DD`: Monthly rent index values (columns for each month from 2015-2025)

### Usage
This raw data is processed using PostgreSQL queries (see `../sql/` folder) to generate the analysis outputs.

### Data Source Link
Zillow Research: https://www.zillow.com/research/data/

