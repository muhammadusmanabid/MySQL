CREATE database company_db;

USE company_db;

CREATE TABLE departments (
	department_id INT PRIMARY KEY,
    department_name VARCHAR(255)
);

INSERT INTO departments VALUES (1, "Data Analyst"), (2, "Web Development"), (3, "Web Development"), (4, "ACCA");

CREATE TABLE employees (
	employee_id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    age INT,
    department_id INT,
    manager_id int,
    FOREIGN KEY (department_id)
        REFERENCES departments(department_id),

    FOREIGN KEY (manager_id)
        REFERENCES employees(employee_id)
);

INSERT INTO employees VALUES (1, "Muhammad", "Usman", 20, 1, NULL), (2, "Muhammad", "Ayan", 21, 2, 1), (3, "Anas", "Aqeel", 20, 3, 2),
							 (4, "Mufassil", "Ameen", 23, 4, 3);

CREATE TABLE salaries (
	employee_id INT PRIMARY KEY,
    salary DECIMAL (10, 2),
    
    FOREIGN KEY (employee_id)
        REFERENCES employees(employee_id)
);

INSERT INTO salaries VALUES (1, 90000), (2, 90000), (3, 90000), (4, 100000);

SELECT * FROM company_db.employees;

SELECT * FROM company_db.employees AS emp
INNER JOIN company_db.salaries AS sal
ON emp.employee_id = sal.employee_id;

SELECT emp.employee_id,
emp.first_name AS Employee,
mgr.employee_id AS manager_id, 
mgr.first_name AS Manager
FROM company_db.employees AS emp
LEFT JOIN company_db.employees AS mgr
	ON emp.manager_id = mgr.employee_id;

SELECT 
    emp.first_name AS Employee,
    mgr.first_name AS Manager
FROM company_db.employees AS emp
LEFT JOIN company_db.employees AS mgr
	ON emp.manager_id = mgr.employee_id;
    
SELECT 
    emp.first_name AS Employee,
    mgr.first_name AS Manager
FROM company_db.employees AS emp
JOIN company_db.employees AS mgr
	ON emp.manager_id = mgr.employee_id;
    
SELECT 
	emp.first_name AS Employee,
    emp.age,
    mgr.first_name AS Manager
FROM company_db.employees AS emp
LEFT JOIN company_db.employees AS mgr
	ON emp.manager_id = mgr.employee_id;
    
SELECT 
	emp.first_name AS Employee
FROM company_db.employees AS emp
JOIN company_db.employees AS mgr
	ON emp.manager_id = mgr.employee_id
WHERE emp.manager_id = 2;

SELECT 
	emp.employee_id,
    emp.first_name AS Employees,
    mgr.employee_id,
    mgr.first_name AS Manager
FROM company_db.employees AS emp
JOIN company_db.employees AS mgr
	ON emp.manager_id = mgr.employee_id
WHERE mgr.first_name = "Muhammad";

SELECT 
	emp.first_name AS Employee,
    mgr.first_name AS Manager,
    mgr.department_id AS ManagerDepartment
FROM company_db.employees AS emp
LEFT JOIN company_db.employees AS mgr
	ON emp.manager_id = mgr.employee_id;

SELECT 
	emp.first_name AS Employee,
    emp.age AS Age,
    mgr.first_name AS Manager,
    mgr.age AS ManagerAge
FROM company_db.employees AS emp
LEFT JOIN company_db.employees AS mgr
	ON emp.manager_id = mgr.employee_id
WHERE emp.age > mgr.age;