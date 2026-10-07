SELECT 
    customer_id,
    customer_name,
    mobile
FROM customers
WHERE mobile REGEXP '[A-Za-z]';