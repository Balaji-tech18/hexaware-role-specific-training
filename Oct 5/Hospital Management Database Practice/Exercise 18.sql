SELECT 
    a.appointment_id,
    p.patient_name,
    d.doctor_name,
    d.consultation_fee,
    a.appointment_date,
    a.status
FROM appointments a
INNER JOIN patients p
    ON a.patient_id = p.patient_id
INNER JOIN doctors d
    ON a.doctor_id = d.doctor_id
WHERE d.consultation_fee > 900;