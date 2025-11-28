-- sales_reports.sql
USE inventory_sales_db;

-- Total revenue
SELECT SUM(line_total) AS total_revenue FROM sale_items;

-- Daily revenue
SELECT s.sale_date, SUM(si.line_total) AS revenue
FROM sales s
JOIN sale_items si ON s.sale_id = si.sale_id
GROUP BY s.sale_date
ORDER BY s.sale_date;

-- Category-wise sales
SELECT p.category, SUM(si.line_total) AS category_sales
FROM sale_items si
JOIN products p ON p.product_id = si.product_id
GROUP BY p.category
ORDER BY category_sales DESC;
