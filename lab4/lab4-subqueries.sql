-- difference between the average price and products' prices
SELECT name, price, 
       (SELECT AVG(price) FROM products) AS global_avg_price, 
       price - (SELECT AVG(price) FROM products) AS difference 
FROM products;

-- customers who placed orders above the average
SELECT first_name, last_name 
FROM customers 
WHERE customer_id IN (
    SELECT customer_id 
    FROM orders 
    WHERE total_amount > (SELECT AVG(total_amount) FROM orders)
);

-- categories with an average product price lower than the average price of the store
SELECT c.title, AVG(p.price) 
FROM categories c 
JOIN product_categories pc ON c.category_id = pc.category_id 
JOIN products p ON pc.product_id = p.product_id 
GROUP BY c.title 
HAVING AVG(p.price) < (SELECT AVG(price) FROM products);