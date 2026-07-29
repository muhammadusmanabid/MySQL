SELECT * FROM company_db.employees;

SELECT first_name, last_name
FROM company_db.employees
UNION 
SELECT first_name, last_name
FROM company_db.employees;

SELECT first_name, last_name, "OLD Man" AS Label
FROM parks_and_recreation.employee_demographics
WHERE age > 45 AND gender = "Male"
UNION 
SELECT first_name, last_name, "OLD Lady" AS Label
FROM parks_and_recreation.employee_demographics
WHERE age > 45 AND gender = "Female"
UNION
SELECT first_name, last_name, "Highly Paid" AS Label
FROM parks_and_recreation.employee_salary
WHERE salary > 65000;

-- Q1 --
SELECT first_name FROM company_db.employees
UNION 
SELECT department_name FROM company_db.departments;

-- Q2 --
SELECT first_name, "Employee" AS Type
FROM company_db.employees
UNION 
SELECT department_name, "Department" AS Type
FROM company_db.departments;

-- Q3 --
SELECT first_name, "Young Employee" AS Label
FROM company_db.employees
WHERE age < 21
UNION 
SELECT first_name, "High Salary" AS label
FROM company_db.employees AS emp
INNER JOIN company_db.salaries AS sal
	ON sal.employee_id = emp.employee_id
WHERE salary >= 100000;

-- Q4 --
SELECT first_name, last_name, "Senior Male" AS Status
FROM parks_and_recreation.employee_demographics
WHERE age > 40
UNION
SELECT first_name, last_name, "Senior Female" AS Status
FROM parks_and_recreation.employee_demographics
WHERE age > 40
UNION
SELECT first_name, last_name, "Top Earner" AS Status
FROM parks_and_recreation.employee_salary
WHERE salary > 70000;

-- Q5 --
SELECT employee_id, first_name, "Employee" AS Type
FROM company_db.employees
UNION
SELECT department_id, department_name, "Department" AS Type
FROM company_db.departments;