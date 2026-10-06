SELECT hotel_city, room_type, SUM(nights) AS total_nights 
FROM hotel_bookings 
GROUP BY hotel_city, room_type;
