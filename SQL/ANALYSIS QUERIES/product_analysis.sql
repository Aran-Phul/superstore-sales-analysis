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