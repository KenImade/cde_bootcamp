#!/bin/bash


# Environmental Variables
CSV_URL="https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv"
RAW_DIR="raw"
TRANSFORMED_DIR="Transformed"
GOLD_DIR="Gold"
RAW_CSV="annual-enterprise-survey-2023-financial-year-provisional.csv"
TRANSFORMED_CSV="2023_year_finance.csv"

# Create directories if they don't exist
mkdir -p "$RAW_DIR"
mkdir -p "$TRANSFORMED_DIR"
mkdir -p "$GOLD_DIR"

# Download file into raw folder
echo "Starting download....."
wget -o "$RAW_DIR/$RAW_CSV" "$CSV_URL"

# Confirm file download
if [ -f "$RAW_DIR/$RAW_CSV" ]; then
    echo "File has been downloaded to $RAW_DIR."
else
    echo "File has not been downloaded."
    exit 1
fi

# Transform data
echo "Starting tranformation......."
awk -F, 'BEGIN {OFS=","} 
    NR==1 {for (i=1; i<=NF; i++) if ($i == "Variable_code") var_col=i}
    NR>1 {print $1, $2, $3, $var_col}
    ' "$RAW_DIR/$RAW_CSV" | sed '1s/Variable_code/variable_code/' > "$TRANSFORMED_DIR/$TRANSFORMED_CSV"

# Confirm transformation
if [ -f "$TRANSFORMED_DIR/$TRANSFORMED_CSV" ]; then
    echo "Transformed file saved to $TRANSFORMED_DIR."
else
    echo "Error: Transformation failed."
    exit 1
fi

# Load
echo "Loading data..."
cp "$TRANSFORMED_DIR/$TRANSFORMED_CSV" "$GOLD_DIR/"

# Confirm loading
if [ -f "$GOLD_DIR/$TRANSFORMED_CSV" ]; then
    echo "File has been loaded into $GOLD_DIR."
else
    echo "Error: Loading failed."
    exit 1
fi

echo "ETL process completed."