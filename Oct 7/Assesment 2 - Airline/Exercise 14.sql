SELECT 
    p.passenger_id,
    p.passenger_name,
    SUM(b.seats * f.ticket_price) AS confirmed_booking_value
FROM passengers p
INNER JOIN bookings b
    ON p.passenger_id = b.passenger_id
INNER JOIN flights f
    ON b.flight_id = f.flight_id
WHERE b.status = 'Confirmed'
GROUP BY 
    p.passenger_id,
    p.passenger_name
HAVING SUM(b.seats * f.ticket_price) > 10000;