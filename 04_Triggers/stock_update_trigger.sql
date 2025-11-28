-- stock_update_trigger.sql
USE inventory_sales_db;
DELIMITER $$
DROP TRIGGER IF EXISTS reduce_stock_after_sale $$
CREATE TRIGGER reduce_stock_after_sale
AFTER INSERT ON sale_items
FOR EACH ROW
BEGIN
    UPDATE products
    SET stock = stock - NEW.quantity
    WHERE product_id = NEW.product_id;
END $$
DELIMITER ;
