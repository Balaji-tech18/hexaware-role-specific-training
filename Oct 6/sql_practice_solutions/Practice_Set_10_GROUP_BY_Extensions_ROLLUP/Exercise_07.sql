SELECT 
    COALESCE(hotel_city, 'Grand Total') AS hotel_city,
    COALESCE(room_type, 'City Subtotal') AS room_type,
    SUM(amount) AS total_revenue
FROM hotel_bookings
GROUP BY hotel_city, room_type WITH ROLLUP;
