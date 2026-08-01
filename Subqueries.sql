-- Subqueries

-- Subqueries In Where

SELECT * FROM parks_and_recreation.employee_demographics
WHERE employee_id IN (
		SELECT employee_id FROM parks_and_recreation.employee_salary
        WHERE dept_id = 1
);

-- Question 01

SELECT first_name,
salary
FROM parks_and_recreation.employee_salary
WHERE salary > (
		SELECT AVG(salary)
        FROM parks_and_recreation.employee_salary
);

-- Question 01

SELECT 
	first_name,
	salary
FROM parks_and_recreation.employee_salary
WHERE salary > (
	SELECT AVG(salary) FROM parks_and_recreation.employee_salary
);

-- Question 02

SELECT 
	first_name,
    salary
FROM parks_and_recreation.employee_salary
WHERE salary = (
	SELECT MAX(salary)
    FROM parks_and_recreation.employee_salary
);

-- Question 03

SELECT 
	first_name,
    salary
FROM parks_and_recreation.employee_salary
WHERE salary < (
	SELECT 
		MIN(salary)
	FROM parks_and_recreation.employee_salary
    WHERE dept_id = 3
);

-- Question 04

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE employee_id IN (
	SELECT 
		employee_id
	FROM parks_and_recreation.employee_salary
    WHERE dept_id = 1
);

-- Question 05

SELECT * 
FROM parks_and_recreation.employee_demographics
WHERE age > (
	SELECT AVG(age)
    FROM parks_and_recreation.employee_demographics
);

-- Question 06

SELECT *
FROM parks_and_recreation.employee_salary
WHERE salary != (
	SELECT MAX(salary)
    FROM parks_and_recreation.employee_salary
);

-- Question 07

SELECT * 
FROM parks_and_recreation.employee_salary
WHERE salary > (
	SELECT salary
    FROM parks_and_recreation.employee_salary
    WHERE employee_id = 3
);

-- Question 08 

SELECT * 
FROM parks_and_recreation.employee_demographics
WHERE age = (
	SELECT MAX(age)
    FROM parks_and_recreation.employee_demographics
);

-- Question 09

SELECT * 
FROM parks_and_recreation.employee_salary
WHERE salary > (
	SELECT AVG(salary) 
    FROM parks_and_recreation.employee_salary
    WHERE dept_id = 1
);

-- Question 10

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE age < (
	SELECT AVG(age)
    FROM parks_and_recreation.employee_demographics
    WHERE gender = "Female"
);

-- Question 11

SELECT * 
FROM parks_and_recreation.employee_salary
WHERE dept_id = (
	SELECT dept_id
    FROM parks_and_recreation.employee_salary
    WHERE employee_id = (
		SELECT employee_id
        FROM parks_and_recreation.employee_salary
        WHERE salary = (
			SELECT MAX(salary)
            FROM parks_and_recreation.employee_salary
        )
    )
);

-- Select Subqueries

-- Practice 1

SELECT 
	first_name,
    salary,
    (
		SELECT MAX(salary)
        FROM parks_and_recreation.employee_salary
	) AS "highest_salary"
FROM parks_and_recreation.employee_salary;
        
-- Practice 2

SELECT 
	first_name,
    salary,
    (
		SELECT MIN(salary)
        FROM parks_and_recreation.employee_salary
	) AS "minimum_salalry"
FROM parks_and_recreation.employee_salary;

-- Practice 3

SELECT
	first_name,
    (
		SELECT COUNT(*)
        FROM parks_and_recreation.employee_demographics
	) AS "employee_count"
FROM parks_and_recreation.employee_demographics;

-- Practice 4

SELECT 
	first_name,
    salary,
    (
		SELECT AVG(salary)
        FROM parks_and_recreation.employee_salary
        WHERE dept_id = 1
	) AS "avg_sal_of_dept_one"
FROM parks_and_recreation.employee_salary;

-- From Subqueries

-- Practice 1

SELECT * 
FROM (
	SELECT 
		dept_id,
        AVG(salary) AS avg_sal
	FROM parks_and_recreation.employee_salary
    GROUP BY dept_id
) AS temp_table
WHERE avg_sal > 60000;

-- Practice 2

SELECT * 
FROM (
	SELECT
		gender,
        COUNT(*) as total_people
	FROM parks_and_recreation.employee_demographics
    GROUP BY gender
) AS temp_table
WHERE total_people > 5;

-- Practice 3 

SELECT * 
FROM (
	SELECT 
		dept_id,
        MAX(salary) AS highest_salary
	FROM parks_and_recreation.employee_salary
    GROUP BY dept_id
) AS temp_table
ORDER BY highest_salary DESC
LIMIT 2;

-- Practice 4

SELECT 
	department_id,
	CASE
		WHEN average_salary > 70000 THEN "High Paying"
        WHEN average_salary BETWEEN 50000 and 70000 THEN "Medium Paying"
        WHEN average_salary < 50000 THEN "Low Paying"
	END AS "status"
FROM (
	SELECT 
		dept_id AS department_id,
        AVG(salary) AS average_salary
	FROM parks_and_recreation.employee_salary
    GROUP BY department_id
) AS temp_table;

-- Practice 5

SELECT 
	dept_id,
    employee_count,
    average_salary
FROM (
	SELECT
		dept_id,
        COUNT(*) AS employee_count,
        AVG(salary) AS average_salary
	FROM parks_and_recreation.employee_salary
    GROUP BY dept_id
) AS temp_table
WHERE employee_count >= 2 AND average_salary > 60000;