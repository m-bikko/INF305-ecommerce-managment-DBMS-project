# INF305-ecommerce-managment-DBMS-project
As a part of our University SDU Curriculum, I made this project for Database Management Systems (DBMS)
This project contains theoretical as well as implementation in SQL.
If you liked the repo do star it. plz...
 
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
```sql
INSERT INTO users1 (user_id, username, email, password1)
--values:(user_id int, username String, email String, password1 String)
VALUES (, '', '', '');
```
  - A customer can view his order history.
```sql
SELECT o.order_id, o.order_date, o.total_price
FROM orders o
WHERE o.user_id = :customer_user_id
ORDER BY o.order_date DESC;
```
  - Admin can start a sale with certain discount on every product.
```sql
UPDATE products
SET price = price * (1 - :discount_percentage / 100);
```
  - Customer can filter the product based on the product details.
```sql
SELECT p.product_id, p.title, p.price
FROM products p
JOIN product_details pd ON p.product_id = pd.product_id
WHERE pd.key1 = :filter_key AND pd.value1 = :filter_value;
```
  - A seller can unregister/ stop selling his product.
```sql
UPDATE products
SET stock = 0
WHERE product_id = :product_id;
```
  - A seller/ customer can update his details.
```sql
UPDATE users1
SET username = :new_username, email = :new_email, password1 = :new_password
WHERE user_id = :user_id;
```
  - Admin can view total profit earned from the website.

```sql
SELECT SUM(oi.price * oi.quantity) AS total_profit
FROM order_items oi;
```
### 2.2 ER diagram
  ![ER diagram](https://github.com/m-bikko/INF305-ecommerce-managment-DBMS-project/blob/main/er_diagram.png)
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

begin
    INSERT INTO users1 (user_id, username, email, password1) VALUES (1, 'Marbik', 'MRBK@gmail.com', 'comExample123');
    INSERT INTO users1 (user_id, username, email, password1) VALUES (2, 'D1saa', 'Dias.K03@gmail.com', 'Dias2003');
    INSERT INTO users1 (user_id, username, email, password1) VALUES (3, 'Keks', 'Beks.A2003@gmail.com', 'cookies114');
    INSERT INTO users1 (user_id, username, email, password1) VALUES (4, 'Abzal', 'Abzik123@gmail.com', 'pistolet');
    INSERT INTO users1 (user_id, username, email, password1) VALUES (5, 'PhoneBreaker', 'SultanKr@mail.ru', 'SulaSila');
    INSERT INTO users1 (user_id, username, email, password1) VALUES (6, 'Amirkhan', 'CatLover@bk.ru', 'ReksLovesMyCat');
    INSERT INTO users1 (user_id, username, email, password1) VALUES (7, 'Akkkk', 'Akezhan@mail.ru', '20040506');
    INSERT INTO users1 (user_id, username, email, password1) VALUES (8, 'LastDefender', 'AiserM@gmail.com', 'AisLovesIce');
end;
begin
    INSERT INTO addresses (address_id, user_id, street, city, state1, zip_code, country) VALUES (1, 1, 'Abai', 'Almaty', 'ALA', '040096', 'Kazakstan');
    INSERT INTO addresses (address_id, user_id, street, city, state1, zip_code, country) VALUES (2, 2, 'Rozybakieva', 'Almaty', 'ALA', '040091', 'Kazakstan');
    INSERT INTO addresses (address_id, user_id, street, city, state1, zip_code, country) VALUES (3, 3, 'Bauyrzhan M.', 'Almaty', 'ALA', '040090', 'Kazakhstan');
    INSERT INTO addresses (address_id, user_id, street, city, state1, zip_code, country) VALUES (4, 4, '8 auyl', 'Kulsary', 'GUW', '060100', 'Kazakhstan');
    INSERT INTO addresses (address_id, user_id, street, city, state1, zip_code, country) VALUES (5, 5, 'Basenova', 'Atyrau', 'GUW', '060002', 'Kazakhstan');
    INSERT INTO addresses (address_id, user_id, street, city, state1, zip_code, country) VALUES (6, 6, 'Lenin', 'Saint-Peter', 'Saint-Peter', '122500', 'Russia');
    INSERT INTO addresses (address_id, user_id, street, city, state1, zip_code, country) VALUES (7, 7, 'Main Street', 'New York', 'NY', '010001', 'USA');
    INSERT INTO addresses (address_id, user_id, street, city, state1, zip_code, country) VALUES (8, 8, 'Wolf Street', 'New York', 'NY', '010000', 'USA');
end;
begin
    INSERT INTO categories (category_id, name1) VALUES (1, 'Laptops');
    INSERT INTO categories (category_id, name1) VALUES (2, 'Smartphones');
    INSERT INTO categories (category_id, name1) VALUES (3, 'PCs');
    INSERT INTO categories (category_id, name1) VALUES (4, 'TVs');
    INSERT INTO categories (category_id, name1) VALUES (5, 'Printers');
end;
begin
    INSERT INTO manufacturers (manufacturer_id, name1) VALUES (1, 'Apple');
    INSERT INTO manufacturers (manufacturer_id, name1) VALUES (2, 'LG');
    INSERT INTO manufacturers (manufacturer_id, name1) VALUES (3, 'Samsung');
    INSERT INTO manufacturers (manufacturer_id, name1) VALUES (4, 'Razer');   
    INSERT INTO manufacturers (manufacturer_id, name1) VALUES (5, 'Asus');
    INSERT INTO manufacturers (manufacturer_id, name1) VALUES (6, 'Lenovo');
end;

begin
    INSERT INTO products (product_id, title, category_id, manufacturer_id, price, stock, creation_date) VALUES (1, 'iPhone 14 PRO MAX', 2, 1, 750000, 50, TO_DATE('2023-04-22', 'YYYY-MM-DD'));
    INSERT INTO products (product_id, title, category_id, manufacturer_id, price, stock, creation_date) VALUES (2, 'iPhone 12', 2, 1, 400000, 10, TO_DATE('2023-04-20', 'YYYY-MM-DD'));
    INSERT INTO products (product_id, title, category_id, manufacturer_id, price, stock, creation_date) VALUES (3, 'Lenovo IdeaPad 3', 1, 6, 800000, 15, TO_DATE('2023-04-21', 'YYYY-MM-DD'));
    INSERT INTO products (product_id, title, category_id, manufacturer_id, price, stock, creation_date) VALUES (4, 'Lenovo Legion Y540', 1, 6, 900000, 5, TO_DATE('2023-03-01', 'YYYY-MM-DD'));
    INSERT INTO products (product_id, title, category_id, manufacturer_id, price, stock, creation_date) VALUES (5, 'ASUS Rog Gaming Brick', 3, 5, 1500000, 2, TO_DATE('2023-03-29', 'YYYY-MM-DD'));
    INSERT INTO products (product_id, title, category_id, manufacturer_id, price, stock, creation_date) VALUES (6, 'Razer PrintF', 5, 4, 200000, 150, TO_DATE('2023-02-22', 'YYYY-MM-DD'));
    INSERT INTO products (product_id, title, category_id, manufacturer_id, price, stock, creation_date) VALUES (7, 'LG TV', 4, 2, 150000, 20, TO_DATE('2023-04-02', 'YYYY-MM-DD'));
    INSERT INTO products (product_id, title, category_id, manufacturer_id, price, stock, creation_date) VALUES (8, 'ASUS ROG Phone', 2, 5, 350000, 50, TO_DATE('2023-03-15', 'YYYY-MM-DD'));
    INSERT INTO products (product_id, title, category_id, manufacturer_id, price, stock, creation_date) VALUES (9, 'Samsung A60', 2, 3, 280000, 250, TO_DATE('2023-04-12', 'YYYY-MM-DD'));
    INSERT INTO products (product_id, title, category_id, manufacturer_id, price, stock, creation_date) VALUES (10, 'Samsung E2020', 5, 3, 150000, 80, TO_DATE('2023-03-12', 'YYYY-MM-DD'));
    INSERT INTO products (product_id, title, category_id, manufacturer_id, price, stock, creation_date) VALUES (11, 'Samsung R1200', 5, 3, 250000, 50, TO_DATE('2023-03-17', 'YYYY-MM-DD'));
end;

begin 
    INSERT INTO product_details (product_detail_id, product_id, key1, value1) VALUES (1, 1, 'Color', 'Midnight');
    INSERT INTO product_details (product_detail_id, product_id, key1, value1) VALUES (2, 1, 'Weight', '150g');
    INSERT INTO product_details (product_detail_id, product_id, key1, value1) VALUES (3, 2, 'Color', 'Grey');
    INSERT INTO product_details (product_detail_id, product_id, key1, value1) VALUES (4, 2, 'Weight', '140g');
    INSERT INTO product_details (product_detail_id, product_id, key1, value1) VALUES (5, 3, 'Color', 'Black');
    INSERT INTO product_details (product_detail_id, product_id, key1, value1) VALUES (6, 3, 'Weight', '2300g');
    INSERT INTO product_details (product_detail_id, product_id, key1, value1) VALUES (7, 4, 'Color', 'White');
    INSERT INTO product_details (product_detail_id, product_id, key1, value1) VALUES (8, 4, 'Weight', '2800g');
    INSERT INTO product_details (product_detail_id, product_id, key1, value1) VALUES (9, 5, 'Color', 'Black');
    INSERT INTO product_details (product_detail_id, product_id, key1, value1) VALUES (10, 5, 'Weight', '12000g');
    INSERT INTO product_details (product_detail_id, product_id, key1, value1) VALUES (11, 6, 'Color', 'Yellow');
    INSERT INTO product_details (product_detail_id, product_id, key1, value1) VALUES (12, 6, 'Weight', '80g');
    INSERT INTO product_details (product_detail_id, product_id, key1, value1) VALUES (13, 7, 'Color', 'Grey');
    INSERT INTO product_details (product_detail_id, product_id, key1, value1) VALUES (14, 7, 'Weight', '4000g');
    INSERT INTO product_details (product_detail_id, product_id, key1, value1) VALUES (15, 8, 'Color', 'Black');
    INSERT INTO product_details (product_detail_id, product_id, key1, value1) VALUES (16, 8, 'Weight', '200g');
    INSERT INTO product_details (product_detail_id, product_id, key1, value1) VALUES (17, 9, 'Color', 'Space Grey');
    INSERT INTO product_details (product_detail_id, product_id, key1, value1) VALUES (18, 9, 'Weight', '180g');
    INSERT INTO product_details (product_detail_id, product_id, key1, value1) VALUES (19, 10, 'Color', 'White');
    INSERT INTO product_details (product_detail_id, product_id, key1, value1) VALUES (20, 10, 'Weight', '2000g');
    INSERT INTO product_details (product_detail_id, product_id, key1, value1) VALUES (21, 11, 'Color', 'White');
    INSERT INTO product_details (product_detail_id, product_id, key1, value1) VALUES (22, 11, 'Weight', '2050g');
end;

begin
    INSERT INTO payment_methods (payment_method_id, name1) VALUES (1, 'Credit Card');
    INSERT INTO payment_methods (payment_method_id, name1) VALUES (2, 'Debit Card');
    INSERT INTO payment_methods (payment_method_id, name1) VALUES (3, 'Cash');
    INSERT INTO payment_methods (payment_method_id, name1) VALUES (4, 'International transfer');
    INSERT INTO payment_methods (payment_method_id, name1) VALUES (5, 'Barter');
end;

begin
    INSERT INTO orders (order_id, user_id, payment_method_id, address_id, order_date, total_price) 
    VALUES (1, 1, 1, 1, TO_DATE('2023-04-23', 'YYYY-MM-DD'), 750000);
    INSERT INTO orders (order_id, user_id, payment_method_id, address_id, order_date, total_price) 
    VALUES (2, 2, 2, 2, TO_DATE('2023-04-23', 'YYYY-MM-DD'), 400000);
    INSERT INTO orders (order_id, user_id, payment_method_id, address_id, order_date, total_price) 
    VALUES (3, 1, 2, 1, TO_DATE('2023-04-20', 'YYYY-MM-DD'), 800000);
    INSERT INTO orders (order_id, user_id, payment_method_id, address_id, order_date, total_price) 
    VALUES (4, 5, 2, 5, TO_DATE('2023-04-18', 'YYYY-MM-DD'), 900000);
    INSERT INTO orders (order_id, user_id, payment_method_id, address_id, order_date, total_price) 
    VALUES (5, 7, 3, 7, TO_DATE('2023-04-23', 'YYYY-MM-DD'), 1500000);
    INSERT INTO orders (order_id, user_id, payment_method_id, address_id, order_date, total_price) 
    VALUES (6, 6, 5, 6, TO_DATE('2023-04-23', 'YYYY-MM-DD'), 200000);
    INSERT INTO orders (order_id, user_id, payment_method_id, address_id, order_date, total_price) 
    VALUES (7, 8, 3, 8, TO_DATE('2023-04-22', 'YYYY-MM-DD'), 150000);
    INSERT INTO orders (order_id, user_id, payment_method_id, address_id, order_date, total_price) 
    VALUES (8, 5, 4, 5, TO_DATE('2023-04-19', 'YYYY-MM-DD'), 350000);
end;

begin
    INSERT INTO order_items (order_item_id, order_id, product_id, quantity, price) 
    VALUES (1, 1, 1, 1, 750000);
    INSERT INTO order_items (order_item_id, order_id, product_id, quantity, price) 
    VALUES (2, 2, 2, 1, 400000);
    INSERT INTO order_items (order_item_id, order_id, product_id, quantity, price) 
    VALUES (3, 3, 3, 1, 800000);
    INSERT INTO order_items (order_item_id, order_id, product_id, quantity, price) 
    VALUES (4, 4, 4, 1, 900000);
    INSERT INTO order_items (order_item_id, order_id, product_id, quantity, price) 
    VALUES (5, 5, 5, 1, 1500000);
    INSERT INTO order_items (order_item_id, order_id, product_id, quantity, price) 
    VALUES (6, 6, 6, 1, 200000);
    INSERT INTO order_items (order_item_id, order_id, product_id, quantity, price) 
    VALUES (7, 7, 7, 1, 150000);
    INSERT INTO order_items (order_item_id, order_id, product_id, quantity, price) 
    VALUES (8, 8, 8, 1, 350000);
end;

begin
    INSERT INTO reviews (review_id, product_id, user_id, rating, comment1, review_date) 
    VALUES (1, 1, 1, 5, 'Iphone 14 is So GoooD!', TO_DATE('2023-04-23', 'YYYY-MM-DD'));
    INSERT INTO reviews (review_id, product_id, user_id, rating, comment1, review_date) 
    VALUES (2, 2, 1, 3, 'Laptop is overrated', TO_DATE('2023-04-20', 'YYYY-MM-DD'));
    INSERT INTO reviews (review_id, product_id, user_id, rating, comment1, review_date) 
    VALUES (3, 3, 2, 5, 'Iphone is always Iphone', TO_DATE('2023-04-23', 'YYYY-MM-DD'));
    INSERT INTO reviews (review_id, product_id, user_id, rating, comment1, review_date) 
    VALUES (4, 4, 5, 4, 'Laptop is so heavy(', TO_DATE('2023-04-18', 'YYYY-MM-DD'));
    INSERT INTO reviews (review_id, product_id, user_id, rating, comment1, review_date) 
    VALUES (5, 5, 5, 3, 'Good only for gaming, not for daily usage', TO_DATE('2023-04-19', 'YYYY-MM-DD'));
    INSERT INTO reviews (review_id, product_id, user_id, rating, comment1, review_date) 
    VALUES (6, 6, 6, 5, 'Prints well', TO_DATE('2023-04-23', 'YYYY-MM-DD'));
    INSERT INTO reviews (review_id, product_id, user_id, rating, comment1, review_date) 
    VALUES (7, 7, 7, 1, 'Brick is not just a name!', TO_DATE('2023-04-23', 'YYYY-MM-DD'));
    INSERT INTO reviews (review_id, product_id, user_id, rating, comment1, review_date) 
    VALUES (8, 8, 8, 5, '4K TV unbelievable experience', TO_DATE('2023-04-22', 'YYYY-MM-DD'));
end;
```

## 4.Queries
### 4.1 Basic queries

 - Select all for any table:

```sql
SELECT * FROM TABLE; --write a name of needed table
```

 - Retrieve all reviews for a specific product:

```
sql
Copy code
SELECT reviews.*, users1.username
FROM reviews
JOIN users1 ON reviews.user_id = users1.user_id
WHERE reviews.product_id = 123;
```
 - Retrieve all products in a specific category:
```
sql
Copy code
SELECT products.*
FROM products
JOIN categories ON products.category_id = categories.category_id
WHERE categories.name1 = 'electronics';
```
### 4.2 Procedure which does group by information 
Query which does return the number of items in sale by goups using command group by
```sql
CREATE OR REPLACE PROCEDURE group_by_category AS
  CURSOR category_cursor IS
    SELECT
      ca.name1 AS category_name,
      COUNT(p.product_id) AS product_count
    FROM
      categories ca
      JOIN products p ON ca.category_id = p.category_id
    GROUP BY
      ca.name1;

  category_info category_cursor%ROWTYPE;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Category' || ': ' || 'Product Count');
  DBMS_OUTPUT.PUT_LINE('--------' || '   ------------');

  FOR category_info IN category_cursor LOOP
    DBMS_OUTPUT.PUT_LINE(category_info.category_name || ': ' || category_info.product_count);
  END LOOP;
END;
```

To execute procedure use:
```sql
BEGIN
  group_by_category;
END;
```
### 4.3 Function which counts the number of records 

```sql
CREATE OR REPLACE FUNCTION count_r_table(table_name IN VARCHAR2) RETURN NUMBER AS
  record_count NUMBER;
  v_sql         VARCHAR2(1000);
BEGIN
  v_sql := 'SELECT COUNT(*) FROM ' || table_name;
  EXECUTE IMMEDIATE v_sql INTO record_count;
  RETURN record_count;
END;
```

Its Execution block of code
```sql
DECLARE
  record_count NUMBER;
BEGIN
  record_count := count_r_table('product_details');--I can also write another table's name.
  DBMS_OUTPUT.PUT_LINE('Number of records in the product_details table: ' || record_count);--also its just an example
END;
```

### 4.4 Procedure which uses SQL%ROWCOUNT to determine the number of rows affected
Code explains how many tuples were affected during update
```sql
CREATE OR REPLACE PROCEDURE update_stock(p_product_id NUMBER, p_stock NUMBER) AS
BEGIN
  UPDATE products
  SET stock = stock + p_stock
  WHERE product_id = p_product_id;
  DBMS_OUTPUT.PUT_LINE('Rows affected: ' || SQL%ROWCOUNT);
  COMMIT;
END;
```

Execution code:
```sql
BEGIN
  update_stock(1, 10);
END;
```
### 4.5 Add user-defined exception which disallows to enter title of item (e.g. book) to be less than 5 characters

As our table is not just a e-commerce database, we come to decision that we need to take title of pruduct which is not less than 5 character
```sql
CREATE OR REPLACE TRIGGER title_length
  BEFORE INSERT
  ON products
  FOR EACH ROW
DECLARE
  title_short EXCEPTION;
BEGIN
  IF LENGTH(:NEW.title) < 5 THEN
    RAISE title_short;
  END IF;
EXCEPTION
  WHEN title_short THEN
    RAISE_APPLICATION_ERROR(-20001, 'Error: Product title must be at least 5 characters long.');
END;
```

To execute we will give an example

```sql
 INSERT INTO products (product_id, title, category_id, manufacturer_id, price, stock, creation_date)
VALUES (4, 'LTV', 3, 3, 500000, 100, SYSDATE);
```
### 4.6 Create a trigger before insert on any entity which will show the current number of rows in the table

In Oracle its impossible to create 1 trigger and use it for many tables, So We created only 1(Products) to show that its possible to create a trigger that will show number of existing rows before data insertion in executed:

```sql
CREATE OR REPLACE TRIGGER rowsN_before_insert
  BEFORE INSERT
  ON products
  FOR EACH ROW
DECLARE
  v_row_count NUMBER;
BEGIN
  SELECT COUNT(*)
  INTO v_row_count
  FROM products;
  DBMS_OUTPUT.PUT_LINE('Current number of rows in the Products table: ' || v_row_count);
END;
```

Execution example:

```sql
--its important to have unique id and need to remember that somewhere it is foreign constraints.
INSERT INTO products (product_id, title, category_id, manufacturer_id, price, stock, creation_date)
VALUES (1235, 'Example Product', 1, 1, 100, 50, SYSDATE);
```
