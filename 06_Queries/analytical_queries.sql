-- analytical_queries.sql
USE inventory_sales_db;

-- 1. Top Selling Products (quantity)
SELECT 
    p.product_id,
    p.product_name,
    SUM(si.quantity) AS total_sold
FROM sale_items si
JOIN products p ON p.product_id = si.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_sold DESC
LIMIT 10;

-- 2. Monthly Sales Summary (revenue)
SELECT 
    DATE_FORMAT(s.sale_date, '%Y-%m') AS sales_month,
    SUM(si.line_total) AS monthly_revenue
FROM sales s
JOIN sale_items si ON si.sale_id = s.sale_id
GROUP BY sales_month
ORDER BY sales_month;

-- 3. Low Stock Alert
SELECT product_id, product_name, stock
FROM products
WHERE stock < 20
ORDER BY stock ASC;

-- 4. Product-wise Revenue
SELECT 
    p.product_name,
    SUM(si.line_total) AS revenue
FROM sale_items si
JOIN products p ON p.product_id = si.product_id
GROUP BY p.product_name
ORDER BY revenue DESC;

-- 5. Customer Purchase Frequency
SELECT 
    COALESCE(c.customer_name, 'Walk-in') AS customer_name,
    COUNT(DISTINCT s.sale_id) AS visits,
    SUM(si.line_total) AS total_spent
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
LEFT JOIN sale_items si ON si.sale_id = s.sale_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spent DESC;
