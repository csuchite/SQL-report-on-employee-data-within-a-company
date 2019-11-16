-- Drop all tables to add the foreign and primary keys
DROP TABLE departments;
DROP TABLE dept_emp;
DROP TABLE employees CASCADE;
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
  PRIMARY KEY (emp_no)
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
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
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
SELECT * FROM employees CASCADE;
SELECT * FROM salaries;
SELECT * FROM titles;



--Query #1 List the details of each employee:
--employee number, last name, first name, gender, and salary.

SELECT employees.emp_no, employees.last_name, employees.first_name,
	   employees.gender, salaries.salary
FROM employees
INNER JOIN salaries
ON employees.emp_no = salaries.emp_no;


--Query#2 List employees who were hired in 1986.

SELECT employees.emp_no, employees.last_name,
	   employees.first_name, employees.hire_date
FROM employees 
WHERE hire_date between '1986-01-01' and '1986-12-31'
ORDER BY hire_date Asc;



--Query#3 List the manager of each department by: 
--department number, department name,the manager's employee number, 
--last name, first name, and start and end employment dates.

SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, 
	   employees.last_name, employees.first_name, dept_manager.from_date,
	   dept_manager.to_date
FROM employees
INNER JOIN dept_manager
ON employees.emp_no = dept_manager.emp_no
INNER JOIN departments
ON departments.dept_no = dept_manager.dept_no
ORDER BY dept_name ASC;



--Query#4 List the department of each employee by:
--employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.last_name,
	   employees.first_name, departments.dept_name
FROM employees 
INNER JOIN dept_manager
ON employees.emp_no = dept_manager.emp_no
INNER JOIN departments
on departments.dept_no = dept_manager.dept_no




--Query#5 List all employees whose first name is "Hercules" and 
--last names begin with "B."

SELECT * FROM employees
WHERE first_name = 'Hercules'
AND last_name like 'B%'
ORDER BY last_name Asc;



--Query#6 List all employees in the Sales department by:
--employee number, last name, first name, and department name.

SELECT  employees.emp_no, employees.last_name, 
		employees.first_name, departments.dept_name
FROM employees
INNER JOIN dept_manager
ON employees.emp_no = dept_manager.emp_no
INNER JOIN departments
ON departments.dept_no = dept_manager.dept_no
WHERE dept_name = 'Sales' dept_name = 'Development'; 



--Query#7 List all employees in the Sales and Development departments by:
--employee number, last name, first name, and department name.

SELECT  employees.emp_no, employees.last_name, 
		employees.first_name, departments.dept_name
FROM employees
INNER JOIN dept_manager
ON employees.emp_no = dept_manager.emp_no
INNER JOIN departments
ON departments.dept_no = dept_manager.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';



--Query#8 In descending order, list the frequency count of employee 
--last names, i.e., how many employees share each last name.
SELECT employees.last_name, count(*)
FROM employees
group by last_name; 











