SELECT 
    f.flight_id,
    f.airline,
    COALESCE(SUM(b.seats), 0) AS total_seats_booked
FROM flights f
LEFT JOIN bookings b
    ON f.flight_id = b.flight_id
GROUP BY 
    f.flight_id,
    f.airline;