SELECT * FROM parks_and_recreation.employee_salary;

SELECT occupation, AVG(salary)
FROM parks_and_recreation.employee_salary
GROUP BY occupation;

SELECT * FROM parks_and_recreation.employee_demographics;

SELECT gender,  AVG(age)
FROM parks_and_recreation.employee_demographics
GROUP BY gender;

SELECT gender, Max(age)
FROM parks_and_recreation.employee_demographics
GROUP BY gender;

SELECT gender, COUNT(gender)
FROM parks_and_recreation.employee_demographics
GROUP BY gender;

-- ORDER BY --
SELECT gender, age FROM parks_and_recreation.employee_demographics
ORDER BY age, gender;

SELECT * FROM parks_and_recreation.employee_demographics
ORDER BY age DESC;

SELECT first_name, gender, age FROM parks_and_recreation.employee_demographics
ORDER BY gender ASC, age DESC;

-- HAVING --

SELECT gender, COUNT(gender) 
FROM parks_and_recreation.employee_demographics
GROUP BY gender
HAVING COUNT(gender) > 2;

SELECT gender, AVG(age) as average_age
FROM parks_and_recreation.employee_demographics
WHERE age > 25
GROUP BY gender
HAVING average_age > 35;

SELECT first_name, age
FROM parks_and_recreation.employee_demographics
WHERE age > 30
ORDER BY age DESC;

-- LIMIT --

SELECT first_name, age
FROM parks_and_recreation.employee_demographics
ORDER BY age ASC
LIMIT 5;

SELECT first_name, age
FROM parks_and_recreation.employee_demographics
ORDER BY age ASC
LIMIT 1, 3;

