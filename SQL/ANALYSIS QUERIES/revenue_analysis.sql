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