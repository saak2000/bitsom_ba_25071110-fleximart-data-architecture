1. Database Schema Documentation – FlexiMart

Entity–Relationship Description

ENTITY: customers

Purpose:
Stores customer information for all registered users of the FlexiMart platform.

Attributes:
customer_id: Unique identifier for each customer (Primary Key)
first_name: Customer’s first name
last_name: Customer’s last name
email: Customer’s email address (must be unique)
phone: Customer’s contact phone number
city: City where the customer resides
registration_date: Date when the customer registered on the platform

Relationships:
One customer can place MANY orders
(One-to-Many relationship with the orders table)

ENTITY: products

Purpose:
Stores information about products available for sale on FlexiMart.

Attributes:
product_id: Unique identifier for each product (Primary Key)
product_name: Name of the product
category: Category to which the product belongs
price: Price of the product
stock_quantity: Number of units available in inventory

Relationships:
One product can appear in MANY order items
(One-to-Many relationship with the order_items table)

ENTITY: orders

Purpose:
Stores order-level information for customer purchases.

Attributes:
order_id: Unique identifier for each order (Primary Key)
customer_id: Identifier of the customer who placed the order (Foreign Key)
order_date: Date when the order was placed
total_amount: Total monetary value of the order
status: Current status of the order (e.g., Completed, Pending)

Relationships:
Each order belongs to ONE customer
(Many-to-One relationship with customers table)

One order can contain MANY order items
(One-to-Many relationship with order_items table)

ENTITY: order_items

Purpose:
Stores product-level details for each order.

Attributes:
order_item_id: Unique identifier for each order item (Primary Key)
order_id: Identifier of the related order (Foreign Key)
product_id: Identifier of the product purchased (Foreign Key)
quantity: Number of units purchased
unit_price: Price per unit at the time of purchase
subtotal: Total cost for the item (quantity × unit_price)

Relationships:
Each order item belongs to ONE order
(Many-to-One relationship with orders table)

Each order item references ONE product
(Many-to-One relationship with products table)



-------------------------------------------------------------------------------------------------------------------


2. Normalization Explanation, Functional Dependencies, and Anomaly Prevention

The FlexiMart database schema is designed following the principles of database normalization, progressing through First Normal Form (1NF), Second Normal Form (2NF), and Third Normal Form (3NF) to ensure data integrity, minimize redundancy, and prevent anomalies.

In First Normal Form (1NF), all tables store atomic values with no repeating groups or multivalued attributes. Each table has a clearly defined primary key (customer_id, product_id, order_id, and order_item_id), and every column contains indivisible values, such as a single email or phone number per customer.

The schema satisfies Second Normal Form (2NF) because all non-key attributes are fully functionally dependent on the entire primary key. Since each table uses a single-column primary key, there are no partial dependencies. For example, in the orders table, attributes such as order_date, total_amount, and status depend entirely on order_id. Similarly, in the order_items table, quantity, unit_price, and subtotal depend solely on order_item_id.

The design achieves Third Normal Form (3NF) by eliminating transitive dependencies. Non-key attributes do not depend on other non-key attributes. Customer-related details are stored only in the customers table, product details only in the products table, order-level information in the orders table, and item-level details in the order_items table.

The key functional dependencies in the schema are:

customer_id → first_name, last_name, email, phone, city, registration_date
product_id → product_name, category, price, stock_quantity
order_id → customer_id, order_date, total_amount, status
order_item_id → order_id, product_id, quantity, unit_price, subtotal

This design avoids update anomalies by ensuring that each piece of information is stored in exactly one place. Insert anomalies are prevented because customers, products, and orders can be inserted independently without requiring unrelated data. Delete anomalies are avoided because deleting an order or order item does not result in the loss of customer or product information.

-------------------------------------------------------------------------------------------------------------------

3. Sample Data Representation

Show 2-3 sample records from each table in table format

customers
| customer_id | first_name | last_name | email | phone | city | registration_date |
|------------|-----------|-----------|-------|-------|------|-------------------|
| C001 | Rahul | Sharma | rahul.sharma@gmail.com | +91-9876543210 | Bangalore | 2023-01-15 |
| C002 | Priya | Patel | priya.patel@yahoo.com | +91-9988776655 | Mumbai | 2023-02-20 |
| C003 | Amit | Kumar | C003@unknown.com | +91-9765432109 | Delhi | 2023-03-10 |


products
| product_id | product_name | category | price | stock_quantity |
|-----------|--------------|----------|-------|----------------|
| P001 | Samsung Galaxy S21 | Electronics | 45999.00 | 150 |
| P004 | Levi’s Jeans | Fashion | 2999.00 | 120 |
| P009 | Basmati Rice 5kg | Groceries | 650.00 | 300 |


orders
| order_id | customer_id | order_date | total_amount | status |
|---------|-------------|------------|--------------|--------|
| T001 | C001 | 2024-01-15 | 45999.00 | Completed |
| T002 | C002 | 2024-01-16 | 5998.00 | Completed |
| T005 | C005 | 2024-01-20 | 1950.00 | Completed |


order_items 
| order_item_id | order_id | product_id | quantity | unit_price | subtotal |
|--------------|----------|------------|----------|------------|----------|
| 1 | T001 | P001 | 1 | 45999.00 | 45999.00 |
| 2 | T002 | P004 | 2 | 2999.00 | 5998.00 |
| 3 | T005 | P009 | 3 | 650.00 | 1950.00 |
