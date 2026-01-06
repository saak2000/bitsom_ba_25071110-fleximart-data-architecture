# bitsom_ba_25071110-fleximart-data-architecture

# FlexiMart Data Architecture Project

**Student Name:** [Saakshi Yadav]
**Student ID:** [bitsom_ba_25071110]
**Email:** [saakshi.yadav2000@gmail.com]
**Date:** [05-01-2025]

## Project Overview

This project implements an end-to-end data architecture solution for FlexiMart, an e-commerce platform. It covers the complete data lifecycle, including building an ETL pipeline to clean and load raw CSV data into a relational database, performing business analytics using SQL, analyzing NoSQL suitability with MongoDB, and designing a star schema–based data warehouse for analytical reporting.

## Repository Structure
├── part1-database-etl/
│   ├── etl_pipeline.ipynb
│   ├── schema_documentation.md
│   ├── business_queries.sql
│   └── data_quality_report.txt
│   └── fleximart.sql
├── part2-nosql/
│   ├── nosql_analysis.md
│   ├── mongodb_operations.ipynb
│   └── products_catalog.json
│   └── images(screenshots from mongodb)
├── part3-datawarehouse/
│   ├── star_schema_design.md
│   ├── warehouse_schema.sql
│   ├── warehouse_data.sql
│   └── analytics_queries.sql
└── README.md

## Technologies Used

- Python 3.x, pandas, mysql-connector-python
- MySQL 8.0 / PostgreSQL 14
- MongoDB 6.0

## Setup Instructions

### Database Setup

```bash
# Create databases
mysql -u root -p -e "CREATE DATABASE fleximart;"
mysql -u root -p -e "CREATE DATABASE fleximart_dw;"

# Run Part 1 - ETL Pipeline
python part1-database-etl/etl_pipeline.ipynb

# Run Part 1 - Business Queries
mysql -u root -p fleximart < part1-database-etl/business_queries.sql

# Run Part 3 - Data Warehouse
mysql -u root -p fleximart_dw < part3-datawarehouse/warehouse_schema.sql
mysql -u root -p fleximart_dw < part3-datawarehouse/warehouse_data.sql
mysql -u root -p fleximart_dw < part3-datawarehouse/analytics_queries.sql


### MongoDB Setup

mongosh < part2-nosql/mongodb_operations.ipynb

## Key Learnings

Through this project, I learned how to design and implement a complete ETL pipeline, starting from raw data ingestion to loading clean data into a relational database. I gained hands-on experience in database normalization, NoSQL document modeling, and writing aggregation queries for analytics. The project also helped me understand the practical differences between OLTP systems and data warehouses.

## Challenges Faced

1. Challenges Faced

1. Handling foreign key constraints in the data warehouse:
This was resolved by carefully validating dimension data before inserting fact records and ensuring all keys were aligned.

2. Managing missing and inconsistent data in raw files:
Appropriate strategies such as filling defaults, standardizing formats, and dropping invalid records were applied to maintain data quality.

