SELECT * FROM parks_and_recreation.employee_demographics;

-- Length Function --

SELECT first_name, LENGTH(first_name)
FROM parks_and_recreation.employee_demographics;

SELECT last_name, 
LENGTH(first_name)
FROM company_db.employees
ORDER BY 2 DESC; 

-- Upper and Lower -- 

SELECT first_name, 
last_name,
UPPER(first_name) AS "Upper First_Name",
LOWER(last_name) AS "Lower Last_Name"
FROM company_db.employees;

-- TRIM FUNCTION --

SELECT TRIM("	sky		");
SELECT LTRIM("		sky		");
SELECT RTRIM("		sky		");

-- LEFT, RIGHT FUNCTION --

SELECT first_name, 
LEFT(first_name, 3)
FROM company_db.employees;

SELECT first_name,
RIGHT(first_name, 4)
FROM parks_and_recreation.employee_demographics;

-- SUBSTRING --

SELECT first_name,
SUBSTRING(first_name, 2, 2)
FROM parks_and_recreation.employee_demographics;

SELECT birth_date,
SUBSTRING(birth_date, 6, 2) AS birth_month,
SUBSTRING(birth_date, 1, 4) AS birth_year,
SUBSTRING(birth_date, 9, 2) AS birth_day
FROM parks_and_recreation.employee_demographics;

-- REPLACE FUNCTION --

SELECT first_name, REPLACE(first_name, "A", "z")
FROM parks_and_recreation.employee_demographics;

SELECT salary, REPLACE(salary, 0, 5)
FROM company_db.salaries;

-- LOCATE FUNCTION --

SELECT first_name, 
LOCATE("a", first_name)
FROM parks_and_recreation.employee_demographics;

SELECT birth_date,
LOCATE(07, birth_date)
FROM parks_and_recreation.employee_demographics;

-- CONCAT -- 

SELECT first_name, 
last_name,
CONCAT(first_name, " ", last_name)
FROM parks_and_recreation.employee_demographics;