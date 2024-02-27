-- Create combined employee/manager entity
CREATE TABLE public.employee (
    employee_id serial4 NOT NULL,
    manager_id int4 NULL,
    address_id int4 NOT NULL,
    first_name varchar(50) NOT NULL,
    last_name varchar(50) NOT NULL,
    "role" varchar(50) NOT NULL,
    hire_date timestamp NOT NULL,
    salary numeric(10, 2) NULL,
    employment_status varchar(20) NOT NULL,
    termination_date date NULL,
    termination_reason varchar(255) NULL,
    street varchar(50) NOT NULL,
    city varchar(50) NOT NULL,
    province varchar(50) NOT NULL,
    postal_code varchar(20) NOT NULL,
    CONSTRAINT employee_pkey PRIMARY KEY (employee_id),
    CONSTRAINT salary_check CHECK ((salary > (0)::numeric)),
    CONSTRAINT fkey_employee_manager FOREIGN KEY (manager_id) REFERENCES public.employee(employee_id)
);
