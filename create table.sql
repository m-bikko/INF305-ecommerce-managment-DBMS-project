CREATE DATABASE ecommerce;

USE ecommerce;

CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  name VARCHAR(50),
  email VARCHAR(100),
  phone VARCHAR(20),
  address VARCHAR(200)
);

CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  total_amount DECIMAL(10,2),
  payment_method VARCHAR(50),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
  order_item_id INT PRIMARY KEY,
  order_id INT,
  product_id INT,
  quantity INT,
  price DECIMAL(10,2),
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(50),
  description TEXT,
  image_url VARCHAR(200),
  price DECIMAL(10,2),
  stock_quantity INT,
  category_id INT,
  supplier_id INT,
  FOREIGN KEY (category_id) REFERENCES categories(category_id),
  FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

CREATE TABLE categories (
  category_id INT PRIMARY KEY,
  category_name VARCHAR(50)
);

CREATE TABLE reviews (
  review_id INT PRIMARY KEY,
  customer_id INT,
  product_id INT,
  rating INT,
  review_text TEXT,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE suppliers (
  supplier_id INT PRIMARY KEY,
  supplier_name VARCHAR(50),
  contact_name VARCHAR(50),
  address VARCHAR(200),
  phone VARCHAR(20),
  email VARCHAR(100)
);
