SELECT 
    p.patient_name,
    d.doctor_name,
    d.specialization,
    d.consultation_fee,
    a.status AS appointment_status
FROM appointments a
INNER JOIN patients p
    ON a.patient_id = p.patient_id
INNER JOIN doctors d
    ON a.doctor_id = d.doctor_id;