SELECT DISTINCT
    p.patient_id,
    p.patient_name
FROM patients p
INNER JOIN appointments a
    ON p.patient_id = a.patient_id
INNER JOIN doctors d
    ON a.doctor_id = d.doctor_id
WHERE d.specialization = 'Cardiology';