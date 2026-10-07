SELECT 
    customer_id,
    TRIM(customer_name) AS customer_name,
    city,
    REGEXP_REPLACE(mobile, '[^0-9]', '') AS mobile,
    NULLIF(LOWER(TRIM(email)), '') AS email
FROM
    customers;