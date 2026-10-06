SELECT 
    d.doctor_id,
    d.doctor_name,
    a.appointment_id,
    a.appointment_date,
    a.status
FROM doctors d
LEFT JOIN appointments a
    ON d.doctor_id = a.doctor_id;