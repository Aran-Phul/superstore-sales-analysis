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