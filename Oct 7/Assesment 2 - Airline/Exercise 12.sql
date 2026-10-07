SELECT 
    b.booking_id,
    b.passenger_id,
    b.flight_id,
    b.booking_date,
    b.seats,
    b.status
FROM bookings b
LEFT JOIN passengers p
    ON b.passenger_id = p.passenger_id
LEFT JOIN flights f
    ON b.flight_id = f.flight_id
WHERE p.passenger_id IS NULL
   OR f.flight_id IS NULL;