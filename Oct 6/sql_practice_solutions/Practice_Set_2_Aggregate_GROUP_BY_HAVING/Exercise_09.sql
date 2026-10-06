SELECT delivery_partner, SUM(order_amount) AS total_revenue 
FROM food_orders 
GROUP BY delivery_partner;
