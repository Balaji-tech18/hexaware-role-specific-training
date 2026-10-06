SELECT food_type 
FROM food_orders 
GROUP BY food_type 
HAVING SUM(order_amount) > 2500;
