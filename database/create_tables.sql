-- Customers
CREATE TABLE IF NOT EXISTS customer (
	 customer_id SERIAL PRIMARY KEY
	, first_name VARCHAR (50) NOT NULL
	, last_name VARCHAR (50) NOT NULL
	, phone VARCHAR (20) NOT NULL
	, email VARCHAR (50) 
);
-- delivery Address
CREATE TABLE IF NOT EXISTS delivery_address (
    delivery_address_id SERIAL PRIMARY KEY NOT NULL
    , customer_id int NOT NULL
    , address_type VARCHAR (50) NOT NULL
    , city VARCHAR (50) NOT NULL
    , province VARCHAR (50) NOT NULL
    , street VARCHAR (50) NOT NULL
    , postal_code CHAR (6) NOT NULL
    , CONSTRAINT fkey_customer FOREIGN KEY (customer_id) REFERENCES customer(customer_id)	
);
-- delivery details
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

-- shopping cart
CREATE TABLE IF NOT EXISTS shopping_cart (
    cart_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL, 
    CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

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

-- orders table
CREATE TABLE IF NOT EXISTS orders (
    order_id serial PRIMARY KEY
    , customer_id INT NOT NULL
    , order_date DATE NOT NULL
    , description VARCHAR (255) NOT NULL
    , total_amount DECIMAL(10,2) NOT NULL
    ,CONSTRAINT fkey_customer_id FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

ALTER TABLE orders
ADD CONSTRAINT chk_price_positive CHECK (total_amount > 0);



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
-- adding orice check constraint to order items
ALTER TABLE order_item
ADD CONSTRAINT chk_price_positive CHECK (price > 0);
ALTER TABLE order_item
ADD CONSTRAINT chk_qty_positive CHECK (quantity > 0);


-- promotion
CREATE TABLE IF NOT EXISTS promotion (
    promo_code CHAR(6) PRIMARY KEY
    ,discount DECIMAL(5, 2) NOT NULL
    ,begin_date DATE NOT NULL
    ,end_date DATE NOT NULL
    ,CONSTRAINT check_discount_range CHECK (discount >= 0 AND discount <= 100)
);
-- menu
CREATE TABLE IF NOT EXISTS menu_item (
    menu_item_id serial PRIMARY KEY
    , name VARCHAR (50) NOT NULL
    , description VARCHAR (255) NOT NULL
    , price DECIMAL(10,2) NOT NULL
    , availability bool NOT NULL
    , promo_code CHAR(6) NULL
    , CONSTRAINT fkey_promotion FOREIGN KEY (promo_code) REFERENCES promotion(promo_code)
);
-- adding orice check constraint to menu items
ALTER TABLE menu_item
ADD CONSTRAINT chk_price_positive CHECK (price > 0);

-- ingredients

CREATE TABLE IF NOT EXISTS ingredients (
    ingredients_id SERIAL PRIMARY KEY
    ,name VARCHAR(50) NOT NULL
    ,total_quantity INT NOT NULL
    ,available_quantity INT NOT NULL
    ,unit VARCHAR(20) NOT NULL
    ,cost_per_unit DECIMAL(10, 2) NOT NULL,
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
