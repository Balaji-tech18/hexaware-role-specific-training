SELECT city 
FROM food_orders 
GROUP BY city 
HAVING COUNT(order_id) > 3;
