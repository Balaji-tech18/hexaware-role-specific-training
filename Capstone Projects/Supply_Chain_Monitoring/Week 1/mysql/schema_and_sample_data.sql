CREATE DATABASE IF NOT EXISTS supply_chain_monitoring;
USE supply_chain_monitoring;

DROP TABLE IF EXISTS reorder_requests;
DROP TABLE IF EXISTS inventory;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS suppliers;

CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(120) NOT NULL,
    contact_email VARCHAR(150) NOT NULL UNIQUE,
    city VARCHAR(80) NOT NULL,
    lead_time_days INT NOT NULL CHECK (lead_time_days >= 0)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    supplier_id INT NOT NULL,
    product_name VARCHAR(120) NOT NULL,
    order_date DATE NOT NULL,
    expected_delivery_date DATE NOT NULL,
    actual_delivery_date DATE NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    order_status ENUM('Placed','In Transit','Delivered','Delayed','Cancelled') NOT NULL,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

CREATE TABLE inventory (
    inventory_id INT PRIMARY KEY,
    supplier_id INT NOT NULL,
    sku VARCHAR(40) NOT NULL UNIQUE,
    product_name VARCHAR(120) NOT NULL,
    quantity_on_hand INT NOT NULL CHECK (quantity_on_hand >= 0),
    reorder_level INT NOT NULL CHECK (reorder_level >= 0),
    reorder_quantity INT NOT NULL CHECK (reorder_quantity > 0),
    warehouse_location VARCHAR(80) NOT NULL,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

CREATE TABLE reorder_requests (
    request_id INT AUTO_INCREMENT PRIMARY KEY,
    inventory_id INT NOT NULL,
    requested_quantity INT NOT NULL,
    request_status ENUM('Open','Ordered','Received','Cancelled') NOT NULL DEFAULT 'Open',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (inventory_id) REFERENCES inventory(inventory_id)
);

INSERT INTO suppliers VALUES
(201, 'Southern Components Ltd', 'orders@southerncomponents.example', 'Chennai', 4),
(202, 'Metro Packaging Co', 'supply@metropackaging.example', 'Mumbai', 6),
(203, 'Greenline Electronics', 'sales@greenline.example', 'Bengaluru', 3),
(204, 'Reliable Plastics', 'contact@reliableplastics.example', 'Hyderabad', 5);

INSERT INTO orders VALUES
(2001, 201, 'USB-C Cable', '2026-09-20', '2026-09-25', '2026-09-24', 500, 'Delivered'),
(2002, 202, 'Shipping Box - Medium', '2026-09-22', '2026-09-28', NULL, 1000, 'Delayed'),
(2003, 203, 'Wireless Mouse', '2026-10-01', '2026-10-07', NULL, 250, 'In Transit'),
(2004, 204, 'Plastic Storage Bin', '2026-10-02', '2026-10-09', '2026-10-11', 150, 'Delivered'),
(2005, 201, 'USB-C Cable', '2026-10-05', '2026-10-12', NULL, 300, 'Placed'),
(2006, 203, 'Keyboard', '2026-10-06', '2026-10-10', NULL, 100, 'Delayed');

INSERT INTO inventory VALUES
(301, 201, 'SKU-CBL-01', 'USB-C Cable', 40, 100, 300, 'Chennai-A1'),
(302, 202, 'SKU-BOX-02', 'Shipping Box - Medium', 450, 200, 800, 'Mumbai-B2'),
(303, 203, 'SKU-MSE-03', 'Wireless Mouse', 25, 50, 150, 'Bengaluru-C1'),
(304, 204, 'SKU-BIN-04', 'Plastic Storage Bin', 180, 60, 200, 'Hyderabad-D3'),
(305, 203, 'SKU-KBD-05', 'Keyboard', 10, 40, 100, 'Bengaluru-C2');

CREATE INDEX idx_orders_supplier_status ON orders(supplier_id, order_status);
CREATE INDEX idx_orders_expected_delivery ON orders(expected_delivery_date);
CREATE INDEX idx_inventory_stock_level ON inventory(quantity_on_hand, reorder_level);
