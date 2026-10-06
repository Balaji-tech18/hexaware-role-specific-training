SELECT 
    a.appointment_id,
    p.patient_name,
    a.appointment_date,
    a.status
FROM appointments a
INNER JOIN patients p
    ON a.patient_id = p.patient_id
WHERE p.city = 'Hyderabad';