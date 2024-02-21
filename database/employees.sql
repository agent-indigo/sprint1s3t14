-- employee address table
CREATE TABLE IF NOT EXISTS employee_address (
	address_id SERIAL PRIMARY KEY
	, street VARCHAR (50) NOT NULL
	, city VARCHAR (50) NOT NULL
	, province VARCHAR (50) NOT NULL
	, postal_code CHAR (6) NOT NULL
);

-- employee table
CREATE TABLE IF NOT EXISTS employees (
employee_id serial PRIMARY KEY
, manager_id INT NOT NULL
, address_id INT NOT NULL
, first_name VARCHAR(50) NOT NULL
, last_name VARCHAR(50) NOT NULL
, role VARCHAR(50) NOT NULL
, CONSTRAINT fkey_address FOREIGN KEY (address_id) REFERENCES employee_address(address_id)	
, CONSTRAINT fkey_manager FOREIGN KEY (manager_id) REFERENCES manager(manager_id)	
);

-- manager table
CREATE TABLE IF NOT EXISTS manager (
manager_id serial PRIMARY KEY
, address_id INT NOT NULL
, first_name VARCHAR(50) NOT NULL
, last_name VARCHAR(50) NOT NULL
, CONSTRAINT fkey_address FOREIGN KEY (address_id) REFERENCES employee_address(address_id)
);

