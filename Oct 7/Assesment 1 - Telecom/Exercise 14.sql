SELECT 
    s.subscription_id,
    s.customer_id,
    s.plan_id,
    s.start_date,
    s.status
FROM
    subscriptions s
        LEFT JOIN
    customers c ON s.customer_id = c.customer_id
        LEFT JOIN
    plans p ON s.plan_id = p.plan_id
WHERE
    c.customer_id IS NULL
        OR p.plan_id IS NULL;