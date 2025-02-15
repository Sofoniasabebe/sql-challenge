-- Data Engineering

DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS titles CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS salaries CASCADE;
DROP TABLE IF EXISTS dept_emp CASCADE;
DROP TABLE IF EXISTS dept_manager CASCADE;

-- 1. Departments table - no dependencies 
-- For this table, department_number is used as a primary key since each department has a unique dept_no.

CREATE TABLE departments (
    dept_no VARCHAR PRIMARY KEY,
    dept_name VARCHAR NOT NULL
);

-- 2. Titles table - no dependencies 
-- The title_id column can serve as the primary key in this table. All titles can be uniquely identified using the title_ids.

CREATE TABLE titles (
    title_id VARCHAR PRIMARY KEY,
    title VARCHAR NOT NULL
);

-- 3. Employee table - depends on titles 
-- For this table, emp_no can serve as the primary key. It uinquely identifies each employee. 
-- Emp_tilte_id, from the titles table, can serve as a foreign key linking it to that particular table. 

CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
    emp_tilte_id VARCHAR NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    sex CHAR(1) NOT NULL,
    hire_date DATE NOT NULL,
    FOREIGN KEY (emp_tilte_id) REFERENCES titles(title_id)
);

-- 4. Salaries table - depends on employees
-- For this table, emp_no can serve as the foreign key and it can ensure that only valid employees are populated in this table.

CREATE TABLE salaries (
    emp_no INT PRIMARY KEY,
    salary INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- 5. Department employee table - depends on employees and departments
-- For this table, emp_no and dept_no can both serve as foreign keys. 
-- However, this table could not have an explicit primary key since emp_name is no a realibale unique identifier 
-- due to the probability of multiple employees having the same name. 
-- The two foreign keys, emp_no and dept_no, can also serve as a composite primary key by ensuring that an employee 
-- is not assigned to the same department more than once. 

CREATE TABLE dept_emp (
    emp_no INT,
    dept_no VARCHAR,
    PRIMARY KEY (emp_no, dept_no), -- composite primary key
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- 6. Department manager table - depends on employees and departments 
-- For this table, dept_no and emp_no can serve as foreign keys. 
-- Both columns also serve as composite primary keys ensuring that an employee is not assigned as a manager of the same 
-- department multiple times. 

CREATE TABLE dept_manager (
    dept_no VARCHAR,
    emp_no INT,
    PRIMARY KEY (dept_no, emp_no), -- composite primary key
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
); 

-- Viewing the tables:
SELECT * FROM departments;
SELECT * FROM titles;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;

