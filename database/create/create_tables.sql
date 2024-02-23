-- CREATING  CUSTOMERS
CREATE TABLE IF NOT EXISTS customer (
	 customer_id SERIAL PRIMARY KEY
	, first_name VARCHAR (50) NOT NULL
	, last_name VARCHAR (50) NOT NULL
	, phone VARCHAR (20) NOT NULL
	, email VARCHAR (50) 
);
-- CREATING delivery Address
CREATE TABLE IF NOT EXISTS delivery_address (
	delivery_address_id SERIAL PRIMARY KEY
	, customer_id int
	, address_type VARCHAR (50)
	, city VARCHAR (50)
	, province VARCHAR (50)
	, street VARCHAR (50)
	, postal_code CHAR (6)
	, CONSTRAINT fkey_customer FOREIGN KEY (customer_id) REFERENCES customer(customer_id)	
);
ALTER TABLE delivery_address
ALTER COLUMN customer_id SET NOT NULL,
ALTER COLUMN address_type SET NOT NULL,
ALTER COLUMN city SET NOT NULL,
ALTER COLUMN province SET NOT NULL,
ALTER COLUMN street SET NOT NULL,
ALTER COLUMN postal_code SET NOT NULL;

ALTER TABLE delivery_address 
ALTER COLUMN postal_code TYPE VARCHAR (20) ;


-- DETLIVERY DETAILS
CREATE TABLE IF NOT EXISTS delivery_details (
	delivery_id serial PRIMARY KEY
	, delivery_address_id INT NOT NULL
	, order_id INT NOT NULL
	, customer_id INT NOT NULL
	, delivery_status VARCHAR (50) NOT NULL
	, delivery_date DATE NOT NULL
	, CONSTRAINT fkey_delivery_address FOREIGN KEY (delivery_address_id) REFERENCES delivery_address(delivery_address_id)
	, CONSTRAINT fkey_order FOREIGN KEY (order_id) REFERENCES orders(order_id)
	, CONSTRAINT fkey_customer FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
	);
ALTER TABLE delivery_details 
ALTER COLUMN delivery_date TYPE TIMESTAMP;


-- shopping cart
CREATE TABLE IF NOT EXISTS shopping_cart (
    cart_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL, 
    CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);
-- shopping cart items
CREATE TABLE IF NOT EXISTS shopping_cart_items (
    cart_item_id SERIAL PRIMARY KEY
    ,cart_id INT NOT NULL
    ,menu_item_id INT NOT NULL
    ,quantity INT NOT NULL
    ,price DECIMAL(10, 2) NOT NULL
    ,CONSTRAINT fk_cart_id FOREIGN KEY (cart_id) REFERENCES shopping_cart(cart_id)
    ,CONSTRAINT fk_menu_item FOREIGN KEY (menu_item_id) REFERENCES menu_item(menu_item_id)
    ,CONSTRAINT chk_quantity_positive CHECK (quantity > 0)
    ,CONSTRAINT chk_price_positive CHECK (price > 0) 
);
ALTER TABLE shopping_cart_items 
DROP COLUMN quantity;

-- order table
CREATE TABLE IF NOT EXISTS orders (
order_id serial PRIMARY KEY
, customer_id INT NOT NULL
, order_date DATE NOT NULL
, description VARCHAR (255) NOT NULL
, total_amount DECIMAL(10,2) NOT NULL
,CONSTRAINT fkey_customer_id FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);
-- adding price check constraint to orders
ALTER TABLE orders
ADD CONSTRAINT chk_price_positive CHECK (total_amount > 0);

ALTER TABLE orders 
ALTER COLUMN order_date TYPE TIMESTAMP;

--- order items
CREATE TABLE IF NOT EXISTS order_item (
    order_item serial PRIMARY KEY
    , order_id INT NOT NULL
    , menu_item_id INT NOT NULL
    , quantity INT NOT NULL
    , price DECIMAL(10, 2) NOT NULL
    ,CONSTRAINT fkey_order FOREIGN KEY (order_id) REFERENCES orders(order_id)
    ,CONSTRAINT fkey_menu_item FOREIGN KEY (menu_item_id) REFERENCES menu_item(menu_item_id)
);
-- adding price check constraint to order items
ALTER TABLE order_item
ADD CONSTRAINT chk_price_positive CHECK (price > 0);
ALTER TABLE order_item
ADD CONSTRAINT chk_qty_positive CHECK (quantity > 0);
ALTER TABLE order_item
RENAME COLUMN price TO unit_price;
ALTER TABLE order_item
ADD COLUMN menu_details VARCHAR(255);

-- promotion
CREATE TABLE IF NOT EXISTS promotion (
    promo_code CHAR(6) PRIMARY KEY
    ,discount DECIMAL(5, 2) NOT NULL
    ,begin_date DATE NOT NULL
    ,end_date DATE NOT NULL
    ,CONSTRAINT check_discount_range CHECK (discount >= 0 AND discount <= 100)
);
-- alter promotion date field to timestamps
ALTER TABLE promotion 
ALTER COLUMN begin_date TYPE TIMESTAMP;
ALTER TABLE promotion 
ALTER COLUMN end_date TYPE TIMESTAMP;

-- MENU CATEGORY
CREATE TABLE IF NOT EXISTS menu_category (
    category_id SERIAL PRIMARY KEY
    ,name VARCHAR(50) NOT NULL
    ,description VARCHAR(255) NOT NULL
);

-- menu
CREATE TABLE IF NOT EXISTS menu_item (
menu_item_id serial PRIMARY KEY
, name VARCHAR (50) NOT NULL
, description VARCHAR (255) NOT NULL
, price DECIMAL(10,2) NOT NULL
, availability BOOL NOT NULL
, promo_code CHAR(6) NULL
, CONSTRAINT fkey_promotion FOREIGN KEY (promo_code) REFERENCES promotion(promo_code)
);
-- adding orice check constraint to menu items
ALTER TABLE menu_item
ADD CONSTRAINT chk_price_positive CHECK (price > 0);

-- add a foreign key column ot the menu_item entity and add column constraint
ALTER TABLE menu_item
ADD COLUMN category_id INT NOT NULL,
ADD CONSTRAINT fkey_category FOREIGN KEY (category_id) REFERENCES menu_category(category_id); 

-- ingredients
CREATE TABLE IF NOT EXISTS ingredients (
    ingredients_id SERIAL PRIMARY KEY
    ,name VARCHAR(50) NOT NULL
    ,total_quantity INT NOT NULL
    ,available_quantity INT NOT NULL 
    ,unit VARCHAR(20) NOT NULL
    ,cost_per_unit DECIMAL(10, 2) NOT NULL
    ,availability BOOL NOT NULL 
);

-- composite ingredients

CREATE TABLE IF NOT EXISTS composite_menu_ingredients (
    ingredients_id INT NOT NULL
    ,menu_item_id INT NOT NULL
    ,quantity INT NOT NULL
    ,CONSTRAINT pkey_menu_ingredients PRIMARY KEY (ingredients_id, menu_item_id)
    ,CONSTRAINT fkey_ingredients FOREIGN KEY (ingredients_id) REFERENCES ingredients(ingredients_id)
    ,CONSTRAINT fkey_menu_item FOREIGN KEY (menu_item_id) REFERENCES menu_item(menu_item_id)
);

-- purchases table
CREATE TABLE IF NOT EXISTS purchases 
(
	purchase_id serial PRIMARY KEY
	,order_id INT NOT NULL
	,customer_id INT NOT NULL
	,payment_date TIMESTAMP NOT NULL
	,quantity_purchased INT NOT NULL 
	,total_order_amount DECIMAL(10,2) NOT NULL
	,discount_applied DECIMAL (10,2)
	,discount_price DECIMAL (10,2)
	,total_hst DECIMAL(10,2) NOT NULL
	,payment_amount DECIMAL(10,2) NOT NULL
	,CONSTRAINT Fkey_customer FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
	,CONSTRAINT Fkey_orders FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
-- add a check constraint to purchases
ALTER TABLE purchases
ADD CONSTRAINT chk_price_positive CHECK (total_order_amount > 0);

-- payment table
CREATE TABLE IF NOT EXISTS payment_details (
	payment_id serial PRIMARY KEY
	,customer_id INT NOT NULL
	,order_id INT NOT NULL
	,total_amount DECIMAL(10,2)
	,payment_method VARCHAR (50)
	,payment_date TIMESTAMP NOT NULL
	,CONSTRAINT Fkey_customer FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
	,CONSTRAINT Fkey_orders FOREIGN KEY (order_id) REFERENCES orders(order_id)
)
-- add a check constraint to payment details
ALTER TABLE payment_details
ADD CONSTRAINT chk_price_positive CHECK (total_amount > 0);

