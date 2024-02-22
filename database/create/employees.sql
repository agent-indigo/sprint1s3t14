-- Create combined employee/manager entity
CREATE TABLE IF NOT EXISTS employee (
    employee_id SERIAL PRIMARY KEY
    ,manager_id INT -- Foreign key referencing employee_id (self-referencing)
    ,address_id INT NOT NULL -- Foreign key referencing address_id in employee_address table
    ,first_name VARCHAR(50) NOT NULL
    ,last_name VARCHAR(50) NOT NULL
    ,role VARCHAR(50) NOT NULL
    ,hire_date TIMESTAMP NOT NULL
    ,salary DECIMAL(10, 2)
    ,employment_status VARCHAR(20) NOT NULL -- Added employment status field
    ,termination_date DATE -- Optional: Date of termination
    ,termination_reason VARCHAR(255) -- Optional: Reason for termination
    ,street VARCHAR(50) NOT NULL
    ,city VARCHAR(50) NOT NULL
    ,province VARCHAR(50) NOT NULL
    ,postal_code VARCHAR(20) NOT NULL
);
-- Add check constraint to ensure salary is positive
ALTER TABLE employee
ADD CONSTRAINT salary_check CHECK (salary > 0);
