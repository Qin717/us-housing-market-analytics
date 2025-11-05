#!/bin/bash
# Script to run Q5 SQL query and export results to CSV
# This script executes the SQL query directly using psql

# Set paths
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../../.." && pwd)"
OUTPUT_DIR="$PROJECT_ROOT/03_for_sale_listings_analysis/outputs/summary"
SQL_FILE="$SCRIPT_DIR/q5_correlation_inventory_home_value_growth_2018_2025.sql"
OUTPUT_CSV="$OUTPUT_DIR/q5_correlation_inventory_home_value_growth_2018_2025.csv"

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Database connection (adjust as needed)
# Default: assumes local PostgreSQL database named 'zillow' or uses default database
DB_NAME="${DB_NAME:-zillow}"
DB_USER="${DB_USER:-$USER}"
DB_HOST="${DB_HOST:-localhost}"
DB_PORT="${DB_PORT:-5432}"

# Export query results to CSV
echo "Running Q5 SQL query and exporting to CSV..."
echo "Output file: $OUTPUT_CSV"

# Run the SQL query and export to CSV
psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" \
  -c "\COPY (
    $(cat "$SQL_FILE")
  ) TO '$OUTPUT_CSV' WITH (FORMAT CSV, HEADER true);"

if [ $? -eq 0 ]; then
    echo "Success! CSV file generated at: $OUTPUT_CSV"
else
    echo "Error: Failed to execute SQL query. Please check:"
    echo "1. Database connection settings"
    echo "2. Required tables exist (run q1 first to create avg_for_sale_listings_state_yearly_int)"
    echo "3. home_values_yearly_clean table exists"
fi

