# Part 3: Data Warehouse & Star Schema

## Overview
This part focuses on designing and implementing a data warehouse using a star schema to support analytical reporting and business intelligence.

## Star Schema Design
The warehouse follows a classic star schema with:
- One fact table: `fact_sales`
- Three dimension tables:
  - `dim_date`
  - `dim_product`
  - `dim_customer`

This design supports efficient aggregation and time-based analysis.

## Data Population
Synthetic but realistic data was generated to meet assignment requirements:
- 30 dates (January–February 2024)
- 15 products across 3 categories
- 12 customers across multiple cities
- 40 sales transactions with higher volumes on weekends

All foreign key relationships were validated to ensure data correctness.

## Analytics
Analytical SQL queries were written to answer questions such as:
- Monthly sales trends
- Revenue by category
- Quantity sold over time
- Customer and product performance

## Files Included
- `warehouse_schema.sql` – Star schema table definitions
- `warehouse_data.sql` – INSERT statements for all tables
- `analytics_queries.sql` – Analytical SQL queries
- `star_schema_design.md` – Explanation of schema design
