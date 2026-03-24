create DATABASE	ecommerce;
use ecommerce;

CREATE TABLE orders(
order_id VARCHAR(50),
order_date DATE,
ship_date DATE,
ship_mode VARCHAR(50),
customer_name VARCHAR(50),
segment  VARCHAR(50),
state VARCHAR(50),
country VARCHAR(100),
market  VARCHAR(50),
region VARCHAR(50),
product_id VARCHAR(50),
category VARCHAR(50),
sub_category VARCHAR(50),
product_name VARCHAR(150),
sales FLOAT,
quantity INT,
discount FLOAT,
profit FLOAT,
shipping_cost FLOAT,
order_priority VARCHAR(20),
year INT
);

select * from cleaned_superstoreorders;

-- Calculate total revenue
select sum(sales) as total_revenue
from cleaned_superstoreorders;

-- Calculate total profit
select sum(profit) as total_profit
from cleaned_superstoreorders;

-- Analyze monthly sales trend
select date_format(order_date, '%Y-%m') as month,
sum(sales) as revenue
from cleaned_superstoreorders
group by month
order by month;

-- Identify top customers by sales
select customer_name,sum(sales) as total_spent
from cleaned_superstoreorders
group by customer_name
order by total_spent DESC
LIMIT 10;

-- Identify top-selling products
select product_name,sum(sales) as revenue
from cleaned_superstoreorders
group by product_name
order by revenue DESC
LIMIT 10;

-- Get sales by region
select region, sum(sales) as total_sales
from cleaned_superstoreorders
group by region;

 -- Analyze revenue and profit by category
select category,
 sum(sales) as revenue,
 sum(profit) as profit
from cleaned_superstoreorders
group by category;

-- Identify customers with multiple orders
select customer_name,count(order_id) as orders
from cleaned_superstoreorders
group by customer_name
having orders >1;

-- Find products generating negative profit
select product_name,sum(profit) as total_profit
from cleaned_superstoreorders
group by product_name
order by total_profit asc
LIMIT 10;

-- Check impact of discount on profit
select discount, avg(profit) as avg_profit
from cleaned_superstoreorders
group by discount
order by discount;






