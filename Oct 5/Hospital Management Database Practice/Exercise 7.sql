SELECT 
    d.doctor_id,
    d.doctor_name
FROM doctors d
LEFT JOIN appointments a
    ON d.doctor_id = a.doctor_id
WHERE a.appointment_id IS NULL;