USE cloud_coffee;
CREATE TABLE coffee_table (
    coffee_id INT PRIMARY KEY,
    coffee_name VARCHAR(50),
    roast VARCHAR(20),
    size CHAR(1),
    price DECIMAL(5,2)
);
INSERT INTO coffee_table (coffee_id, coffee_name, roast, size, price)
VALUES
(1, 'Espresso', 'Dark', 'S', 3.50),
(2, 'Latte', 'Medium', 'M', 4.75),
(3, 'Cold Brew', 'Medium', 'L', 4.25),
(4, 'Cappuccino', 'Dark', 'M', 4.50);

SELECT * FROM coffee_table;

CREATE TABLE customer_name (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

SELECT * FROM customer_name;

INSERT INTO customer_name (customer_id, first_name, last_name)
VALUES
(1, 'John', 'Smith'),
(2, 'Sarah', 'Johnson'),
(3, 'Michael', 'Brown'),
(4, 'Emily', 'Davis');

SELECT * FROM customer_name;

CREATE TABLE customer_order (
    customer_id INT,
    orders CHAR(3) PRIMARY KEY,
    coffee_id INT,
    quantity INT,
    FOREIGN KEY (customer_id) REFERENCES customer_name(customer_id),
    FOREIGN KEY (coffee_id) REFERENCES coffee_table(coffee_id)
);

INSERT INTO customer_order (customer_id, orders, coffee_id, quantity)
VALUES
(1, '001', 1, 2),
(2, '002', 2, 1),
(3, '003', 3, 3),
(4, '004', 4, 1);

SELECT * FROM customer_order;

SELECT
    customer_order.orders,
    customer_name.first_name,
    customer_name.last_name,
    coffee_table.coffee_name,
    customer_order.quantity
FROM customer_order
JOIN customer_name
    ON customer_order.customer_id = customer_name.customer_id
JOIN coffee_table
    ON customer_order.coffee_id = coffee_table.coffee_id;