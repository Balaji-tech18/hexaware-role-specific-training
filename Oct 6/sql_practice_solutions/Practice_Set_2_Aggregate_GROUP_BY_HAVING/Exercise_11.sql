SELECT restaurant 
FROM food_orders 
GROUP BY restaurant 
HAVING SUM(order_amount) > 2000;
