SELECT 
    c.customer_name, p.plan_name, p.monthly_charge, s.status
FROM
    subscriptions s
        INNER JOIN
    customers c ON s.customer_id = c.customer_id
        INNER JOIN
    plans p ON s.plan_id = p.plan_id;