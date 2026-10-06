SELECT 
    AVG(d.consultation_fee) AS average_consultation_fee
FROM appointments a
INNER JOIN doctors d
    ON a.doctor_id = d.doctor_id
WHERE a.status = 'Completed';