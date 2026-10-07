SELECT 
    c.customer_id,
    c.customer_name,
    p.plan_name,
    p.monthly_charge,
    s.status
FROM
    customers c
        LEFT JOIN
    subscriptions s ON c.customer_id = s.customer_id
        LEFT JOIN
    plans p ON s.plan_id = p.plan_id;