SELECT 
    d.specialization,
    SUM(d.consultation_fee) AS total_consultation_value
FROM doctors d
INNER JOIN appointments a
    ON d.doctor_id = a.doctor_id
WHERE a.status = 'Completed'
GROUP BY d.specialization
ORDER BY total_consultation_value DESC
LIMIT 1;