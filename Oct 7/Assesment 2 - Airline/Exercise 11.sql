SELECT 
    p.passenger_id,
    p.passenger_name,
    p.city,
    b.booking_id,
    f.airline,
    f.source_city,
    f.destination_city,
    b.status
FROM passengers p
LEFT JOIN bookings b
    ON p.passenger_id = b.passenger_id
LEFT JOIN flights f
    ON b.flight_id = f.flight_id;