SELECT food_type, AVG(order_amount) AS avg_order_value 
FROM food_orders 
GROUP BY food_type;
