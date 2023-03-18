# INF305-ecommerce-managment-DBMS-project
As a part of our University SDU Curriculum, I made this project for Database Management Systems (DBMS)
This project contains theoretical as well as implementation in SQL.
If you liked the repo do star it.
 
# Pre-requisite
MySql (MariaDB)

# Contents
- Project Description
- Basic Strucutre
  - Functional requirements
  - ER diagram
  - Relational database schema
- Implementation
  - Creating tables
  - Inserting data
- Queries
  - Basic queries
  - Procedure which does group by information 
  - Function which counts the number of records 
  - Procedure which uses SQL%ROWCOUNT to determine the number of rows affected
  - Add user-defined exception which disallows to enter title of item (e.g. book) to be less than 5 characters
  - Create a trigger before insert on any entity which will show the current number of rows in the table

## 1.Project Description

In this contemporary era of on-line purchasing no seller wants to be left behind, moreover because of its simplicity the shift from offline selling version to an online promoting version is witnessing a rampant boom.<br>
Therefore, as an engineer our activity is to ease the path of this transition for the seller.
Amongst many stuff that a web web site calls for the maximum critical is a database machine. Subsequently in this mission we're planning to design a database where small garb dealers can sell their product on-line.


## 2.Basic Structure
### 2.1 Functional requirements
  - A new user can register on the website.
  - A customer can see details of the product present in the cart
  - A customer can view his order history.
  - Admin can start a sale with certain discount on every product.
  - Customer can filter the product based on the product details.
  - A customer can add or delete a product from the cart.
  - A seller can unregister/ stop selling his product.
  - A seller/ customer can update his details.
  - Admin can view the products purchased on particular date.
  - Admin can view number of products sold on a particular date.
  - A customer can view the total price of product present in the cart unpurchased.
  - Admin can view details of customer who have not purchased anything.
  - Admin can view total profit earned from the website.
### 2.2 ER diagram
  ![ER diagram](https://github.com/diaskabdualiev1/INF305-ecommerce-managment-DBMS-project/blob/cce25a0684c8cdd667773f06754e6275b78e90d8/images/er_diagram.png)
### 2.3 Relational database schema


## 3.Implementation
You can directly copy and paste all the commands from the text given here into the SQL console to create and insert values into your table
### 3.1 Creating tables

Customers Table:
This table contains information about all the customers, including customer id, name, email, phone number, and address.

```sql
  CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20),
    address VARCHAR(200)
  );
```
Orders Table:
This table contains information about all the orders, including order id, customer id, order date, total amount, and payment method.

```sql
CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  total_amount DECIMAL(10,2),
  payment_method VARCHAR(50),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
```
Order Items Table:
This table contains information about the items ordered in each order, including order item id, order id, product id, quantity, and price.

```sql
CREATE TABLE order_items (
  order_item_id INT PRIMARY KEY,
  order_id INT,
  product_id INT,
  quantity INT,
  price DECIMAL(10,2),
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);
```
Products Table:
This table contains information about all the products, including product id, product name, description, image, price, and quantity in stock.

```sql
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
```
Categories Table:
This table contains information about all the categories of products, including category id and category name.

```sql
CREATE TABLE categories (
  category_id INT PRIMARY KEY,
  category_name VARCHAR(50)
);
```
Reviews Table:
This table contains information about all the reviews submitted by customers, including review id, customer id, product id, rating, and review text.

```sql
CREATE TABLE reviews (
  review_id INT PRIMARY KEY,
  customer_id INT,
  product_id INT,
  rating INT,
  review_text TEXT,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);
```
Suppliers Table:
This table contains information about all the suppliers of products, including supplier id, supplier name, contact name, address, phone number, and email.

```sql
CREATE TABLE suppliers (
  supplier_id INT PRIMARY KEY,
  supplier_name VARCHAR(50),
  contact_name VARCHAR(50),
  address VARCHAR(200),
  phone VARCHAR(20),
  email VARCHAR(100)
);
```

### 3.2 Inserting data

```sql
INSERT INTO customers (customer_id, name, email, phone, address)
VALUES
  (1, 'Maratov Beimbet', '210103030@stu.sdu.edu.kz', '87713918840', 'Zauyt 3a'),
  (2, 'Kabdualiev Dias', '210103296@stu.sdu.edu.kz', '87023132061', 'Bokeykhanova 64.'),
  (3, '', '', '', '');

INSERT INTO orders (order_id, customer_id, order_date, total_amount, payment_method)
VALUES
  (1001, 1, '2022-02-01', 129.99, 'Credit Card'),
  (1002, 2, '2022-02-15', 49.99, 'PayPal'),
  (1003, 3, '2022-02-28', 219.99, 'Credit Card');

INSERT INTO order_items (order_item_id, order_id, product_id, quantity, price)
VALUES
  (1, 1001, 1, 2, 29.99),
  (2, 1001, 2, 1, 69.99),
  (3, 1002, 3, 1, 49.99),
  (4, 1003, 4, 3, 49.99);

INSERT INTO products (product_id, product_name, description, image_url, price, stock_quantity, category_id, supplier_id)
VALUES
  (1, 'Robot Arm', 'A robotic arm for industrial use', 'https://example.com/robot-arm.jpg', 29.99, 10, 1, 1),
  (2, 'Robot Gripper', 'A robotic gripper for industrial use', 'https://example.com/robot-gripper.jpg', 69.99, 5, 1, 1),
  (3, 'Robot Kit', 'A kit for building your own robot', 'https://example.com/robot-kit.jpg', 49.99, 20, 2, 2),
  (4, 'Robot Sensor', 'A sensor for detecting objects', 'https://example.com/robot-sensor.jpg', 49.99, 8, 2, 2);

INSERT INTO categories (category_id, category_name)
VALUES
  (1, 'Industrial Robotics'),
  (2, 'Robot Kits');

INSERT INTO reviews (review_id, customer_id, product_id, rating, review_text)
VALUES
  (1, 1, 1, 4, 'This robotic arm is exactly what I needed for my manufacturing plant.'),
  (2, 2, 2, 5, 'The gripper is very sturdy and easy to use.'),
  (3, 3, 3, 3, 'The kit was missing a few pieces, but I was able to get them from customer service.');

INSERT INTO suppliers (supplier_id, supplier_name, contact_name, address, phone, email)
VALUES
  (1, 'RoboTech', 'John Smith', '123 Main St.', '555-1234', 'john.smith@robotech.com'),
  (2, 'Robotics Unlimited', 'Jane Doe', '456 Oak Ave.', '555-5678', 'jane.doe@roboticsunlimited.com');
```

## 4.Queries
### 4.1 Basic queries
### 4.2 Procedure which does group by information 
### 4.3 Function which counts the number of records 
### 4.4 Procedure which uses SQL%ROWCOUNT to determine the number of rows affected
### 4.5 Add user-defined exception which disallows to enter title of item (e.g. book) to be less than 5 characters
### 4.6 Create a trigger before insert on any entity which will show the current number of rows in the table


