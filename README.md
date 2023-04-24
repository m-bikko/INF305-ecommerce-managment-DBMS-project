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

Users1 Table:
This table contains information about all users, including web-app user_id, name, password and email.

```sql
  CREATE TABLE users1 (
    user_id NUMBER PRIMARY KEY,
    username VARCHAR2(50) NOT NULL,
    email VARCHAR2(100) UNIQUE NOT NULL,
    password1 VARCHAR2(100) NOT NULL
  );
```
Addresses Table:
This table contains more information about user's address, such as: address_id, user_id, street, city, state, zip_code, country.

```sql
CREATE TABLE addresses (
    address_id NUMBER PRIMARY KEY,
    user_id NUMBER,
    street VARCHAR2(100) NOT NULL,
    city VARCHAR2(50) NOT NULL,
    state1 VARCHAR2(50) NOT NULL,
    zip_code VARCHAR2(10) NOT NULL,
    country VARCHAR2(50) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users1(user_id)
);
```
Categories Table:
This table contains information about existing categories.

```sql
CREATE TABLE categories (
    category_id NUMBER PRIMARY KEY,
    name1 VARCHAR2(50) NOT NULL
);
```
Manifacturers Table:
This table contains information about manifacturers.

```sql
CREATE TABLE manufacturers (
    manufacturer_id NUMBER PRIMARY KEY,
    name1 VARCHAR2(100) NOT NULL
);
```
Payment Method Table:
This table contains information about payment types.

```sql
CREATE TABLE payment_methods (
    payment_method_id NUMBER PRIMARY KEY,
    name1 VARCHAR2(50) NOT NULL
);
```
Orders Table:
This table contains information about orders. Such as: order_id, user_id, payment_method, address_id, order_date and total_price. 

```sql
CREATE TABLE orders (
    order_id NUMBER PRIMARY KEY,
    user_id NUMBER,
    payment_method_id NUMBER,
    address_id NUMBER,
    order_date DATE NOT NULL,
    total_price NUMBER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users1(user_id),
    FOREIGN KEY (payment_method_id) REFERENCES payment_methods(payment_method_id),
    FOREIGN KEY (address_id) REFERENCES addresses(address_id)
);
```
Products Table:
This table contains information about all stored products, which contains: product_id, title, category_id, manifacturer_id, price, stock, creation_date.

```sql
CREATE TABLE products (
    product_id NUMBER PRIMARY KEY,
    title VARCHAR2(100) NOT NULL,
    category_id NUMBER,
    manufacturer_id NUMBER,
    price NUMBER NOT NULL,
    stock NUMBER NOT NULL,
    creation_date DATE NOT NULL,
    FOREIGN KEY (category_id) REFERENCES categories(category_id),
    FOREIGN KEY (manufacturer_id) REFERENCES manufacturers(manufacturer_id)
);
```

Order Items Table:
This table contains information about all details of ordered Items.

```sql
CREATE TABLE order_items (
    order_item_id NUMBER PRIMARY KEY,
    order_id NUMBER,
    product_id NUMBER,
    quantity NUMBER NOT NULL,
    price NUMBER NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
```

Product Details Table:
This table contains information about product information.

```sql
CREATE TABLE product_details (
    product_detail_id NUMBER PRIMARY KEY,
    product_id NUMBER,
    key1 VARCHAR2(50) NOT NULL,
    value1 VARCHAR2(200) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
```

Review Table:
This table contains information about feedback.

```sql
CREATE TABLE reviews (
    review_id NUMBER PRIMARY KEY,
    product_id NUMBER,
    user_id NUMBER,
    rating NUMBER NOT NULL,
    comment1 VARCHAR2(400),
    review_date DATE NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (user_id) REFERENCES users1(user_id)
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


