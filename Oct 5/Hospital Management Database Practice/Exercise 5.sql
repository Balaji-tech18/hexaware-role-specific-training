SELECT 
    p.patient_id,
    p.patient_name
FROM patients p
LEFT JOIN appointments a
    ON p.patient_id = a.patient_id
WHERE a.appointment_id IS NULL;