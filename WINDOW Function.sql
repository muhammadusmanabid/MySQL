-- Window Functions

SELECT 
	gender,
    AVG(age)
FROM
parks_and_recreation.employee_demographics
GROUP BY gender;

-- WINDOW FUNCTION OVER

SELECT 
	*,
    AVG(age) OVER(partition by gender) AS avg_age
FROM parks_and_recreation.employee_demographics;

SELECT 
	*,
    SUM(salary) OVER(partition by dept_id) AS sum_of_sal
FROM parks_and_recreation.employee_salary;

- Group By
 
SELECT 
	e.subject,
	SUM(e.score)
FROM students.exam_scores AS e
GROUP BY e.subject;
 
 -- Window Function
 
SELECT *,
		SUM(e.score) OVER(Partition By e.subject) AS subject_total
FROM students.exam_scores AS e;

SELECT 
	*,
    SUM(e.score) OVER(
		Partition BY e.subject
        ORDER BY e.score_id ASC
    ) AS subject_total
FROM students.exam_scores AS e;

SELECT 
	dem.employee_id,
	dem.first_name,
    dem.last_name,
    dem.gender,
    sal.salary,
    SUM(sal.salary) OVER(
		PARTITION BY dem.gender
        ORDER BY dem.employee_id
    ) AS "rolling_total"
FROM parks_and_recreation.employee_demographics AS dem
JOIN parks_and_recreation.employee_salary AS sal
	ON sal.employee_id = dem.employee_id;
    
SELECT 
	emp.employee_id,
    emp.department_id,
    emp.first_name,
    emp.last_name,
    SUM(sal.salary) OVER(
		PARTITION BY department_id
        ORDER BY manager_id
    ) AS "rolling total"
FROM company_db.employees AS emp
JOIN company_db.salaries AS sal
	ON sal.employee_id = emp.employee_id;
    
SELECT * FROM students.exam_scores;
SELECT * FROM students.students;

-- Question 01

SELECT 
	employee_id,
	first_name,
	salary,
    AVG(salary) OVER() AS  company_average_sal
FROM parks_and_recreation.employee_salary;

-- Question 02

SELECT
	dept_id,
    first_name,
    salary,
    AVG(salary) OVER(
		PARTITION BY dept_id
    ) AS dept_avg_sal
FROM parks_and_recreation.employee_salary;

-- Question 03

SELECT 
	dept_id,
	first_name,
    salary,
    SUM(salary) OVER(
		PARTITION BY dept_id
    ) AS dept_total_sal
FROM parks_and_recreation.employee_salary;

-- Question 4

SELECT
	dept_id,
	first_name,
    Salary,
    MAX(salary) OVER(
		PARTITION BY dept_id
    ) AS "dept_max_sal",
    MIN(salary) OVER(
		PARTITION BY dept_id
    ) AS "dept_min_sal"
FROM parks_and_recreation.employee_salary;

-- Question 05

SELECT
    first_name,
    salary,
	AVG(salary) OVER() AS company_avg,
	SUM(salary) OVER() AS company_total,
	AVG(salary) OVER(PARTITION BY dept_id) AS dept_avg,
	SUM(salary) OVER(PARTITION BY dept_id) AS dept_total,
	MAX(salary) OVER(PARTITION BY dept_id) AS dept_max
FROM parks_and_recreation.employee_salary;

-- Ranking Window Function

-- Question 01

SELECT
	first_name,
    salary,
    ROW_NUMBER() OVER(
		ORDER BY salary DESC
    ) AS "order"
FROM parks_and_recreation.employee_salary;

-- Question 02

SELECT
	sal.first_name,
    sal.salary,
    RANK() OVER(
        ORDER BY sal.salary DESC
    ) AS "salary_rank"
FROM parks_and_recreation.employee_salary AS sal;
    
-- Question 03

SELECT 
	sal.first_name,
    sal.salary,
    DENSE_RANK() OVER(
		ORDER BY sal.salary DESC
    ) AS "desnse_rank"
FROM parks_and_recreation.employee_salary;

-- Question 04

SELECT 
	dept_id,
    first_name,
    salary,
    ROW_NUMBER() OVER(
		PARTITION BY dept_id 
        ORDER BY salary DESC
    ) AS "row_num"
FROM parks_and_recreation.employee_salary;

-- QUESTION 05

SELECT
	dept_id,
    first_name,
    salary,
    RANK() OVER(
		PARTITION BY dept_id
        ORDER BY salary DESC
    ) AS "sal_rank"
FROM parks_and_recreation.employee_salary;

-- QUESTION 06

SELECT
	dept_id,
    first_name,
    salary,
    DENSE_RANK() OVER(
		PARTITION BY dept_id
        ORDER BY salary DESC
    ) AS "sal_rank"
FROM parks_and_recreation.employee_salary;

-- Question 07

SELECT * 
FROM (
	SELECT 
		dept_id,
		first_name,
		salary,
		RANK() OVER(
			PARTITION BY dept_id
			ORDER BY salary DESC
		) AS "sal_rank"
	FROM parks_and_recreation.employee_salary
) AS ranked
WHERE sal_rank = 1;

-- Question 08

SELECT *
FROM (
	SELECT 
		dept_id,
        first_name,
        salary,
        ROW_NUMBER() OVER(
			PARTITION BY dept_id
            ORDER BY salary DESC
        ) AS `sal_ranked`
	FROM parks_and_recreation.employee_salary
) AS ranked
WHERE sal_ranked <= 2;

-- Questionn 09

SELECT 
	dept_id,
    first_name,
    salary,
    AVG(salary) OVER() AS `company_avg_salary`,
    AVG(salary) OVER(
		PARTITION BY dept_id
    ) AS `department_avg_salary`,
    SUM(salary) OVER(
		PARTITION BY dept_id
    ) AS `department_total_salary`,
    RANK() OVER(
		PARTITION BY dept_id 
        ORDER BY salary DESC
    ) AS `salary_rank_in_department`,
    DENSE_RANK() OVER(
		PARTITION BY dept_id
        ORDER BY salary DESC
    ) AS `dense_rank_in_department`,
    ROW_NUMBER() OVER(
		PARTITION BY dept_id
        ORDER BY salary DESC
    ) AS `row_number_in_department`
FROM parks_and_recreation.employee_salary;

-- Question 1.1

SELECT * FROM students.students;
SELECT * FROM students.exam_scores;

SELECT 
    name AS student_name,
    branch,
    subject,
    score,
    branch_rank
FROM (
    SELECT 
        *,
        DENSE_RANK() OVER(
            PARTITION BY branch
            ORDER BY total_score DESC
        ) AS branch_rank
    FROM (
        SELECT 
            std.student_id,
            std.name,
            std.branch,
            exam.subject,
            exam.score,
            SUM(exam.score) OVER(PARTITION BY std.student_id) AS total_score
        FROM students.students AS std
        JOIN students.exam_scores AS exam
            ON exam.student_id = std.student_id
    ) AS student_totals
) AS ranked_students
WHERE branch_rank = 1;

-- Question 02.1

SELECT 
	name AS student_name,
    branch,
    subject,
    score,
	
    AVG(score) OVER() AS `students_average_score`,
    
    AVG(score) OVER(
		PARTITION BY branch
	) AS `branch_average_score`,
    
    score - AVG(score) OVER(
		PARTITION BY branch
    ) AS `difference_from_branch_average`
FROM students.students
JOIN students.exam_scores
	ON students.students.student_id = students.exam_scores.student_id;

-- QUESTION 3.1

SELECT 
	name,
    title,
    marks
FROM(
	SELECT 
		std.name,
        proj.title,
        proj.marks,
        RANK() OVER(
			ORDER BY marks DESC
        ) AS marks_rank
	FROM students.students AS std
	JOIN students.projects AS proj
		ON proj.student_id = std.student_id
) AS temp_table
WHERE marks > (
		SELECT
			AVG(marks) 
		FROM students.projects
);

-- Question 4.1

SELECT
	branch,
	name,
	title,
	marks,
    marks_row
FROM (
	SELECT 
		branch,
		name,
		title,
		marks,
        ROW_NUMBER() OVER(
			ORDER BY marks DESC
        ) AS `marks_row`
	FROM students.students AS std
    JOIN students.projects AS proj
		ON proj.student_id = std.student_id
) AS temp_table
WHERE marks_row <= 2;

