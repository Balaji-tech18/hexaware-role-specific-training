SELECT 
    d.doctor_id,
    d.doctor_name,
    COUNT(a.appointment_id) AS completed_appointments
FROM doctors d
INNER JOIN appointments a
    ON d.doctor_id = a.doctor_id
WHERE a.status = 'Completed'
GROUP BY 
    d.doctor_id,
    d.doctor_name
ORDER BY completed_appointments DESC
LIMIT 1;