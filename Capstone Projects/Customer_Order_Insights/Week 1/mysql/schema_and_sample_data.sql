CREATE DATABASE IF NOT EXISTS customer_order_insights;
USE customer_order_insights;

DROP TABLE IF EXISTS delivery_status;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    city VARCHAR(80) NOT NULL,
    region VARCHAR(80) NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    order_amount DECIMAL(10,2) NOT NULL CHECK (order_amount >= 0),
    product_name VARCHAR(120) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE delivery_status (
    delivery_id INT PRIMARY KEY,
    order_id INT NOT NULL UNIQUE,
    status ENUM('Placed','Packed','In Transit','Delivered','Cancelled') NOT NULL,
    expected_delivery_date DATE NOT NULL,
    actual_delivery_date DATE NULL,
    issue_type VARCHAR(100) NULL,
    last_updated DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

INSERT INTO customers (customer_id, customer_name, email, city, region) VALUES
(1, 'Arun Kumar', 'arun@example.com', 'Chennai', 'South'),
(2, 'Meena Ravi', 'meena@example.com', 'Coimbatore', 'South'),
(3, 'Rahul Sharma', 'rahul@example.com', 'Hyderabad', 'South'),
(4, 'Priya Nair', 'priya@example.com', 'Bengaluru', 'South'),
(5, 'Karan Shah', 'karan@example.com', 'Mumbai', 'West');

INSERT INTO orders (order_id, customer_id, order_date, order_amount, product_name) VALUES
(1001, 1, '2026-09-20', 2499.00, 'Wireless Headphones'),
(1002, 1, '2026-10-01', 1299.00, 'Keyboard'),
(1003, 2, '2026-09-22', 799.00, 'Water Bottle'),
(1004, 3, '2026-10-02', 5499.00, 'Monitor'),
(1005, 4, '2026-09-25', 1899.00, 'Backpack'),
(1006, 5, '2026-10-03', 999.00, 'Desk Lamp');

INSERT INTO delivery_status
(delivery_id, order_id, status, expected_delivery_date, actual_delivery_date, issue_type) VALUES
(501, 1001, 'Delivered', '2026-09-25', '2026-09-28', 'Courier delay'),
(502, 1002, 'In Transit', '2026-10-08', NULL, 'Weather delay'),
(503, 1003, 'Delivered', '2026-09-28', '2026-09-27', NULL),
(504, 1004, 'In Transit', '2026-10-07', NULL, 'Sorting facility backlog'),
(505, 1005, 'Delivered', '2026-09-30', '2026-09-30', NULL),
(506, 1006, 'Packed', '2026-10-15', NULL, NULL);

CREATE INDEX idx_orders_customer_id ON orders(customer_id);
CREATE INDEX idx_delivery_status_status_expected ON delivery_status(status, expected_delivery_date);
