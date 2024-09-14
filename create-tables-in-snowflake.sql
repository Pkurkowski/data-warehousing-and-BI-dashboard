-- Create customers table
CREATE TABLE customers (
    customer_id STRING PRIMARY KEY,
    customer_name STRING,
    customer_email STRING,
    customer_age INT,
    customer_country STRING
);

-- Create products table
CREATE TABLE products (
    product_id STRING PRIMARY KEY,
    product_name STRING,
    product_category STRING,
    product_price FLOAT
);

-- Create orders table
CREATE TABLE orders (
    order_id STRING PRIMARY KEY,
    customer_id STRING REFERENCES customers(customer_id),
    order_date TIMESTAMP,
    total_amount FLOAT
);

-- Create order details table
CREATE TABLE order_details (
    order_detail_id STRING PRIMARY KEY,
    order_id STRING REFERENCES orders(order_id),
    product_id STRING REFERENCES products(product_id),
    quantity INT,
    price_per_unit FLOAT
);
