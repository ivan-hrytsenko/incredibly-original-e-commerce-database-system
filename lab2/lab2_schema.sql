DROP SCHEMA public CASCADE;
CREATE SCHEMA public;

CREATE TABLE categories (
    category_id     SERIAL PRIMARY KEY,
    title           VARCHAR(255) NOT NULL,
    description     TEXT
);

CREATE TABLE products (
    product_id      SERIAL PRIMARY KEY,
    name            VARCHAR(255) NOT NULL,
    description     TEXT,
    price           NUMERIC(10, 2) NOT NULL,
    stock_quantity  INTEGER DEFAULT 0
);

CREATE TABLE product_categories (
    product_id      INTEGER REFERENCES products(product_id) ON DELETE CASCADE,
    category_id     INTEGER REFERENCES categories(category_id) ON DELETE CASCADE,
    PRIMARY KEY     (product_id, category_id)
);

CREATE TABLE customers (
    customer_id     SERIAL PRIMARY KEY,
    first_name      VARCHAR(100) NOT NULL,
    last_name       VARCHAR(100) NOT NULL,
    email           VARCHAR(150) UNIQUE NOT NULL,
    phone           VARCHAR(20),
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE addresses (
    address_id      SERIAL PRIMARY KEY,
    city            VARCHAR(100) NOT NULL,
    street          VARCHAR(255) NOT NULL,
    house_number    VARCHAR(20) NOT NULL,
    zip_code        VARCHAR(20),
    customer_id     INTEGER REFERENCES customers(customer_id) ON DELETE CASCADE
);

CREATE TABLE orders (
    order_id        SERIAL PRIMARY KEY,
    order_date      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status          VARCHAR(50),
    total_amount    NUMERIC(12, 2),
    customer_id     INTEGER REFERENCES customers(customer_id) ON DELETE SET NULL,
    address_id      INTEGER REFERENCES addresses(address_id) ON DELETE SET NULL
);

CREATE TABLE order_items (
    order_id        INTEGER REFERENCES orders(order_id) ON DELETE CASCADE,
    product_id      INTEGER REFERENCES products(product_id) ON DELETE CASCADE,
    quantity        INTEGER NOT NULL CHECK (quantity > 0),
    unit_price      NUMERIC(10, 2) NOT NULL,
    PRIMARY KEY     (order_id, product_id)
);