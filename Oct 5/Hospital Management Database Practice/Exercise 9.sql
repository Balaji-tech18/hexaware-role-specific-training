SELECT 
    a.appointment_id,
    a.patient_id,
    a.doctor_id,
    a.appointment_date,
    a.status
FROM appointments a
LEFT JOIN doctors d
    ON a.doctor_id = d.doctor_id
WHERE d.doctor_id IS NULL;