

INSERT INTO dim_date
(date_key, full_date, day_of_week, day_of_month, month, month_name, quarter, year, is_weekend)
VALUES
('2024-01-01','2024-01-01','Monday',1,1,'January','Q1',2024,0),
('2024-01-02','2024-01-02','Tuesday',2,1,'January','Q1',2024,0),
('2024-01-03','2024-01-03','Wednesday',3,1,'January','Q1',2024,0),
('2024-01-04','2024-01-04','Thursday',4,1,'January','Q1',2024,0),
('2024-01-05','2024-01-05','Friday',5,1,'January','Q1',2024,0),
('2024-01-06','2024-01-06','Saturday',6,1,'January','Q1',2024,1),
('2024-01-07','2024-01-07','Sunday',7,1,'January','Q1',2024,1),
('2024-01-08','2024-01-08','Monday',8,1,'January','Q1',2024,0),
('2024-01-09','2024-01-09','Tuesday',9,1,'January','Q1',2024,0),
('2024-01-10','2024-01-10','Wednesday',10,1,'January','Q1',2024,0),
('2024-01-11','2024-01-11','Thursday',11,1,'January','Q1',2024,0),
('2024-01-12','2024-01-12','Friday',12,1,'January','Q1',2024,0),
('2024-01-13','2024-01-13','Saturday',13,1,'January','Q1',2024,1),
('2024-01-14','2024-01-14','Sunday',14,1,'January','Q1',2024,1),
('2024-01-15','2024-01-15','Monday',15,1,'January','Q1',2024,0),
('2024-01-16','2024-01-16','Tuesday',16,1,'January','Q1',2024,0),
('2024-01-17','2024-01-17','Wednesday',17,1,'January','Q1',2024,0),
('2024-01-18','2024-01-18','Thursday',18,1,'January','Q1',2024,0),
('2024-01-19','2024-01-19','Friday',19,1,'January','Q1',2024,0),
('2024-01-20','2024-01-20','Saturday',20,1,'January','Q1',2024,1),
('2024-01-21','2024-01-21','Sunday',21,1,'January','Q1',2024,1),
('2024-02-01','2024-02-01','Thursday',1,2,'February','Q1',2024,0),
('2024-02-02','2024-02-02','Friday',2,2,'February','Q1',2024,0),
('2024-02-03','2024-02-03','Saturday',3,2,'February','Q1',2024,1),
('2024-02-04','2024-02-04','Sunday',4,2,'February','Q1',2024,1),
('2024-02-10','2024-02-10','Saturday',10,2,'February','Q1',2024,1),
('2024-02-11','2024-02-11','Sunday',11,2,'February','Q1',2024,1),
('2024-02-17','2024-02-17','Saturday',17,2,'February','Q1',2024,1),
('2024-02-18','2024-02-18','Sunday',18,2,'February','Q1',2024,1);

INSERT INTO dim_date
(date_key, full_date, day_of_week, day_of_month, month, month_name, quarter, year, is_weekend)
VALUES
('2024-02-16','2024-02-16','Friday',16,2,'February','Q1',2024,0);

INSERT INTO dim_product (product_id, product_name, category, subcategory, unit_price) VALUES
('P001','Samsung Galaxy S21','Electronics','Smartphone',45999),
('P002','Apple MacBook Air','Electronics','Laptop',89999),
('P003','Sony Headphones','Electronics','Audio',2999),
('P004','Dell Monitor','Electronics','Monitor',15999),
('P005','OnePlus Nord','Electronics','Smartphone',27999),
('P006','Levis Jeans','Fashion','Clothing',2999),
('P007','Nike Sneakers','Fashion','Footwear',4999),
('P008','Adidas T-Shirt','Fashion','Clothing',1499),
('P009','Puma Shoes','Fashion','Footwear',3999),
('P010','H&M Shirt','Fashion','Clothing',1999),
('P011','Basmati Rice','Groceries','Grains',650),
('P012','Sunflower Oil','Groceries','Oil',1200),
('P013','Toothpaste','Groceries','Personal Care',120),
('P014','Coffee Powder','Groceries','Beverages',450),
('P015','Sugar 1kg','Groceries','Essentials',100);


INSERT INTO dim_customer (customer_id, customer_name, city, customer_segment)
VALUES
('C001','Rahul Sharma','Bangalore','Regular'),
('C002','Priya Patel','Mumbai','Regular'),
('C003','Amit Kumar','Delhi','Regular'),
('C004','Sneha Reddy','Hyderabad','Regular'),
('C005','Vikram Singh','Chennai','Regular'),
('C006','Anjali Mehta','Bangalore','Regular'),
('C007','Ravi Verma','Pune','Regular'),
('C008','Pooja Iyer','Bangalore','Regular'),
('C009','Karthik Nair','Kochi','Regular'),
('C010','Deepa Gupta','Delhi','Regular'),
('C011','Arjun Rao','Hyderabad','Premium'),
('C012','Lakshmi Krishnan','Chennai','Premium');

SELECT customer_key, customer_name
FROM dim_customer
ORDER BY customer_key;


INSERT INTO fact_sales
(date_key, product_key, customer_key, quantity_sold, unit_price, total_amount)
VALUES
('2024-01-01', 1, 1, 1, 45999.00, 45999.00),
('2024-01-02', 2, 2, 2, 2999.00, 5998.00),
('2024-01-03', 3, 3, 1, 12999.00, 12999.00),
('2024-01-04', 4, 4, 3, 650.00, 1950.00),
('2024-01-05', 5, 5, 2, 1499.00, 2998.00),
('2024-01-06', 6, 6, 5, 899.00, 4495.00),
('2024-01-06', 7, 7, 4, 3499.00, 13996.00),
('2024-01-07', 8, 8, 6, 1299.00, 7794.00),
('2024-01-07', 9, 9, 3, 4599.00, 13797.00),
('2024-01-08', 10, 10, 1, 69999.00, 69999.00),
('2024-01-09', 11, 11, 2, 1899.00, 3798.00),
('2024-01-10', 12, 12, 1, 5499.00, 5499.00),
('2024-01-11', 13, 1, 2, 120.00, 240.00),
('2024-01-12', 14, 2, 1, 32999.00, 32999.00),
('2024-01-13', 15, 3, 4, 2299.00, 9196.00),
('2024-01-13', 1, 4, 3, 45999.00, 137997.00),
('2024-01-14', 2, 5, 5, 2999.00, 14995.00),
('2024-01-14', 3, 6, 4, 12999.00, 51996.00),
('2024-01-15', 4, 7, 2, 650.00, 1300.00),
('2024-01-16', 5, 8, 1, 1499.00, 1499.00),
('2024-01-17', 6, 9, 3, 899.00, 2697.00),
('2024-01-18', 7, 10, 1, 3499.00, 3499.00),
('2024-01-19', 8, 11, 2, 1299.00, 2598.00),
('2024-01-20', 9, 12, 6, 4599.00, 27594.00),
('2024-01-20', 10, 1, 2, 69999.00, 139998.00),
('2024-01-21', 11, 2, 5, 1899.00, 9495.00),
('2024-01-21', 12, 3, 4, 5499.00, 21996.00),
('2024-02-01', 13, 4, 1, 120.00, 120.00),
('2024-02-02', 14, 5, 2, 32999.00, 65998.00),
('2024-02-03', 15, 6, 6, 2299.00, 13794.00),
('2024-02-03', 1, 7, 4, 45999.00, 183996.00),
('2024-02-04', 2, 8, 5, 2999.00, 14995.00),
('2024-02-10', 3, 9, 6, 12999.00, 77994.00),
('2024-02-11', 4, 10, 4, 650.00, 2600.00),
('2024-02-17', 5, 11, 7, 1499.00, 10493.00),
('2024-02-18', 6, 12, 6, 899.00, 5394.00);

INSERT INTO fact_sales
(date_key, product_key, customer_key, quantity_sold, unit_price, total_amount)
VALUES
('2024-02-16', 7, 3, 2, 4999.00, 9998.00),
('2024-02-16', 10, 6, 3, 1999.00, 5997.00),
('2024-02-17', 12, 9, 1, 1200.00, 1200.00),
('2024-02-18', 15, 12, 4, 100.00, 400.00);

SELECT COUNT(*) FROM fact_sales;

SELECT COUNT(*), MAX(product_key) FROM dim_product;
SELECT COUNT(*), MAX(customer_key) FROM dim_customer;
SELECT COUNT(*), MAX(sale_key) FROM fact_sales;
SELECT COUNT(*), MAX(date_key) FROM dim_date;
