INSERT INTO products (name, description, price, stock_quantity) 
VALUES ('Навушники AirPods', 'Бездротові навушники', 8000.00, 20);

INSERT INTO product_categories (product_id, category_id) 
VALUES (4, 1);


INSERT INTO customers (first_name, last_name, email, phone) 
VALUES ('Михаїл', 'Зубенко', 'mafioznik@email.com', '+380990001122');

SELECT * FROM customers WHERE email = 'mafioznik@email.com';