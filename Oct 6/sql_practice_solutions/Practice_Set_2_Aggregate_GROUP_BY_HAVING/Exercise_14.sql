SELECT city, SUM(order_amount) AS total_revenue 
FROM food_orders 
GROUP BY city 
ORDER BY total_revenue DESC;
