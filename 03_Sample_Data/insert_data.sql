-- insert_data.sql
USE inventory_sales_db;

-- products
INSERT INTO products (product_name, category, unit_price, stock) VALUES
('Milk Packet 1L', 'Grocery', 25.00, 150),
('Bread Loaf', 'Grocery', 40.00, 80),
('Sugar 1kg', 'Grocery', 50.00, 120),
('Rice 25kg', 'Grocery', 1200.00, 50),
('Chocolate Bar', 'Snacks', 20.00, 200),
('Washing Powder 1kg', 'Household', 180.00, 60),
('Toothpaste 100g', 'Personal Care', 90.00, 100);

-- suppliers
INSERT INTO suppliers (supplier_name, contact_number, email, address) VALUES
('Fresh Farms Ltd', '9876543210', 'contact@freshfarms.example', 'Hyderabad'),
('Daily Needs Supply', '9000456789', 'support@dailyneeds.example', 'Secunderabad'),
('Global Wholesale', '9123456780', 'sales@globalwholesale.example', 'Mumbai');

-- customers
INSERT INTO customers (customer_name, phone, city) VALUES
('Ramesh', '9876501234', 'Hyderabad'),
('Suresh', '9876548888', 'Karimnagar'),
('Priya', '9988776655', 'Warangal'),
('Anjali', '9900012345', 'Hyderabad');

-- purchase_orders (stock in)
INSERT INTO purchase_orders (supplier_id, product_id, quantity, unit_cost, purchase_date) VALUES
(1, 1, 100, 20.00, '2024-01-10'),
(2, 3, 150, 45.00, '2024-01-12'),
(1, 4, 20, 1000.00, '2024-01-15'),
(3, 6, 50, 150.00, '2024-02-01');

-- sales and sale_items
INSERT INTO sales (sale_date, customer_id, total_amount) VALUES
('2024-01-20', 1, 200.00),
('2024-01-21', 2, 1600.00),
('2024-02-05', 3, 350.00);

INSERT INTO sale_items (sale_id, product_id, quantity, price_per_unit, line_total) VALUES
(1, 1, 4, 25.00, 100.00),
(1, 5, 5, 20.00, 100.00),
(2, 4, 1, 1200.00, 1200.00),
(2, 3, 8, 50.00, 400.00),
(3, 2, 2, 40.00, 80.00),
(3, 6, 1, 180.00, 180.00);
