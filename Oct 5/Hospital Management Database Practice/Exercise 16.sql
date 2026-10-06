SELECT 
    p.patient_id,
    p.patient_name,
    COUNT(DISTINCT a.doctor_id) AS doctor_count
FROM patients p
INNER JOIN appointments a
    ON p.patient_id = a.patient_id
WHERE a.doctor_id IS NOT NULL
GROUP BY 
    p.patient_id,
    p.patient_name
HAVING COUNT(DISTINCT a.doctor_id) > 1;