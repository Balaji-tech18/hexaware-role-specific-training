SELECT 
    customer_id, AVG(amount) AS average_payment_amount
FROM
    payments
GROUP BY customer_id;