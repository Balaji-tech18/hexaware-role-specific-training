SELECT 
    d.doctor_id,
    d.doctor_name,
    COUNT(a.appointment_id) AS appointment_count
FROM doctors d
LEFT JOIN appointments a
    ON d.doctor_id = a.doctor_id
GROUP BY 
    d.doctor_id,
    d.doctor_name;