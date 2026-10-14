USE customer_order_insights;

INSERT INTO orders (order_id, customer_id, order_date, order_amount, product_name)
VALUES (1007, 2, '2026-10-10', 1599.00, 'Bluetooth Speaker');

INSERT INTO delivery_status
(delivery_id, order_id, status, expected_delivery_date, actual_delivery_date, issue_type)
VALUES (507, 1007, 'Placed', '2026-10-17', NULL, NULL);

-- READ: view orders with customer and delivery information.
SELECT c.customer_name, o.order_id, o.product_name, o.order_amount,
       d.status, d.expected_delivery_date, d.actual_delivery_date, d.issue_type
FROM customers c
JOIN orders o ON o.customer_id = c.customer_id
JOIN delivery_status d ON d.order_id = o.order_id
ORDER BY o.order_id;

-- UPDATE: change the status of an order.
UPDATE delivery_status
SET status = 'In Transit', issue_type = 'Vehicle breakdown'
WHERE order_id = 1007;

-- DELETE 
DELETE FROM delivery_status WHERE order_id = 1007;
DELETE FROM orders WHERE order_id = 1007;

DROP PROCEDURE IF EXISTS GetDelayedDeliveriesByCustomer;
DELIMITER //
CREATE PROCEDURE GetDelayedDeliveriesByCustomer(IN p_customer_id INT)
BEGIN
    SELECT c.customer_id, c.customer_name, o.order_id, o.product_name,
           d.status, d.expected_delivery_date, d.actual_delivery_date,
           CASE
             WHEN d.actual_delivery_date IS NOT NULL
               THEN DATEDIFF(d.actual_delivery_date, d.expected_delivery_date)
             ELSE DATEDIFF(CURDATE(), d.expected_delivery_date)
           END AS delay_days,
           d.issue_type
    FROM customers c
    JOIN orders o ON o.customer_id = c.customer_id
    JOIN delivery_status d ON d.order_id = o.order_id
    WHERE c.customer_id = p_customer_id
      AND (
        (d.actual_delivery_date IS NOT NULL
         AND d.actual_delivery_date > d.expected_delivery_date)
        OR
        (d.actual_delivery_date IS NULL
         AND d.status NOT IN ('Delivered', 'Cancelled')
         AND d.expected_delivery_date < CURDATE())
      )
    ORDER BY d.expected_delivery_date;
END //
DELIMITER ;

-- procedure call:
CALL GetDelayedDeliveriesByCustomer(1);

-- for checking 
SELECT COUNT(*) AS customer_count FROM customers;
SELECT COUNT(*) AS order_count FROM orders;
SELECT COUNT(*) AS delivery_rows FROM delivery_status;
