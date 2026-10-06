SELECT 
    p.patient_id,
    p.patient_name,
    COUNT(a.appointment_id) AS appointment_count
FROM patients p
LEFT JOIN appointments a
    ON p.patient_id = a.patient_id
GROUP BY 
    p.patient_id,
    p.patient_name;