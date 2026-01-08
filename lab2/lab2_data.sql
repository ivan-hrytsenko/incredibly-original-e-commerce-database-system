INSERT INTO categories (title, description) VALUES
    ('Електроніка', 'Гаджети, смартфони, ноутбуки'),
    ('Одяг', 'Чоловічий та жіночий одяг'),
    ('Дім', 'Товари для дому та саду');

INSERT INTO products (name, description, price, stock_quantity) VALUES
    ('iPhone 15', 'Останній смартфон від Apple', 35000.00, 10),
    ('Футболка Nike', 'Спортивна футболка', 1200.00, 50),
    ('Кавоварка Philips', 'Автоматична кавоварка', 15000.00, 5);

INSERT INTO product_categories (product_id, category_id) VALUES
    (1, 1),
    (2, 2),
    (3, 1),
    (3, 3);

INSERT INTO customers (first_name, last_name, email, phone) VALUES
    ('Іван', 'Іваненко', 'ivan@email.com', '+380501112233'),
    ('Євген', 'Євгенишин', 'yevhen@email.com', '+380674445566');

INSERT INTO addresses (city, street, house_number, zip_code, customer_id) VALUES
    ('Івано-Франківстк', 'Франка', '1', '11111', 1),
    ('Дніпро', 'Коновальця', '2', '22222', 2);

INSERT INTO orders (status, total_amount, customer_id, address_id) VALUES
    ('Виконано', 36200.00, 1, 1),
    ('Нове', 15000.00, 2, 2);

INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
    (1, 1, 1, 35000.00),
    (1, 2, 1, 1200.00),
    (2, 3, 1, 15000.00);