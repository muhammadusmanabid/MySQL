-- CASE STATEMENT -- 

SELECT first_name,
last_name,
age,
CASE
	WHEN age < 21 THEN "Youngest in the Room."
END AS "The Youngest",
CASE 
	WHEN manager_id = 1 THEN "Manager is above"
END AS "UNDER SOMEONE"
FROM company_db.employees;

SELECT * FROM company_db.salaries;

SELECT salary,
CASE 
	WHEN salary >= 85000 AND salary <= 90000 THEN salary + (salary * 0.05)
END AS "Increment"
FROM company_db.salaries;

-- QUESTION 01 --

SELECT first_name, 
age,
CASE
	WHEN age < 21 THEN "Young"
    WHEN age BETWEEN 21 AND 30 THEN "Adult"
    WHEN age > 30 THEN "Senior"
END AS "Category"
FROM company_db.employees;

-- Question 02 -- 

SELECT first_name, 
salary,
CASE
	WHEN salary < 90000 THEN "Low"
    WHEN salary = 90000 THEN "Medium"
    WHEN salary > 90000 THEN "High"
END AS "Grade"
FROM parks_and_recreation.employee_salary;

-- Question 03 -- 

SELECT first_name,
	age,
	salary,
    CASE 
		WHEN age < 21 AND salary >= 90000 THEN "Young High Earner"
		WHEN age  >= 21 AND salary >= 90000 THEN "Experienced High Earner" 
		WHEN age < 21 AND salary <= 90000 THEN "Normal Employee"
		WHEN age >= 21 AND salary <= 90000 THEN "Normal Employee"
	END AS "Status"
FROM company_db.employees AS emp
INNER JOIN company_db.salaries AS sal
	ON sal.employee_id = emp.employee_id;
    
-- Question 04 -- 

SELECT first_name,
salary,
CASE
	WHEN salary >= 70000 THEN salary + (salary * 0.2)
    WHEN salary >= 50000 THEN salary + (salary * 0.1)
    WHEN salary < 50000 THEN salary + (salary * 0.05)
END AS "Bonus"
FROM parks_and_recreation.employee_salary;

-- Question 05 --

SELECT
	first_name,
    age,
    salary,
    CASE 
		WHEN age < 21 Then "Young"
        WHEN age BETWEEN 21 AND 30 THEN "Adult"
        WHEN age > 30 THEN "Senior"
	END AS "AgeGroup",
    CASE 
		WHEN salary < 90000 THEN "Low"
        WHEN salary = 90000 THEN "Medium"
        WHEN salary > 90000 THEN "High"
	END AS "SaalryGrade"
    FROM company_db.employees AS emp
    JOIN company_db.salaries AS sal
		ON sal.employee_id = emp.employee_id;    