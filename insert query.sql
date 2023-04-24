
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
