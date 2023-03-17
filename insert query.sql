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
