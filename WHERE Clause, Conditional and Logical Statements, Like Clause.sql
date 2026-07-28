SELECT * FROM parks_and_recreation.employee_salary;

# Comparision Operator (=, >=, <=, >, <, !=)
SELECT * FROM parks_and_recreation.employee_salary 
WHERE salary < 50000;

SELECT * FROM parks_and_recreation.employee_demographics
WHERE gender = "Female";

# Logical Operator (AND -- OR -- NOT)

SELECT * FROM parks_and_recreation.employee_demographics;

SELECT * FROM parks_and_recreation.employee_demographics
WHERE age > 35 AND gender = "Female";

SELECT * FROM parks_and_recreation.employee_demographics
WHERE age <= 35 OR gender = "Female";

SELECT * FROM parks_and_recreation.employee_demographics
WHERE birth_date > "1970-01-01" OR NOT gender = "Female";

SELECT * FROM parks_and_recreation.employee_demographics
WHERE birth_date > "1970-01-01" AND gender = "Female";

# PEMDAS can also use with Conditional Statements

SELECT * FROM parks_and_recreation.employee_demographics
WHERE (first_name = "Leslie" AND age < 40) OR age > 50;

SELECT * FROM parks_and_recreation.employee_demographics
WHERE (age > 30 AND age < 50);

SELECT * FROM parks_and_recreation.employee_demographics
WHERE (first_name = "Leslie" AND first_name < "Tom") AND age >= 35;

SELECT * FROM parks_and_recreation.employee_demographics;

-- LIKE Statement -- (%[for anything], _[for exact])

SELECT * FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE "%n%";

SELECT * FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE "_n_";

SELECT * FROM parks_and_recreation.employee_demographics
WHERE birth_date LIKE "%01%";