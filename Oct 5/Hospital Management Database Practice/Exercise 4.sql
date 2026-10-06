SELECT 
    p.patient_id,
    p.patient_name,
    a.appointment_id,
    a.appointment_date,
    a.status
FROM patients p
LEFT JOIN appointments a
    ON p.patient_id = a.patient_id;