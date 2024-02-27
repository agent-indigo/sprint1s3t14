-- Insert 10 distinct records into the employee table
INSERT INTO employee (manager_id, address_id, first_name, last_name, role, hire_date, salary, employment_status, termination_date, termination_reason, street, city, province, postal_code)
VALUES

    -- today
    (NULL, 1, 'James', 'Doe', 'Manager', now(), 50000.00, 'active', NULL, NULL, '123 Main St', 'St. John''s', 'NL', 'A1B 2C3'),
    (NULL, 2, 'Jimmy', 'Smith', 'Manager', now(), 55000.00, 'active', NULL, NULL, '456 Elm St', 'Mt. Pearl', 'NL', 'X1Y 2Z3'),
    (3, 3, 'Albert', 'Johnson', 'Sales Associate', now(), 40000.00, 'active', NULL, NULL, '123 Main St', 'Paradise', 'NL', 'A1B 2C3'),
    (4, 4, 'Bobby', 'Smitzer', 'Cashier', now(), 35000.00, 'active', NULL, NULL, '123 Main St', 'St. John''s', 'NL', 'A1B 2C3'),
    (5, 5, 'Emmanuel', 'Doney', 'Sales Associate', now(), 38000.00, 'active', NULL, NULL, '456 Elm St', 'Paradise', 'NL', 'X1Y 2Z3'),
    -- Last week

    (NULL, 1, 'Jane', 'Doe', 'Manager', now() - INTERVAL '1 WEEK', 50000.00, 'active', NULL, NULL, '123 Main St', 'St. John''s', 'NL', 'A1B 2C3'),
    (NULL, 2, 'Jane', 'Smith', 'Manager', now() - INTERVAL '1 WEEK', 55000.00, 'active', NULL, NULL, '456 Elm St', 'Mt. Pearl', 'NL', 'X1Y 2Z3'),
    (3, 3, 'Alice', 'Johnson', 'Sales Associate', now() - INTERVAL '1 WEEK', 40000.00, 'active', NULL, NULL, '123 Main St', 'Paradise', 'NL', 'A1B 2C3'),
    (4, 4, 'Bob', 'Smith', 'Cashier', now() - INTERVAL '1 WEEK', 35000.00, 'active', NULL, NULL, '123 Main St', 'St. John''s', 'NL', 'A1B 2C3'),
    (5, 5, 'Emma', 'Davis', 'Sales Associate', now() - INTERVAL '1 WEEK', 38000.00, 'active', NULL, NULL, '456 Elm St', 'Paradise', 'NL', 'X1Y 2Z3'),
    -- A month ago
    (6, 6, 'Michael', 'Brown', 'Cashier', now() - INTERVAL '1 MONTH', 36000.00, 'active', NULL, NULL, '789 Oak St', 'Conception Bay St.', 'NL', 'Y3Z 4X1'),
    (7, 7, 'David', 'Wilson', 'Cashier', now() - INTERVAL '1 MONTH', 35000.00, 'active', NULL, NULL, '890 Maple St', 'St. Anthony', 'NL', 'A1B 2C3'),
    (8, 8, 'Jennifer', 'Clark', 'Sales Associate', now() - INTERVAL '1 MONTH', 42000.00, 'active', NULL, NULL, '567 Pine St', 'Mt. Pearl', 'NL', 'Y3Z 4X1'),
    (9, 9, 'William', 'Martinez', 'Cashier', now() - INTERVAL '1 MONTH', 37000.00, 'active', NULL, NULL, '890 Maple St', 'Mt. Pearl', 'NL', 'A1B 2C3'),
    (10, 10, 'Laura', 'Garcia', 'Store Standard Associate', now() - INTERVAL '1 MONTH', 38000.00, 'active', NULL, NULL, '123 Elm St', 'Goulds', 'NL', 'Y3Z 4X1'),
    -- Yesterday
    (NULL, 11, 'John', 'Smith', 'Manager', now() - INTERVAL '1 DAY', 55000.00, 'active', NULL, NULL, '456 Elm St', 'Mt. Pearl', 'NL', 'X1Y 2Z3'),
    (12, 12, 'Emma', 'Johnson', 'Sales Associate', now() - INTERVAL '1 DAY', 40000.00, 'active', NULL, NULL, '123 Main St', 'Paradise', 'NL', 'A1B 2C3'),
    (13, 13, 'Michael', 'Brown', 'Cashier', now() - INTERVAL '1 DAY', 36000.00, 'active', NULL, NULL, '789 Oak St', 'Conception Bay St.', 'NL', 'Y3Z 4X1'),
    (14, 14, 'David', 'Wilson', 'Cashier', now() - INTERVAL '1 DAY', 35000.00, 'active', NULL, NULL, '890 Maple St', 'St. Anthony', 'NL', 'A1B 2C3'),
    (15, 15, 'Jennifer', 'Clark', 'Sales Associate', now() - INTERVAL '1 DAY', 42000.00, 'active', NULL, NULL, '567 Pine St', 'Mt. Pearl', 'NL', 'Y3Z 4X1');

-- insert data into ingredients table
INSERT INTO ingredients (name, total_quantity, available_quantity, unit, cost_per_unit, availability)
VALUES 
    ('Vegetable Oil', 50, 50, 'liters', 1.99, true),
    ('Potatoes', 100, 100, 'lbs', 0.99, true),
    ('Cod Fillets', 30, 30, 'lbs', 7.99, true),
    ('Shrimp', 30, 30, 'lbs', 12.99, true),
    ('Calamari Rings', 25, 25, 'lbs', 9.99, true),
    ('Crab Cakes', 20, 20, 'pcs', 5.99, true),
    ('Lobster Tails', 15, 15, 'pcs', 22.99, true),
    ('Tortillas', 50, 50, 'packs', 1.49, true),
    ('Rice', 40, 40, 'kg', 2.49, true),
    ('Beans', 30, 30, 'kg', 1.99, true),
    ('Cheese Curds', 20, 20, 'lbs', 6.99, true),
    ('Gravy Mix', 40, 40, 'packs', 0.79, true)
ON CONFLICT (name) DO NOTHING -- on conflict abort insertion
RETURNING *;
-- adding more ingredients
INSERT INTO ingredients (name, total_quantity, available_quantity, unit, cost_per_unit, availability)
VALUES 
    ('Lettuce', 100, 100, 'unit', 0.0, true),
    ('Tomato', 80, 80, 'unit', 0.0, true),
    ('Salsa', 50, 50, 'unit', 0.0, true),
    ('Fries', 200, 200, 'unit', 0.0, true),
    ('Fried Clam Strips', 150, 150, 'unit', 0.0, true),
    ('Clams', 120, 120, 'unit', 0.0, true),
    ('Mussels', 130, 130, 'unit', 0.0, true),
    ('Corn', 100, 100, 'unit', 0.0, true),
    ('Mashed Potatoes', 100, 100, 'unit', 0.0, true),
    ('Seasonal Vegetables', 100, 100, 'unit', 0.0, true),
    ('Crab Meat', 90, 90, 'unit', 0.0, true),
    ('Vegetable Stock', 80, 80, 'unit', 0.0, true),
    ('Marinara Sauce', 60, 60, 'unit', 0.0, true),
    ('Coconut Flakes', 70, 70, 'unit', 0.0, true),
    ('Sweet Chili Sauce', 40, 40, 'unit', 0.0, true),
    ('Oysters', 80, 80, 'unit', 0.0, true),
    ('Breadcrumbs', 100, 100, 'unit', 0.0, true),
    ('Cocktail Sauce', 60, 60, 'unit', 0.0, true),
    ('Tartar Sauce', 70, 70, 'unit', 0.0, true),
    ('French Baguette', 120, 120, 'unit', 0.0, true),
    ('Remoulade Sauce', 50, 50, 'unit', 0.0, true),
    ('Buttered Toast', 100, 100, 'unit', 0.0, true),
    ('Tuna Salad', 70, 70, 'unit', 0.0, true),
    ('Cheddar Cheese', 100, 100, 'unit', 0.0, true),
    ('Grilled Bread', 80, 80, 'unit', 0.0, true),
    ('Garlic Bread', 70, 70, 'unit', 0.0, true),
    ('Vegetables', 100, 100, 'unit', 0.0, true),
    ('Rice Pilaf', 90, 90, 'unit', 0.0, true)
ON CONFLICT (name) DO NOTHING -- on conflict abort insertion meaning name already exist
RETURNING *;
-- insert into menu_category table
INSERT INTO menu_category (name, description)
VALUES 
    ('Fish and Chips', 'Classic fish and chips served with fries and tartar sauce.'),
    ('Seafood Platters', 'Assorted seafood platters featuring shrimp, calamari, and fish.'),
    ('Fried Seafood Specials', 'Specialty fried seafood items like crispy calamari and shrimp.'),
    ('Seafood Sandwiches', 'Delicious seafood sandwiches served on fresh bread with lettuce and tomato.'),
    ('Seafood Combos', 'Combination seafood meals featuring a variety of fried and grilled options.');

-- insert into promotion table

INSERT INTO promotion (promo_code, discount, begin_date, end_date) VALUES 
('PROMO1', 10.00, now(), now() + INTERVAL '1 WEEK'),
('PROMO2', 15.00, now(), now() + INTERVAL '1 MONTH'),
('PROMO3', 20.00, now(), now() + INTERVAL '2 WEEKS'),
('PROMO4', 25.00, now(), now() + INTERVAL '3 WEEKS'),
('PROMO5', 30.00, now(), now() + INTERVAL '1 MONTH');

-- insert into menu_item table
INSERT INTO menu_item (name, description, price, availability, category_id)
 VALUES 
    ('Classic Fish and Chips', 'Beer-battered cod served with fries and tartar sauce.', 10.99, true, 1),
    ('Fisherman''s Platter', 'Assorted fried seafood including fish, shrimp, and calamari.', 15.99, true, 1),
    ('Shrimp Basket', 'Crispy fried shrimp served with coleslaw and fries.', 12.99, true, 1),
    ('Fish Taco Plate', 'Grilled fish tacos served with rice, beans, and salsa.', 11.99, true, 1),
    ('Seafood Poutine', 'Fries topped with cheese curds, gravy, and fried clam strips.', 9.99, true, 1),

    -- Seafood Platters

    ('Seafood Sampler', 'Sampler platter featuring shrimp, calamari, and crab cakes.', 18.99, true, 2),
    ('Seafood Feast', 'A feast of grilled lobster, shrimp, and scallops served with garlic butter.', 25.99, true, 2),
    ('Clam Bake', 'Traditional clam bake featuring clams, mussels, corn, and potatoes.', 22.99, true, 2),
    ('Lobster Tail Dinner', 'Grilled lobster tail served with mashed potatoes and seasonal vegetables.', 29.99, true, 2),
    ('Seafood Risotto', 'Creamy risotto with shrimp, scallops, and crab meat.', 20.99, true, 2),

    -- Fried Seafood Specials

    ('Crispy Calamari', 'Golden-fried calamari rings served with marinara sauce.', 8.99, true, 3),
    ('Coconut Shrimp', 'Coconut-crusted shrimp served with sweet chili sauce.', 10.99, true, 3),
    ('Fried Oysters', 'Breaded and fried oysters served with cocktail sauce.', 12.99, true, 3),
    ('Fish Bites', 'Bite-sized pieces of fried fish served with tartar sauce.', 9.99, true, 3),
    ('Popcorn Shrimp', 'Popcorn-sized shrimp breaded and fried to perfection.', 7.99, true, 3),

    -- Seafood Sandwiches

    ('Shrimp Po'' Boy', 'Classic po'' boy sandwich filled with crispy fried shrimp and remoulade sauce.', 11.99, true, 4),
    ('Crab Cake Sandwich', 'Delicious crab cake sandwich served with lettuce, tomato, and tartar sauce.', 13.99, true, 4),
    ('Grilled Fish Sandwich', 'Grilled fish fillet served on a toasted bun with coleslaw and tartar sauce.', 10.99, true, 4),
    ('Lobster Roll', 'New England-style lobster roll served with buttered toast.', 15.99, true, 4),
    ('Tuna Melt', 'Tuna salad sandwich topped with melted cheddar cheese and served on grilled bread.', 9.99, true, 4),

    -- Seafood Combos

    ('Seafood Platter Combo', 'Choose two seafood platters and a side dish.', 29.99, true, 5),
    ('Surf and Turf Combo', 'A combination of grilled steak and shrimp served with mashed potatoes.', 24.99, true, 5),
    ('Fish and Shrimp Combo', 'Combo featuring a fish fillet and fried shrimp.', 18.99, true, 5),
    ('Seafood Pasta Combo', 'Pasta dish with shrimp, scallops, and crab meat served with garlic bread.', 21.99, true, 5),
    ('Seafood Skewers Combo', 'Grilled skewers with shrimp, scallops, and vegetables served with rice pilaf.', 23.99, true, 5)
   	ON CONFLICT (name) DO NOTHING -- on conflict abort insertion
	RETURNING *;
   
   -- Update menu items with promo codes for menu's on promotion
UPDATE menu_item
SET promo_code = 
    CASE name
        WHEN 'Classic Fish and Chips' THEN 'PROMO1'
        WHEN 'Fisherman''s Platter' THEN 'PROMO2'
        WHEN 'Seafood Sampler' THEN 'PROMO3'
        WHEN 'Seafood Feast' THEN 'PROMO4'
        WHEN 'Crispy Calamari' THEN 'PROMO5'
        WHEN 'Shrimp Po'' Boy' THEN 'PROMO4'
        WHEN 'Seafood Platter Combo' THEN 'PROMO2'
        ELSE NULL
    END
WHERE category_id IN (1, 2, 3, 4, 5);

-- insert into composite_menu_ingredients table
--- Insert into composite ingredients and menu

-- Insert statements for Classic Fish and Chips
INSERT INTO composite_menu_ingredients (ingredients_id, menu_item_id, quantity)
VALUES 
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Cod Fillets'), (SELECT menu_item_id FROM menu_item WHERE name = 'Classic Fish and Chips'), 1),
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Potatoes'), (SELECT menu_item_id FROM menu_item WHERE name = 'Classic Fish and Chips'), 0.5),
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Vegetable Oil'), (SELECT menu_item_id FROM menu_item WHERE name = 'Classic Fish and Chips'), 0.5)
ON CONFLICT DO NOTHING
RETURNING *;

-- Insert statements for Fisherman's Platter
INSERT INTO composite_menu_ingredients (ingredients_id, menu_item_id, quantity)
VALUES 
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Cod Fillets'), (SELECT menu_item_id FROM menu_item WHERE name = 'Fisherman''s Platter'), 1),
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Shrimp'), (SELECT menu_item_id FROM menu_item WHERE name = 'Fisherman''s Platter'), 1),
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Calamari Rings'), (SELECT menu_item_id FROM menu_item WHERE name = 'Fisherman''s Platter'), 1)
ON CONFLICT DO NOTHING
RETURNING *;

-- Insert statements for Shrimp Basket
INSERT INTO composite_menu_ingredients (ingredients_id, menu_item_id, quantity)
VALUES 
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Shrimp'), (SELECT menu_item_id FROM menu_item WHERE name = 'Shrimp Basket'), 1),
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Potatoes'), (SELECT menu_item_id FROM menu_item WHERE name = 'Shrimp Basket'), 0.5),
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Vegetable Oil'), (SELECT menu_item_id FROM menu_item WHERE name = 'Shrimp Basket'), 0.5)
ON CONFLICT DO NOTHING
RETURNING *;

-- Insert statements for Fish Taco Plate
INSERT INTO composite_menu_ingredients (ingredients_id, menu_item_id, quantity)
VALUES 
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Cod Fillets'), (SELECT menu_item_id FROM menu_item WHERE name = 'Fish Taco Plate'), 1),
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Tortillas'), (SELECT menu_item_id FROM menu_item WHERE name = 'Fish Taco Plate'), 2),
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Lettuce'), (SELECT menu_item_id FROM menu_item WHERE name = 'Fish Taco Plate'), 1),
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Tomato'), (SELECT menu_item_id FROM menu_item WHERE name = 'Fish Taco Plate'), 1),
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Salsa'), (SELECT menu_item_id FROM menu_item WHERE name = 'Fish Taco Plate'), 1)
ON CONFLICT DO nothing 
RETURNING *;

-- Insert statements for Seafood Poutine
INSERT INTO composite_menu_ingredients (ingredients_id, menu_item_id, quantity)
VALUES 
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Fries'), (SELECT menu_item_id FROM menu_item WHERE name = 'Seafood Poutine'), 1),
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Cheese Curds'), (SELECT menu_item_id FROM menu_item WHERE name = 'Seafood Poutine'), 1),
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Gravy Mix'), (SELECT menu_item_id FROM menu_item WHERE name = 'Seafood Poutine'), 1),
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Fried Clam Strips'), (SELECT menu_item_id FROM menu_item WHERE name = 'Seafood Poutine'), 1)
ON CONFLICT DO NOTHING
RETURNING *;

-- Insert statements for Seafood Sampler
INSERT INTO composite_menu_ingredients (ingredients_id, menu_item_id, quantity)
VALUES 
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Shrimp'), (SELECT menu_item_id FROM menu_item WHERE name = 'Seafood Sampler'), 1),
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Calamari Rings'), (SELECT menu_item_id FROM menu_item WHERE name = 'Seafood Sampler'), 1),
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Crab Cakes'), (SELECT menu_item_id FROM menu_item WHERE name = 'Seafood Sampler'), 1)
--    ((SELECT ingredients_id FROM ingredients WHERE name = 'Fried Oysters'), (SELECT menu_item_id FROM menu_item WHERE name = 'Seafood Sampler'), 1)
ON CONFLICT DO NOTHING
RETURNING *;


-- Insert statements for Seafood Feast
INSERT INTO composite_menu_ingredients (ingredients_id, menu_item_id, quantity)
VALUES 
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Lobster Tails'), (SELECT menu_item_id FROM menu_item WHERE name = 'Seafood Feast'), 1),
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Shrimp'), (SELECT menu_item_id FROM menu_item WHERE name = 'Seafood Feast'), 1)
--    ((SELECT ingredients_id FROM ingredients WHERE name = 'Scallops'), (SELECT menu_item_id FROM menu_item WHERE name = 'Seafood Feast'), 1)
--    ((SELECT ingredients_id FROM ingredients WHERE name = 'Garlic Butter'), (SELECT menu_item_id FROM menu_item WHERE name = 'Seafood Feast'), 0.2)
ON CONFLICT DO NOTHING;

-- Insert statements for Clam Bake
INSERT INTO composite_menu_ingredients (ingredients_id, menu_item_id, quantity)
VALUES 
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Clams'), (SELECT menu_item_id FROM menu_item WHERE name = 'Clam Bake'), 3),
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Mussels'), (SELECT menu_item_id FROM menu_item WHERE name = 'Clam Bake'), 3),
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Corn'), (SELECT menu_item_id FROM menu_item WHERE name = 'Clam Bake'), 2),
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Potatoes'), (SELECT menu_item_id FROM menu_item WHERE name = 'Clam Bake'), 2)
ON CONFLICT DO NOTHING;

-- Insert statements for Lobster Tail Dinner
INSERT INTO composite_menu_ingredients (ingredients_id, menu_item_id, quantity)
VALUES 
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Lobster Tails'), (SELECT menu_item_id FROM menu_item WHERE name = 'Lobster Tail Dinner'), 1),
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Mashed Potatoes'), (SELECT menu_item_id FROM menu_item WHERE name = 'Lobster Tail Dinner'), 1),
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Seasonal Vegetables'), (SELECT menu_item_id FROM menu_item WHERE name = 'Lobster Tail Dinner'), 1)
ON CONFLICT DO NOTHING;

-- Insert statements for Seafood Risotto
INSERT INTO composite_menu_ingredients (ingredients_id, menu_item_id, quantity)
VALUES 
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Rice'), (SELECT menu_item_id FROM menu_item WHERE name = 'Seafood Risotto'), 1),
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Shrimp'), (SELECT menu_item_id FROM menu_item WHERE name = 'Seafood Risotto'), 1),
--    ((SELECT ingredients_id FROM ingredients WHERE name = 'Scallops'), (SELECT menu_item_id FROM menu_item WHERE name = 'Seafood Risotto'), 1),
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Crab Meat'), (SELECT menu_item_id FROM menu_item WHERE name = 'Seafood Risotto'), 1),
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Vegetable Stock'), (SELECT menu_item_id FROM menu_item WHERE name = 'Seafood Risotto'), 0.2)
ON CONFLICT DO NOTHING;

-- Insert statements for Crispy Calamari
INSERT INTO composite_menu_ingredients (ingredients_id, menu_item_id, quantity)
VALUES 
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Calamari Rings'), (SELECT menu_item_id FROM menu_item WHERE name = 'Crispy Calamari'), 1),
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Marinara Sauce'), (SELECT menu_item_id FROM menu_item WHERE name = 'Crispy Calamari'), 1)
ON CONFLICT DO NOTHING;

-- Insert statements for Coconut Shrimp
INSERT INTO composite_menu_ingredients (ingredients_id, menu_item_id, quantity)
VALUES 
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Shrimp'), (SELECT menu_item_id FROM menu_item WHERE name = 'Coconut Shrimp'), 1),
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Coconut Flakes'), (SELECT menu_item_id FROM menu_item WHERE name = 'Coconut Shrimp'), 1),
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Sweet Chili Sauce'), (SELECT menu_item_id FROM menu_item WHERE name = 'Coconut Shrimp'), 1)
ON CONFLICT DO NOTHING;

-- Insert statements for Fried Oysters
INSERT INTO composite_menu_ingredients (ingredients_id, menu_item_id, quantity)
VALUES 
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Oysters'), (SELECT menu_item_id FROM menu_item WHERE name = 'Fried Oysters'), 1),
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Breadcrumbs'), (SELECT menu_item_id FROM menu_item WHERE name = 'Fried Oysters'), 1),
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Cocktail Sauce'), (SELECT menu_item_id FROM menu_item WHERE name = 'Fried Oysters'), 1)
ON CONFLICT DO NOTHING;

-- Insert statements for Fish Bites
INSERT INTO composite_menu_ingredients (ingredients_id, menu_item_id, quantity)
VALUES 
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Cod Fillets'), (SELECT menu_item_id FROM menu_item WHERE name = 'Fish Bites'), 1),
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Tartar Sauce'), (SELECT menu_item_id FROM menu_item WHERE name = 'Fish Bites'), 1)
ON CONFLICT DO NOTHING;

-- Insert statements for Popcorn Shrimp
INSERT INTO composite_menu_ingredients (ingredients_id, menu_item_id, quantity)
VALUES 
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Shrimp'), (SELECT menu_item_id FROM menu_item WHERE name = 'Popcorn Shrimp'), 1),
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Tartar Sauce'), (SELECT menu_item_id FROM menu_item WHERE name = 'Popcorn Shrimp'), 1)
ON CONFLICT DO NOTHING;

-- Insert statements for Shrimp Po' Boy
INSERT INTO composite_menu_ingredients (ingredients_id, menu_item_id, quantity)
VALUES 
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Shrimp'), (SELECT menu_item_id FROM menu_item WHERE name = 'Shrimp Po'' Boy'), 1),
    ((SELECT ingredients_id FROM ingredients WHERE name = 'French Baguette'), (SELECT menu_item_id FROM menu_item WHERE name = 'Shrimp Po'' Boy'), 1),
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Remoulade Sauce'), (SELECT menu_item_id FROM menu_item WHERE name = 'Shrimp Po'' Boy'), 1)
ON CONFLICT DO NOTHING;

-- Insert statements for Crab Cake Sandwich
INSERT INTO composite_menu_ingredients (ingredients_id, menu_item_id, quantity)
VALUES 
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Crab Cakes'), (SELECT menu_item_id FROM menu_item WHERE name = 'Crab Cake Sandwich'), 1),
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Lettuce'), (SELECT menu_item_id FROM menu_item WHERE name = 'Crab Cake Sandwich'), 1),
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Tomato'), (SELECT menu_item_id FROM menu_item WHERE name = 'Crab Cake Sandwich'), 1),
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Tartar Sauce'), (SELECT menu_item_id FROM menu_item WHERE name = 'Crab Cake Sandwich'), 1)
ON CONFLICT DO NOTHING;

-- Insert statements for Grilled Fish Sandwich
INSERT INTO composite_menu_ingredients (ingredients_id, menu_item_id, quantity)
VALUES 
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Cod Fillets'), (SELECT menu_item_id FROM menu_item WHERE name = 'Grilled Fish Sandwich'), 1),
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Lettuce'), (SELECT menu_item_id FROM menu_item WHERE name = 'Grilled Fish Sandwich'), 1),
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Tomato'), (SELECT menu_item_id FROM menu_item WHERE name = 'Grilled Fish Sandwich'), 1),
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Tartar Sauce'), (SELECT menu_item_id FROM menu_item WHERE name = 'Grilled Fish Sandwich'), 1)
ON CONFLICT DO NOTHING;

-- Insert statements for Lobster Roll
INSERT INTO composite_menu_ingredients (ingredients_id, menu_item_id, quantity)
VALUES 
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Lobster Tails'), (SELECT menu_item_id FROM menu_item WHERE name = 'Lobster Roll'), 1),
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Buttered Toast'), (SELECT menu_item_id FROM menu_item WHERE name = 'Lobster Roll'), 1)
ON CONFLICT DO NOTHING;

-- Insert statements for Tuna Melt
INSERT INTO composite_menu_ingredients (ingredients_id, menu_item_id, quantity)
VALUES 
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Tuna Salad'), (SELECT menu_item_id FROM menu_item WHERE name = 'Tuna Melt'), 1),
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Cheddar Cheese'), (SELECT menu_item_id FROM menu_item WHERE name = 'Tuna Melt'), 1),
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Grilled Bread'), (SELECT menu_item_id FROM menu_item WHERE name = 'Tuna Melt'), 1)
ON CONFLICT DO NOTHING;

-- Insert statements for Seafood Platter Combo
INSERT INTO composite_menu_ingredients (ingredients_id, menu_item_id, quantity)
VALUES 
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Cod Fillets'), (SELECT menu_item_id FROM menu_item WHERE name = 'Seafood Platter Combo'), 1),
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Shrimp'), (SELECT menu_item_id FROM menu_item WHERE name = 'Seafood Platter Combo'), 1),
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Lobster Tails'), (SELECT menu_item_id FROM menu_item WHERE name = 'Seafood Platter Combo'), 1),
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Potatoes'), (SELECT menu_item_id FROM menu_item WHERE name = 'Seafood Platter Combo'), 0.5),
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Vegetable Oil'), (SELECT menu_item_id FROM menu_item WHERE name = 'Seafood Platter Combo'), 0.5)
ON CONFLICT DO NOTHING;

-- Insert statements for Surf and Turf Combo
INSERT INTO composite_menu_ingredients (ingredients_id, menu_item_id, quantity)
VALUES 
--    ((SELECT ingredients_id FROM ingredients WHERE name = 'Grilled Steak'), (SELECT menu_item_id FROM menu_item WHERE name = 'Surf and Turf Combo'), 1),
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Shrimp'), (SELECT menu_item_id FROM menu_item WHERE name = 'Surf and Turf Combo'), 1),
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Mashed Potatoes'), (SELECT menu_item_id FROM menu_item WHERE name = 'Surf and Turf Combo'), 1),
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Seasonal Vegetables'), (SELECT menu_item_id FROM menu_item WHERE name = 'Surf and Turf Combo'), 0.2)
ON CONFLICT DO NOTHING;

-- Insert statements for Fish and Shrimp Combo
INSERT INTO composite_menu_ingredients (ingredients_id, menu_item_id, quantity)
VALUES 
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Cod Fillets'), (SELECT menu_item_id FROM menu_item WHERE name = 'Fish and Shrimp Combo'), 1),
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Shrimp'), (SELECT menu_item_id FROM menu_item WHERE name = 'Fish and Shrimp Combo'), 1),
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Fries'), (SELECT menu_item_id FROM menu_item WHERE name = 'Fish and Shrimp Combo'), 1)
--    ((SELECT ingredients_id FROM ingredients WHERE name = 'Coleslaw'), (SELECT menu_item_id FROM menu_item WHERE name = 'Fish and Shrimp Combo'), 1)
ON CONFLICT DO NOTHING;

-- Insert statements for Seafood Pasta Combo
INSERT INTO composite_menu_ingredients (ingredients_id, menu_item_id, quantity)
VALUES 
--    ((SELECT ingredients_id FROM ingredients WHERE name = 'Pasta'), (SELECT menu_item_id FROM menu_item WHERE name = 'Seafood Pasta Combo'), 1),
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Shrimp'), (SELECT menu_item_id FROM menu_item WHERE name = 'Seafood Pasta Combo'), 1),
--    ((SELECT ingredients_id FROM ingredients WHERE name = 'Scallops'), (SELECT menu_item_id FROM menu_item WHERE name = 'Seafood Pasta Combo'), 1),
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Crab Meat'), (SELECT menu_item_id FROM menu_item WHERE name = 'Seafood Pasta Combo'), 1),
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Garlic Bread'), (SELECT menu_item_id FROM menu_item WHERE name = 'Seafood Pasta Combo'), 0.2)
ON CONFLICT DO NOTHING;

-- Insert statements for Seafood Skewers Combo
INSERT INTO composite_menu_ingredients (ingredients_id, menu_item_id, quantity)
VALUES 
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Shrimp'), (SELECT menu_item_id FROM menu_item WHERE name = 'Seafood Skewers Combo'), 1),
--    ((SELECT ingredients_id FROM ingredients WHERE name = 'Scallops'), (SELECT menu_item_id FROM menu_item WHERE name = 'Seafood Skewers Combo'), 1),
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Vegetables'), (SELECT menu_item_id FROM menu_item WHERE name = 'Seafood Skewers Combo'), 1),
    ((SELECT ingredients_id FROM ingredients WHERE name = 'Rice Pilaf'), (SELECT menu_item_id FROM menu_item WHERE name = 'Seafood Skewers Combo'), 0.2)
ON CONFLICT DO NOTHING;

-- CUSTOMERS
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
    (10, 20, (SELECT price FROM menu_item WHERE menu_item_id = 20)), -- Sample cart item 11
    (1, 3, (SELECT price FROM menu_item WHERE menu_item_id = 3)),
    (10, 5, (SELECT price FROM menu_item WHERE menu_item_id = 5));

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

WITH delivery_data AS (
    SELECT 
        o.order_id,
        c.customer_id,
        a.delivery_address_id,
        CASE 
            WHEN o.order_id % 3 = 0 THEN 'Shipped'
            WHEN o.order_id % 2 = 0 THEN 'Processing'
            ELSE 'Delivered'
        END AS delivery_status,
        CURRENT_TIMESTAMP - INTERVAL '1 day' * (o.order_id % 5) AS delivery_date -- Vary delivery dates
    FROM 
        orders o
    JOIN 
        customer c ON o.customer_id = c.customer_id
    JOIN 
        delivery_address a ON c.customer_id = a.customer_id
)
INSERT INTO public.delivery_details (delivery_address_id, order_id, customer_id, delivery_status, delivery_date)
SELECT 
    dd.delivery_address_id,
    dd.order_id,
    dd.customer_id,
    dd.delivery_status,
    dd.delivery_date
FROM 
    delivery_data dd;


--update orders when new cart items are added
-- WITH updated_orders AS (
--     SELECT 
--         c.customer_id,
--         o.order_id,
--         NOW() AS order_date,
--         STRING_AGG(m.name, ', ') AS description,
--         SUM(s.price) AS total_amount
--     FROM 
--         shopping_cart_items s
--     INNER JOIN 
--         shopping_cart c ON s.cart_id = c.cart_id
--     INNER JOIN 
--         menu_item m ON s.menu_item_id = m.menu_item_id
--     INNER JOIN 
--         orders o ON c.customer_id = o.customer_id
--     GROUP BY 
--         c.customer_id, o.order_id
-- )
-- UPDATE orders o
-- SET 
--     order_date = u.order_date,
--     description = CONCAT('You ordered for: ', u.description),
--     total_amount = u.total_amount
-- FROM 
--     updated_orders u
-- WHERE 
--     o.order_id = u.order_id;

-- select * from orders;

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
-- update price for menu items
--  UPDATE order_item
--  SET 
--  unit_price =
--   CASE 
--   	WHEN menu_item_id =3 then (SELECT price FROM menu_item WHERE menu_item_id = 3)
--   	WHEN menu_item_id =5 then (SELECT price FROM menu_item WHERE menu_item_id = 5)
--   END
-- WHERE menu_item_id IN (3, 5)
;


-- insert into purchases enitity
WITH order_items AS
(
SELECT 
    o.order_id
    ,oi.order_item
    ,o.customer_id
    ,o.order_date
    ,o.total_amount total_order_amount
   
    ,COALESCE (m.promo_code, '0')
    ,m.menu_item_id
    , CASE 
        m.promo_code
        WHEN 'PROMO1' THEN	10.00
		WHEN 'PROMO2' THEN	15.00
		WHEN 'PROMO3' THEN	20.00
		WHEN 'PROMO4' THEN	25.00
		WHEN 'PROMO5' THEN	30.00
		ELSE 0
      END AS discount_percent
    ,oi.quantity
    , oi.unit_price
    , oi.unit_price * oi.quantity price_by_quantity

FROM orders o
  	INNER JOIN order_item oi
    	USING (order_id) 
    INNER JOIN menu_item m
    	USING (menu_item_id)
 ), 
 calculate_discount AS 
(
SELECT
 *
	  ,(price_by_quantity * discount_percent/100) AS calculated_discount -- compute discount as a percentage of the item price, some items appear more than one so use the  price by quantity
	  ,price_by_quantity - ((price_by_quantity * discount_percent/100)) AS discount_price 
	  ,(price_by_quantity - ((price_by_quantity * discount_percent/100))) * 0.15 hst -- compute hst on unit price after discount
FROM order_items
 ),
calculate_payment AS 
(
SELECT 
	* 
	, (discount_price + hst) as payment
FROM calculate_discount
)
INSERT INTO purchases 
( 
	order_id
	, customer_id
	, payment_date
	, quantity_purchased
	, total_order_amount
	, discount_applied
	, discount_price
	, total_hst
	, payment_amount
)
SELECT 
	order_id
	, customer_id
	, order_date payment_date
	, SUM(quantity) AS quantity_purchased
	, SUM(total_order_amount)  AS total_order_amount
	, SUM(calculated_discount) discount_applied
	, SUM(discount_price ) AS discount_price
	, SUM(hst) as total_hst
	, SUM(payment) AS payment_amount
FROM calculate_payment
GROUP BY 
	order_id
	, customer_id
	, order_date
;


-- payment enitity
-- Insert into payment details
INSERT INTO payment_details 
(
    customer_id,
    order_id,
    total_amount,
    payment_method,
    payment_date
)
SELECT 
    customer_id,
    order_id,
    payment_amount,
    CASE 
        -- use random function to assign payments methods to purchases
        WHEN random() < 0.3 THEN 'Credit Card'
        WHEN random() < 0.6 THEN 'Interac'
        ELSE 'PayPal'
    END AS payment_method,
    payment_date
FROM purchases;
