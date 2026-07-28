SELECT * FROM parks_and_recreation.employee_demographics;

SELECT first_name,
last_name, 
age,
(age + 10) * 10, #PEMDAS(MYSQL Engine me operations hona)
birth_date 
FROM parks_and_recreation.employee_demographics;

SELECT distinct first_name, gender from parks_and_recreation.employee_demographics;

SELECT * FROM parks_and_recreation.employee_salary;

SELECT first_name,
occupation,
salary,
(salary * 2) - 10000
FROM parks_and_recreation.employee_salary;

SELECT distinct occupation, salary FROM parks_and_recreation.employee_salary;