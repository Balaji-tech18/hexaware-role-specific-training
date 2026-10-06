SELECT room_type, SUM(amount) AS total_revenue 
FROM hotel_bookings 
GROUP BY room_type;
