-- CREATE TABLE IF NOT EXISTS promotion (
--     promo_code CHAR(6) PRIMARY KEY
--     ,discount DECIMAL(5, 2) NOT NULL
--     ,begin_date DATE NOT NULL
--     ,end_date DATE NOT NULL
--     ,CONSTRAINT check_discount_range CHECK (discount >= 0 AND discount <= 100)
-- );
-- -- alter promotion date field to timestamps
-- ALTER TABLE promotion 
-- ALTER COLUMN begin_date TYPE TIMESTAMP;
-- ALTER TABLE promotion 
-- ALTER COLUMN end_date TYPE TIMESTAMP;


-- insert into promotion table

INSERT INTO promotion (promo_code, discount, begin_date, end_date) VALUES 
('PROMO1', 10.00, now(), now() + INTERVAL '1 WEEK'),
('PROMO2', 15.00, now(), now() + INTERVAL '1 MONTH'),
('PROMO3', 20.00, now(), now() + INTERVAL '2 WEEKS'),
('PROMO4', 25.00, now(), now() + INTERVAL '3 WEEKS'),
('PROMO5', 30.00, now(), now() + INTERVAL '1 MONTH');

-- MENU CATEGORY
-- CREATE TABLE IF NOT EXISTS menu_category (
--     category_id SERIAL PRIMARY KEY,
--     name VARCHAR(50) NOT NULL,
--     description VARCHAR(255) NOT NULL
-- );

INSERT INTO menu_category (name, description)
VALUES 
    ('Fish and Chips', 'Classic fish and chips served with fries and tartar sauce.'),
    ('Seafood Platters', 'Assorted seafood platters featuring shrimp, calamari, and fish.'),
    ('Fried Seafood Specials', 'Specialty fried seafood items like crispy calamari and shrimp.'),
    ('Seafood Sandwiches', 'Delicious seafood sandwiches served on fresh bread with lettuce and tomato.'),
    ('Seafood Combos', 'Combination seafood meals featuring a variety of fried and grilled options.');

 -- INSERT INTO MENU -ITEMS
ALTER TABLE menu_item
ADD CONSTRAINT unique_ingredient_name UNIQUE (name);

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

-- insert into ingredients table

----- first add a unique constraint to the ingredients name to avoid inserting multiple names for an ingredients
ALTER TABLE ingredients
ADD CONSTRAINT unique_ingredient_name UNIQUE (name);

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


