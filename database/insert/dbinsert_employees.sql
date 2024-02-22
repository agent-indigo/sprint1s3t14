-- insert data into employee table
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