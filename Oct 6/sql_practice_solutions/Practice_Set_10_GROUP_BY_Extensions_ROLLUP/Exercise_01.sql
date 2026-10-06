SELECT hotel_city, SUM(amount) AS total_revenue 
FROM hotel_bookings 
GROUP BY hotel_city;
