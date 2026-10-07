SELECT 
    customer_id, SUM(amount) AS total_payment_amount
FROM
    payments
GROUP BY customer_id
HAVING SUM(amount) > 2000;