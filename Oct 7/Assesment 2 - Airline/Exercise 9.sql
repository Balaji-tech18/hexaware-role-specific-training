SELECT 
    f.airline,
    SUM(b.seats * f.ticket_price) AS total_booking_value
FROM flights f
INNER JOIN bookings b
    ON f.flight_id = b.flight_id
GROUP BY f.airline;