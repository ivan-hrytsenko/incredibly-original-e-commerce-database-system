--  products in orders with their quantity
SELECT o.order_id, p.name, oi.quantity 
FROM orders AS o 
INNER JOIN order_items AS oi ON o.order_id = oi.order_id 
INNER JOIN products AS p ON oi.product_id = p.product_id;

-- customers and their addresses
SELECT c.first_name, c.last_name, a.city, a.street 
FROM customers AS c 
LEFT JOIN addresses AS a ON c.customer_id = a.customer_id;

-- product-category compliance check
SELECT p.name AS product_name, c.title AS category_name 
FROM products AS p 
FULL OUTER JOIN product_categories AS pc ON p.product_id = pc.product_id 
FULL OUTER JOIN categories AS c ON pc.category_id = c.category_id;