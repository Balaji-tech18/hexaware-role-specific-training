SELECT 
    p.passenger_name,
    f.airline,
    f.source_city,
    f.destination_city,
    b.status
FROM bookings b
INNER JOIN passengers p
    ON b.passenger_id = p.passenger_id
INNER JOIN flights f
    ON b.flight_id = f.flight_id;