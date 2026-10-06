SELECT restaurant, SUM(order_amount) AS total_revenue 
FROM food_orders 
GROUP BY restaurant 
ORDER BY total_revenue DESC 
LIMIT 1;
