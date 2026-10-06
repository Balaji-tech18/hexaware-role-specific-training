SELECT restaurant, COUNT(order_id) AS total_orders 
FROM food_orders 
GROUP BY restaurant;
