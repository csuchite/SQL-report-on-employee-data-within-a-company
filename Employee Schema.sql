SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;

DROP TABLE employees;

-- Re-create the table "people" within animals_db
CREATE TABLE employees (
  emp_no VARCHAR(30) NOT NULL,
  birth_date VARCHAR(30) NOT NULL,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  gender VARCHAR(30) NOT NULL,
  hire_date VARCHAR(30) NOT NULL
);

SELECT * FROM employees;

SELECT * FROM salaries;
SELECT * FROM titles;

-- create the table departments" within _db
CREATE TABLE employees (
  emp_no VARCHAR(30) NOT NULL,
  birth_date VARCHAR(30) NOT NULL,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  gender VARCHAR(30) NOT NULL,
  hire_date VARCHAR(30) NOT NULL
);

-- Drop all tables to add the foreign and primary keys
DROP TABLE departments;
DROP TABLE dept_emp;
DROP TABLE employees;
DROP TABLE salaries;
DROP TABLE titles;
DROP TABLE dept_manager;
-- Re-create all 6 tables with foreign and primary keys
CREATE TABLE employees (
  emp_no VARCHAR(30) NOT NULL,
  birth_date DATE NOT NULL,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  gender VARCHAR(30) NOT NULL,
  hire_date DATE NOT NULL,
  Primary KEY (emp_no)
);

CREATE TABLE departments (
  dept_no VARCHAR(30) NOT NULL,
  dept_name VARCHAR(30) NOT NULL
);

CREATE TABLE dept_emp (
  emp_no VARCHAR(30) NOT NULL,
  dept_no VARCHAR(30) NOT NULL,
  from_date date,
  to_date date
);

CREATE TABLE titles (
  emp_no VARCHAR(30) NOT NULL,
  title VARCHAR(30) NOT NULL,
  from_date date,
  to_date date
);

CREATE TABLE salaries (
  emp_no VARCHAR(30) NOT NULL,
  salary INT,
  from_date date,
  to_date date
);

CREATE TABLE dept_manager (
  dept_no VARCHAR(30) NOT NULL,
  emp_no VARCHAR(30) NOT NULL,
  from_date date,
  to_date date
);

SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

