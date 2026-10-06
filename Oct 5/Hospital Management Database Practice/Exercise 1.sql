SELECT 
    a.appointment_id,
    p.patient_name,
    d.doctor_name,
    a.appointment_date
FROM appointments a
LEFT JOIN patients p
    ON a.patient_id = p.patient_id
LEFT JOIN doctors d
    ON a.doctor_id = d.doctor_id;