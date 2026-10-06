SELECT 
    a.appointment_id,
    a.patient_id,
    a.doctor_id,
    a.appointment_date,
    a.status
FROM appointments a
LEFT JOIN patients p
    ON a.patient_id = p.patient_id
WHERE p.patient_id IS NULL;