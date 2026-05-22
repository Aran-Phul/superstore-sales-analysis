
--TOTAL REVENUE PER MONTH--
Select ROUND(SUM(order_items.sales),2) AS REVENUE,
DATE_TRUNC('month',orders.order_date) AS month 
from order_items 
JOIN orders ON order_items.order_id = orders.order_id
group by month
order by month;


--Revenue per region--
SELECT orders.region,
ROUND(SUM(order_items.sales),2) AS REVENUE
from order_items
JOIN orders ON order_items.order_id = orders.order_id
GROUP BY orders.region;

--TOP 10 highest revenue products--
SELECT product.product_name,
ROUND(SUM(order_items.sales),2) AS REVENUE
from order_items
JOIN product ON product.product_id = order_items.product_id
GROUP BY product.product_name
ORDER BY REVENUE DESC
LIMIT 10;

--TOP 10 lowest revenue products--
SELECT product.product_name,
ROUND(SUM(order_items.sales),2) AS REVENUE
from order_items
JOIN product ON product.product_id = order_items.product_id
GROUP BY product.product_name
ORDER BY REVENUE ASC
LIMIT 10;

--Revenue by category--

SELECT
product.category,
ROUND(SUM(order_items.sales),2) AS REVENUE
from order_items
JOIN product ON product.product_id = order_items.product_id
GROUP BY product.category
ORDER BY REVENUE DESC;


--Customer Analysis--

-- Top 10 Customers --

SELECT
customers.customer_id,
customers.Name,
ROUND(SUM(order_items.sales),2) AS LIFETIME_REVENUE
from order_items
JOIN orders ON orders.order_id = order_items.order_id
JOIN customers ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_id
ORDER BY LIFETIME_REVENUE DESC
LIMIT 10;

--TOP customers by segment--

SELECT
customers.segment,
ROUND(SUM(order_items.sales),2) AS LIFETIME_REVENUE
from order_items
JOIN orders ON orders.order_id = order_items.order_id
JOIN customers ON customers.customer_id = orders.customer_id
GROUP BY customers.segment
ORDER BY LIFETIME_REVENUE DESC;

-- Average order value -- 

SELECT
ROUND(SUM(order_items.sales) / COUNT(DISTINCT(order_items.order_id)),2) AS Average
from order_items
JOIN orders ON order_items.order_id = orders.order_id;

--Shipping mode preferences --
SELECT orders.ship_mode,
ROUND(SUM(order_items.sales),2) AS SHIP_REV
from order_items
JOIN orders ON orders.order_id = order_items.order_id
GROUP BY orders.ship_mode
ORDER BY SHIP_REV DESC;

-- Shipping delay --

SELECT
ROUND(AVG(orders.ship_date - orders.order_date),2) AS ship_delay_days,
orders.ship_mode
FROM orders
GROUP BY orders.ship_mode
ORDER BY ship_delay_days ASC;