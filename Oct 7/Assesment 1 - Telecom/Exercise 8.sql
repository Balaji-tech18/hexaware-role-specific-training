SELECT 
    COUNT(*) AS total_payments,
    SUM(amount) AS total_amount_collected
FROM
    payments;