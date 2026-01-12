-- sales stats
SELECT 
    COUNT(order_id) AS total_orders, 
    SUM(total_amount) AS total_revenue, 
    AVG(total_amount) AS average_order_value, 
    MAX(total_amount) AS most_expensive_order 
FROM orders;

-- number of products in every category
SELECT c.title, COUNT(pc.product_id) AS product_count 
FROM categories AS c 
LEFT JOIN product_categories AS pc ON c.category_id = pc.category_id 
GROUP BY c.title;

-- average price in categories with products > 1 
SELECT c.title, ROUND(AVG(p.price), 2) AS avg_price 
FROM categories AS c 
JOIN product_categories AS pc ON c.category_id = pc.category_id 
JOIN products AS p ON pc.product_id = p.product_id 
GROUP BY c.title 
HAVING COUNT(p.product_id) > 1;

-- spent by each customer
SELECT c.first_name, c.last_name, SUM(o.total_amount) AS total_spent 
FROM customers AS c 
JOIN orders AS o ON c.customer_id = o.customer_id 
GROUP BY c.first_name, c.last_name 
ORDER BY total_spent DESC;