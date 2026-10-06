SELECT hotel_city, room_type, SUM(amount) AS total_revenue 
FROM hotel_bookings 
GROUP BY hotel_city, room_type WITH ROLLUP;
