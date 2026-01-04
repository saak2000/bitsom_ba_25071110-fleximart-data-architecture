Part 3.1: Star Schema Design – FlexiMart Data Warehouse

Section 1: Schema Overview
The FlexiMart data warehouse is designed using a star schema to support efficient analytical queries and reporting. The schema consists of one central fact table connected to multiple dimension tables.

FACT TABLE: fact_sales

Grain:
One row represents one product sold in one order (line-item level).

Business Process:
Sales transactions generated from customer orders.

Measures (Numeric Facts):
quantity_sold: Number of units sold for the product
unit_price: Price per unit at the time of sale
discount_amount: Discount applied on the sale
total_amount: Final sale value (quantity × unit_price − discount)

Foreign Keys:
date_key → dim_date
product_key → dim_product
customer_key → dim_customer
DIMENSION TABLE: dim_date

Purpose:
Enables time-based analysis such as daily, monthly, quarterly, and yearly trends.

Type:
Conformed dimension

Attributes:
date_key (PK): Surrogate key in YYYYMMDD format
full_date: Actual calendar date
day_of_week: Day name (Monday, Tuesday, etc.)
day_of_month: Numeric day
month: Month number (1–12)
month_name: Month name
quarter: Quarter (Q1–Q4)
year: Calendar year
is_weekend: Boolean flag indicating weekend

DIMENSION TABLE: dim_product

Purpose:
Stores descriptive details about products sold.

Attributes:
product_key (PK): Surrogate product identifier
product_id: Business product ID from source system
product_name: Name of the product
category: Product category
subcategory: Product subcategory
unit_price: Standard unit price

DIMENSION TABLE: dim_customer

Purpose:
Stores customer demographic and segmentation information.

Attributes:
customer_key (PK): Surrogate customer identifier
customer_id: Business customer ID from source system
customer_name: Full customer name
city: Customer city
state: Customer state
customer_segment: Customer classification (e.g., Retail, Corporate)

--------------------------------------------------------------------------------
Section 2: Design Decisions

The star schema has been designed at the transaction line-item level, which means each record in the fact table represents one product sold in a single order. This level of detail was chosen because it provides flexibility during analysis. It allows us to study sales at a very granular level, such as understanding how individual products perform, how much each customer spends, and how sales change over time. At the same time, this detailed data can still be easily aggregated to produce summaries like monthly revenue or category-wise sales.

Surrogate keys are used instead of business identifiers such as product_id or customer_id to ensure stability and better performance. Business keys may change over time due to system updates or data corrections, but surrogate keys remain constant. This helps maintain consistency in historical reports and avoids issues when analyzing data across long time periods.

The schema also supports both drill-down and roll-up analysis efficiently. For example, users can roll up sales figures from daily data to monthly or quarterly summaries using the date dimension, or drill down from overall category sales to individual product performance. Keeping descriptive information in separate dimension tables reduces redundancy and improves query efficiency, making the design well suited for analytical and reporting use cases.

--------------------------------------------------------------------------------

Source Transaction:
Order#101, Customer John Doe, Product Laptop, Quantity: 2, Unit Price: ₹50,000

Becomes in Data Warehouse:

fact_sales

date_key: 20240115
product_key: 5
customer_key: 12
quantity_sold: 2
unit_price: 50000
total_amount: 100000


dim_date

date_key: 20240115
full_date: 2024-01-15
month: 1
quarter: Q1
year: 2024


dim_product

product_key: 5
product_name: Laptop
category: Electronics


dim_customer

customer_key: 12
customer_name: John Doe
city: Mumbai

Please note - Order numbers are not stored because the data warehouse is designed for analysis and reporting rather than tracking individual orders.