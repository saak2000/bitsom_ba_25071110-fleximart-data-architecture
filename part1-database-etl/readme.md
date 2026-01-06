# Part 1: Relational Database & ETL Pipeline

## Overview
This part focuses on building an end-to-end ETL pipeline using Python and SQL. Raw CSV files containing customer, product, and sales data are cleaned, transformed, and loaded into a relational database.

## Data Sources
- customers_raw.csv
- products_raw.csv
- sales_raw.csv

These files are located in the `data/` folder and act as the raw input for the ETL process.

## ETL Process
**Extract**
- Read all CSV files using Python (pandas)

**Transform**
- Removed duplicate records
- Handled missing values using appropriate strategies (fill or drop)
- Standardized phone numbers and category names
- Converted all dates to `YYYY-MM-DD` format
- Created surrogate keys where required
- Split sales data into orders and order_items tables

**Load**
- Loaded cleaned data into a MySQL database (`fleximart`)
- Insert operations were performed using Python with dynamic SQL

## Files Included
- `etl_pipeline.ipynb` – ETL logic and transformations
- `fleximart.sql` – Database schema
- `business_queries.sql` – SQL queries answering business questions
- `schema_documentation.md` – Entity descriptions and relationships
- `data_quality_report.txt` – Summary of data cleaning and loading results

## Output
A clean, normalized relational database ready for analytical queries.
