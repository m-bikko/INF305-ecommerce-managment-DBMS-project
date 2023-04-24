CREATE TABLE users1 (
    user_id NUMBER PRIMARY KEY,
    username VARCHAR2(50) NOT NULL,
    email VARCHAR2(100) UNIQUE NOT NULL,
    password1 VARCHAR2(100) NOT NULL
);

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

CREATE TABLE categories (
    category_id NUMBER PRIMARY KEY,
    name1 VARCHAR2(50) NOT NULL
);

CREATE TABLE manufacturers (
    manufacturer_id NUMBER PRIMARY KEY,
    name1 VARCHAR2(100) NOT NULL
);

CREATE TABLE payment_methods (
    payment_method_id NUMBER PRIMARY KEY,
    name1 VARCHAR2(50) NOT NULL
);

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

CREATE TABLE order_items (
    order_item_id NUMBER PRIMARY KEY,
    order_id NUMBER,
    product_id NUMBER,
    quantity NUMBER NOT NULL,
    price NUMBER NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


CREATE TABLE product_details (
    product_detail_id NUMBER PRIMARY KEY,
    product_id NUMBER,
    key1 VARCHAR2(50) NOT NULL,
    value1 VARCHAR2(200) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

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
