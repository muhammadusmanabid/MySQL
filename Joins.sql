SELECT * FROM parks_and_recreation.employee_demographics;

SELECT * FROM parks_and_recreation.employee_salary;

-- JOINS (HELP JOINS TWO OR MORE TABLE BASED ON RELATTED COLUMNS--

-- INNER JOIN (RETURNS ONLY THE ROWS THAT ARE EXISIT IN BOTH TABLES)-- 

SELECT * FROM parks_and_recreation.employee_demographics AS dem
INNER JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id;
    
SELECT * FROM parks_and_recreation.employee_demographics AS dem
INNER JOIN parks_and_recreation.employee_salary AS sal
	ON dem.first_name = sal.first_name;
    
SELECT * FROM parks_and_recreation.employee_salary AS sal
INNER JOIN parks_and_recreation.parks_departments AS par
	ON sal.dept_id = par.department_id;
    
SELECT dem.employee_id, gender, age FROM parks_and_recreation.employee_demographics AS dem
INNER JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id;

-- LEFT JOIN --
SELECT * FROM parks_and_recreation.employee_demographics AS dem
LEFT JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id;
    
