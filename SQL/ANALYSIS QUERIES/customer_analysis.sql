-- Customer Rankings--

SELECT customers.customer_id,
customers.Name,
SUM(order_items.sales) as revenue,
RANK () OVER (ORDER BY SUM(order_items.sales) DESC) AS revenue_rank
FROM order_items
JOIN orders ON orders.order_id = order_items.order_id
JOIN customers ON customers.customer_id = orders.Customer_ID
GROUP BY customers.customer_id
ORDER BY revenue DESC;

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