SELECT 
    d.doctor_id,
    d.doctor_name,
    SUM(d.consultation_fee) AS total_consultation_value
FROM doctors d
INNER JOIN appointments a
    ON d.doctor_id = a.doctor_id
WHERE a.status = 'Completed'
GROUP BY 
    d.doctor_id,
    d.doctor_name;