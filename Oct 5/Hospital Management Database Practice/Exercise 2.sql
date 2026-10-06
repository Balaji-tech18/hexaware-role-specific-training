SELECT 
    d.doctor_name,
    d.specialization
FROM appointments a
INNER JOIN doctors d
    ON a.doctor_id = d.doctor_id
WHERE a.status = 'Completed';