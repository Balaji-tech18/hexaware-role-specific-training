USE supply_chain_monitoring;

-- CREATE: add a new supplier order.
INSERT INTO orders
(order_id, supplier_id, product_name, order_date, expected_delivery_date,
 actual_delivery_date, quantity, order_status)
VALUES
(2007, 202, 'Shipping Tape', '2026-10-10', '2026-10-16', NULL, 300, 'Placed');

-- READ: list orders with supplier names.
SELECT o.order_id, s.supplier_name, o.product_name, o.quantity,
       o.order_status, o.expected_delivery_date, o.actual_delivery_date
FROM orders o
JOIN suppliers s ON s.supplier_id = o.supplier_id
ORDER BY o.order_id;

-- UPDATE: update inventory after a stock count.
UPDATE inventory
SET quantity_on_hand = 35
WHERE inventory_id = 303;

-- DELETE 
DELETE FROM orders WHERE order_id = 2007;

DROP PROCEDURE IF EXISTS CreateLowStockReorderRequests;
DELIMITER //
CREATE PROCEDURE CreateLowStockReorderRequests()
BEGIN
    INSERT INTO reorder_requests (inventory_id, requested_quantity, request_status)
    SELECT i.inventory_id, i.reorder_quantity, 'Open'
    FROM inventory i
    WHERE i.quantity_on_hand < i.reorder_level
      AND NOT EXISTS (
        SELECT 1
        FROM reorder_requests r
        WHERE r.inventory_id = i.inventory_id
          AND r.request_status IN ('Open', 'Ordered')
      );
END //
DELIMITER ;

-- Procedure call to Create requests for items below their reorder level.
CALL CreateLowStockReorderRequests();

-- Review low-stock items and generated requests.
SELECT inventory_id, sku, product_name, quantity_on_hand, reorder_level
FROM inventory
WHERE quantity_on_hand < reorder_level;

SELECT r.request_id, i.sku, i.product_name, r.requested_quantity,
       r.request_status, r.created_at
FROM reorder_requests r
JOIN inventory i ON i.inventory_id = r.inventory_id
ORDER BY r.request_id;

-- checks:
SELECT COUNT(*) AS supplier_count FROM suppliers;
SELECT COUNT(*) AS order_count FROM orders;
SELECT COUNT(*) AS inventory_item_count FROM inventory;
