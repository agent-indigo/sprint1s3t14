
-- Insert customers
INSERT INTO customer (first_name, last_name, phone, email) VALUES ('John', 'Doe', '123-456-7890', 'john.doe@example.com');
INSERT INTO customer (first_name, last_name, phone, email) VALUES ('Jane', 'Smith', '987-654-3210', 'jane.smith@example.com');
INSERT INTO customer (first_name, last_name, phone, email) VALUES ('Michael', 'Johnson', '555-555-5555', 'michael.johnson@example.com');
INSERT INTO customer (first_name, last_name, phone, email) VALUES ('Emily', 'Brown', '444-444-4444', 'emily.brown@example.com');
INSERT INTO customer (first_name, last_name, phone, email) VALUES ('David', 'Davis', '333-333-3333', 'david.davis@example.com');
INSERT INTO customer (first_name, last_name, phone, email) VALUES ('Sarah', 'Taylor', '222-222-2222', 'sarah.taylor@example.com');
INSERT INTO customer (first_name, last_name, phone, email) VALUES ('Christopher', 'Martinez', '111-111-1111', 'christopher.martinez@example.com');
INSERT INTO customer (first_name, last_name, phone, email) VALUES ('Amanda', 'Anderson', '999-999-9999', 'amanda.anderson@example.com');
INSERT INTO customer (first_name, last_name, phone, email) VALUES ('Daniel', 'Hernandez', '888-888-8888', 'daniel.hernandez@example.com');
INSERT INTO customer (first_name, last_name, phone, email) VALUES ('Jessica', 'Garcia', '777-777-7777', 'jessica.garcia@example.com');
INSERT INTO customer (first_name, last_name, phone, email) VALUES ('Matthew', 'Lopez', '666-666-6666', 'matthew.lopez@example.com');
INSERT INTO customer (first_name, last_name, phone, email) VALUES ('Ashley', 'Martinez', '555-555-5555', 'ashley.martinez@example.com');
INSERT INTO customer (first_name, last_name, phone, email) VALUES ('Christopher', 'Brown', '444-444-4444', 'christopher.brown@example.com');
INSERT INTO customer (first_name, last_name, phone, email) VALUES ('Brittany', 'Lee', '333-333-3333', 'brittany.lee@example.com');
INSERT INTO customer (first_name, last_name, phone, email) VALUES ('Andrew', 'Gonzalez', '222-222-2222', 'andrew.gonzalez@example.com');
INSERT INTO customer (first_name, last_name, phone, email) VALUES ('Elizabeth', 'Perez', '111-111-1111', 'elizabeth.perez@example.com');
INSERT INTO customer (first_name, last_name, phone, email) VALUES ('Joshua', 'Wilson', '999-999-9999', 'joshua.wilson@example.com');
INSERT INTO customer (first_name, last_name, phone, email) VALUES ('Samantha', 'Taylor', '888-888-8888', 'samantha.taylor@example.com');
INSERT INTO customer (first_name, last_name, phone, email) VALUES ('Michael', 'Anderson', '777-777-7777', 'michael.anderson@example.com');
INSERT INTO customer (first_name, last_name, phone, email) VALUES ('Stephanie', 'Thomas', '666-666-6666', 'stephanie.thomas@example.com');

-- Insert delivery addresses for customers
INSERT INTO delivery_address (customer_id, address_type, city, province, street, postal_code)
VALUES 
    (1, 'Home', 'Toronto', 'ON', '123 Main St', 'M1A 1A1'),
    (2, 'Work', 'Montreal', 'QC', '456 Elm St', 'H1A 1A1'),
    (3, 'Home', 'Vancouver', 'BC', '789 Oak St', 'V1A 1A1'),
    (4, 'Work', 'Calgary', 'AB', '101 Pine St', 'T1A 1A1'),
    (5, 'Home', 'Ottawa', 'ON', '202 Maple St', 'K1A 1A1'),
    (6, 'Work', 'Edmonton', 'AB', '303 Walnut St', 'T5A 1A1'),
    (7, 'Home', 'Quebec City', 'QC', '404 Cedar St', 'G1A 1A1'),
    (8, 'Work', 'Winnipeg', 'MB', '505 Birch St', 'R1A 1A1'),
    (9, 'Home', 'Hamilton', 'ON', '606 Pine St', 'L8A 1A1'),
    (10, 'Work', 'Halifax', 'NS', '707 Elm St', 'B3A 1A1'),
    (11, 'Home', 'London', 'ON', '808 Oak St', 'N6A 1A1'),
    (12, 'Work', 'Victoria', 'BC', '909 Maple St', 'V8A 1A1'),
    (13, 'Home', 'Saskatoon', 'SK', '1010 Walnut St', 'S7A 1A1'),
    (14, 'Work', 'Regina', 'SK', '1111 Cedar St', 'S4A 1A1'),
    (15, 'Home', 'St. Johns', 'NL', '1212 Birch St', 'A1A 1A1'),
    (16, 'Work', 'Sherbrooke', 'QC', '1313 Pine St', 'J1A 1A1'),
    (17, 'Home', 'Barrie', 'ON', '1414 Elm St', 'L4A 1A1'),
    (18, 'Work', 'Kelowna', 'BC', '1515 Oak St', 'V1A 1A1'),
    (19, 'Home', 'Abbotsford', 'BC', '1616 Maple St', 'V2A 1A1'),
    (20, 'Work', 'Trois-Rivières', 'QC', '1717 Walnut St', 'G9A 1A1')
RETURNING *;

-- insert customer id into shopping cart to generate cart id for each customer:
INSERT INTO shopping_cart (customer_id)
VALUES
    (1),
    (3),
    (5),
    (7),
    (9),
    (11),
    (13),
    (15),
    (17),
    (19),
    (2),
    (4),
    (6),
    (8),
    (10)
   RETURNING *;
  
  -- insert cart items
INSERT INTO shopping_cart_items (cart_id, menu_item_id, price)
VALUES
    (1, 1, (SELECT price FROM menu_item WHERE menu_item_id = 1)),  -- Sample cart item 1
    (1, 3, (SELECT price FROM menu_item WHERE menu_item_id = 3)),  -- Sample cart item 2
    (2, 2, (SELECT price FROM menu_item WHERE menu_item_id = 2)),  -- Sample cart item 3
    (3, 5, (SELECT price FROM menu_item WHERE menu_item_id = 5)),  -- Sample cart item 4
    (4, 8, (SELECT price FROM menu_item WHERE menu_item_id = 8)),  -- Sample cart item 5
    (5, 10, (SELECT price FROM menu_item WHERE menu_item_id = 10)), -- Sample cart item 6
    (6, 12, (SELECT price FROM menu_item WHERE menu_item_id = 12)), -- Sample cart item 7
    (7, 14, (SELECT price FROM menu_item WHERE menu_item_id = 14)), -- Sample cart item 8
    (8, 16, (SELECT price FROM menu_item WHERE menu_item_id = 16)), -- Sample cart item 9
    (9, 18, (SELECT price FROM menu_item WHERE menu_item_id = 18)), -- Sample cart item 10
    (10, 20, (SELECT price FROM menu_item WHERE menu_item_id = 20)); -- Sample cart item 11

--  Insert into shopping_cart_items to test UPSERT logic in orders table and order items table
INSERT INTO shopping_cart_items (cart_id, menu_item_id, price)
VALUES
 (1, 3, (SELECT price FROM menu_item WHERE menu_item_id = 20)),
 (10, 5, (SELECT price FROM menu_item WHERE menu_item_id = 20)); -- Sample cart item 11

--  Insert into orders table
-- step 1: create a cte that selects from shopping_cart_items and perform joins to get customer_id and menu_item_name  
WITH cart_items AS (
    SELECT 
        sc.customer_id, 
        sc.cart_id, 
        s.menu_item_id,
        s.price,
        m.name AS menu_item_name
    FROM 
        shopping_cart_items s
    INNER JOIN 
        shopping_cart sc ON s.cart_id = sc.cart_id
    INNER JOIN 
        menu_item m ON s.menu_item_id = m.menu_item_id
),
-- step 2: create another cte that selects from first cte and perform aggregations for total amount 
--and concatenate menu items to generate order description
cart_items_total AS 
(
SELECT 
	NOW () AS order_date
	, STRING_AGG(menu_item_name, ', ') description -- CONCAT MENU items names to generate order description
	, SUM(price) total_amount
	, customer_id
FROM cart_items
GROUP BY customer_id
)
-- insert results from the cte into orders table
INSERT INTO orders (customer_id, order_date, description, total_amount)  
SELECT 
	 customer_id
	,order_date
	,CONCAT('You ordered for: ', description) description -- concatenate a customized message to order description
	,total_amount
FROM cart_items_total
RETURNING *;


--update orders when new cart items are added
WITH updated_orders AS (
    SELECT 
        c.customer_id,
        o.order_id,
        NOW() AS order_date,
        STRING_AGG(m.name, ', ') AS description,
        SUM(s.price) AS total_amount
    FROM 
        shopping_cart_items s
    INNER JOIN 
        shopping_cart c ON s.cart_id = c.cart_id
    INNER JOIN 
        menu_item m ON s.menu_item_id = m.menu_item_id
    INNER JOIN 
        orders o ON c.customer_id = o.customer_id
    GROUP BY 
        c.customer_id, o.order_id
)
UPDATE orders o
SET 
    order_date = u.order_date,
    description = CONCAT('You ordered for: ', u.description),
    total_amount = u.total_amount
FROM 
    updated_orders u
WHERE 
    o.order_id = u.order_id;

select * from orders;


-- Insert order items into order-items table
-- step 1: create a cte that selects from shopping_cart_items and perform joins to get customer_id and menu_item_name
-- quantity and unit price
 WITH order_items AS
 (
 SELECT 
        sc.customer_id
        ,o.order_id
        ,o.customer_id
        ,sc.cart_id
        ,s.menu_item_id
        ,s.price
        ,m.description AS menu_description
--        , (select count (menu_item_id) from shopping_cart_items scp where s.menu_item_id = scp.menu_item_id ) quantity -- Adding quantity to calculate the total price for each item
 FROM shopping_cart_items s
  	INNER JOIN shopping_cart sc 
    	USING (cart_id) 
    INNER JOIN menu_item m
    	USING (menu_item_id)
  	inner join orders o 
 		USING (customer_id)
 ), 
 order_items_count AS 
(
SELECT 
    order_id
    --, cart_id
    , menu_item_id
    , COUNT (menu_item_id) AS quantity -- each order item corresponds to one menu item
    , MAX (price) AS unit_price -- get the unit price since there is only one price for each menu item
    , menu_description AS menu_details
FROM order_items
GROUP BY menu_item_id, order_id, cart_id, menu_description
)
-- insert into order_items table
INSERT INTO order_item (order_id, menu_item_id, quantity, unit_price, menu_details)
SELECT * 
FROM order_items_count
RETURNING *
;

