-- sales_report_procedure.sql
USE inventory_sales_db;
DELIMITER $$
DROP PROCEDURE IF EXISTS daily_sales_report $$
CREATE PROCEDURE daily_sales_report(IN report_date DATE)
BEGIN
    SELECT 
        s.sale_id,
        s.sale_date,
        COALESCE(c.customer_name, 'Walk-in') AS customer_name,
        SUM(si.line_total) AS total_bill
    FROM sales s
    JOIN sale_items si ON s.sale_id = si.sale_id
    LEFT JOIN customers c ON c.customer_id = s.customer_id
    WHERE s.sale_date = report_date
    GROUP BY s.sale_id, s.sale_date, c.customer_name;
END $$
DELIMITER ;
