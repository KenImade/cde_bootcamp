# CoreDataEngineers Data Pipeline

## ETL Process

### Overview
This project implements an ETL (Extract, Transform, Load) process for managing data. 

### Bash Scripts
- **`etl_script.sh`**: Handles the ETL process including downloading, transforming, and loading CSV files.
- **`move_files.sh`**: Moves CSV and JSON files to a specified directory.
- **`load_csv_to_postgres.sh`**: Loads CSV files into a PostgreSQL database.

### SQL Queries
- **`queries.sql`**: Contains SQL queries to answer specific questions about the data.

## How to Run

### ETL Process
1. Make the script executable: `chmod +x etl_script.sh`
2. Run the script: `./etl_script.sh`

### Moving Files
1. Make the script executable: `chmod +x move_files.sh`
2. Run the script: `./move_files.sh`

### Loading CSV into PostgreSQL
1. Make the script executable: `chmod +x load_csv_to_postgres.sh`
2. Run the script: `./load_csv_to_postgres.sh`

## Architectural Diagram
(Insert your ETL pipeline diagram here)

## Notes
- Ensure the CSV file URL is correctly set in `etl_script.sh`.
- Update database connection details as needed in `load_csv_to_postgres.sh`.
- Replace placeholder paths and table names with actual values.