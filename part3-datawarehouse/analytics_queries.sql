-- Note: The numeric values may differ from the sample output as they are derived from the generated sales data. However, the query structure and aggregation logic remain consistent with the expected result


-- Query 1: Monthly Sales Drill-Down Analysis
-- Shows Year → Quarter → Month level sales for 2024
"Business Scenario: The CEO wants to see sales performance broken down by time periods. Start with yearly total, then quarterly, then monthly sales for 2024.

Requirements:
Show: year, quarter, month, total_sales, total_quantity
Group by year, quarter, month
Order chronologically
This demonstrates drill-down (Year → Quarter → Month)"

SELECT
    d.year,
    d.quarter,
    d.month_name,
    SUM(f.total_amount) AS total_sales,
    SUM(f.quantity_sold) AS total_quantity
FROM fact_sales f
JOIN dim_date d
    ON f.date_key = d.date_key
WHERE d.year = 2024
GROUP BY d.year, d.quarter, d.month, d.month_name
ORDER BY d.year, d.quarter, d.month;


--Query 2: Product Performance Analysis
-- Includes revenue percentage contribution

"Business Scenario: The product manager needs to identify top-performing products. Show the top 10 products by revenue, along with their category, total units sold, and revenue contribution percentage.

Requirements:

Join fact_sales with dim_product
Calculate: total revenue, total quantity per product
Calculate: percentage of total revenue (each product's revenue / overall revenue × 100)
Order by revenue descending
Limit to top 10"

SELECT
    p.product_name,
    p.category,
    SUM(f.quantity_sold) AS units_sold,
    SUM(f.total_amount) AS revenue,
    ROUND(
        SUM(f.total_amount) * 100.0 /
        SUM(SUM(f.total_amount)) OVER (),
        2
    ) AS revenue_percentage
FROM fact_sales f
JOIN dim_product p
    ON f.product_key = p.product_key
GROUP BY p.product_name, p.category
ORDER BY revenue DESC
LIMIT 10;

--Query 3: Customer Segmentation Analysis 
-- Segments customers into High, Medium, and Low value groups

"Business Scenario: Marketing wants to target high-value customers. Segment customers into 'High Value' (>₹50,000 spent), 'Medium Value' (₹20,000-₹50,000), and 'Low Value' (<₹20,000). Show count of customers and total revenue in each segment.

Requirements:

Calculate total spending per customer
Use CASE statement to create segments
Group by segment
Show: segment, customer_count, total_revenue, avg_revenue_per_customer"

WITH customer_spending AS (
    SELECT
        c.customer_key,
        SUM(f.total_amount) AS total_spent
    FROM fact_sales f
    JOIN dim_customer c
        ON f.customer_key = c.customer_key
    GROUP BY c.customer_key
)
SELECT
    CASE
        WHEN total_spent > 50000 THEN 'High Value'
        WHEN total_spent BETWEEN 20000 AND 50000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment,
    COUNT(*) AS customer_count,
    SUM(total_spent) AS total_revenue,
    ROUND(AVG(total_spent), 2) AS avg_revenue_per_customer
FROM customer_spending
GROUP BY customer_segment
ORDER BY total_revenue DESC;
