USE sql_practice;


SELECT 
	*
FROM
	employees;
    
-- 1) Find the department where the difference between the highest and lowest employee salaries is greater than 30000.
SELECT
	department,
    MAX(salary) AS highest_salary,
    MIN(salary) AS lowest_salary,
    MAX(salary) - MIN(salary) AS difference 
FROM
	employees
GROUP BY
	department
HAVING
	(highest_salary - lowest_salary) > 30000; 
    
    
    
-- 2) Display the top 3 departments based on their average employee salary.
SELECT
	department,
    AVG(salary) AS average_salary
FROM
	employees
GROUP BY
	department
ORDER BY
	average_salary DESC
LIMIT
	3;
    
    
    
-- 3) Find the employees whose salary is greater than the overall average salary of the company.
SELECT AVG(salary) FROM employees;
SELECT
	*
FROM
	employees
WHERE
	salary > 72066.666667;

-- OR

SELECT
	*
FROM
	employees
WHERE
	salary > (SELECT AVG(salary) FROM employees);
    
    
    
-- 4) Find departments where more than 50% of employees are working remotely. 
SELECT
	department
FROM
	employees
GROUP BY
	department
HAVING
	AVG(is_remote) > 0.5;
    
    
    
-- 5) Display the city having the highest numbers of active employees.
SELECT
	city,
    COUNT(*) AS number_of_employees
FROM
	employees
WHERE
	employment_status = 'Active'
GROUP BY
	city
ORDER BY
	number_of_employees DESC
LIMIT
	1;
    
    
    
-- 6) Find the departments where the total bonus paid is greater than the average bonus paid across all employees.
SELECT                           -- To check average bonus across all employees
	AVG(bonus)
FROM
	employees; 

SELECT                            -- To check average bonus across all department
	department, 
    SUM(bonus) AS average_bonus
FROM
	employees
GROUP BY
	department;
    
SELECT                            -- Solution for the problem
	department,
    SUM(bonus) AS total_bonus
FROM 
	employees
GROUP BY
	department
HAVING
	total_bonus > (SELECT AVG(bonus) FROM employees);
    
    
    
-- 7) Display employees whose salary is in the top 25% of the company's salary range. (Use the salary range to determine the threshold.)
SELECT                                                                      -- Subquery
	MIN(salary) + 0.75 * (MAX(salary) - MIN(salary)) AS 75_percentile_salary
FROM
	employees;

SELECT
	*
FROM
	employees
WHERE
	salary >= (SELECT
				   MIN(salary) + 0.75 * (MAX(salary) - MIN(salary)) AS 75_percentile_salary
	           FROM
	               employees);
                   
                   
                   
-- 8) Find the average salary of employees who joined before 2022, grouped by department. Display only departments having average salary above 60000.
SELECT
	department,
	AVG(salary) AS average_salary
FROM
	employees
WHERE
	joining_date < '2022-01-01'
GROUP BY
	department
HAVING
	average_salary > 60000;
    
-- 9) Find departments where the average performance ratings of female employees is greater than that of male employees. (Use conditional aggregation)
SELECT
	department,
	AVG(CASE WHEN gender = 'Female' THEN performance_rating END) AS avg_rating_female,
    AVG(CASE WHEN gender = 'Male' THEN performance_rating END) AS avg_rating_male
FROM
	employees
GROUP BY
	department
HAVING
	avg_rating_female > avg_rating_male;
    
    
    
-- 10) Display employees whose salary is greater than the average salary of their department.(Try without subqueries)
SELECT 
	e.*
FROM
	employees e
WHERE
	e.salary > (SELECT
					AVG(e2.salary)
				FROM
					employees e2
				WHERE
					e2.department = e.department);

SELECT               -- To check the average salaries per department
	department,
    AVG(salary) AS avg_sly
FROM 
	employees
GROUP BY
	department;
    
    
    
-- 11) Find the department with highest total bonus.
SELECT
	department,
	SUM(bonus) AS total_bonus
FROM
	employees
GROUP BY
	department
ORDER BY
	total_bonus DESC
LIMIT
	1;
    
    
    
-- 12) Find the percentage of employees in each department who are currently active.
SELECT
	department,
	ROUND(SUM(CASE WHEN employment_status = 'Active' THEN 1 ELSE 0 END) * 100 / count(*), 2) AS active_percentage
FROM 
	employees
GROUP BY 
	department;
    
SELECT
	department,
    SUM(CASE WHEN employment_status = 'Active' THEN 1 ELSE 0 END) * 100 / count(*) AS active_percentage
FROM 
	employees
GROUP BY 
	department;


SELECT
	department,
    count(CASE WHEN employment_status = 'Active' THEN 1 END) * 100 / count(*) AS active_percentage
FROM 
	employees
GROUP BY 
	department;
    
    
    
-- 13) Display departments where the difference between the highest and lowest performance ratings is at least 1.0
SELECT 
	department, 
    Max(performance_rating) - MIN(performance_rating) AS rating_difference
FROM
	employees
GROUP BY
	department
HAVING
	rating_difference >= 1.0;



-- 14) Find the average salary of remote and non-remote employees separately within each department.
SELECT
	department,
    AVG(CASE WHEN is_remote = 1 THEN salary END) AS avg_salary_is_remote,
    AVG(CASE WHEN is_remote = 0 THEN salary END) AS avg_salary_non_remote
FROM
	employees
GROUP BY
	department;
    
    
    
-- 15) Display employees who have null bonus but whose salary is greater than 50,000
SELECT
	*
FROM
	employees
WHERE
	bonus IS NULL AND salary > 50000;
    
    
    
-- 16) Find the top 3 cities based on average employee salary, considering only cities having at least 2 employees.
SELECT
	city,
    COUNT(*) AS total_employees,
    AVG(salary) AS avg_emp_salary
FROM
	employees
GROUP BY
	city
HAVING
 	total_employees >= 2
ORDER BY
	avg_emp_salary DESC
LIMIT
	3;
    
    
-- 17) Find departments where the number of employees with performance rating above 4.0 is greater than 2.
SELECT
	department,
    COUNT(*) AS high_rated_employee_count
FROM
	employees
WHERE
	performance_rating > 4.0
GROUP BY
	department
HAVING
	high_rated_employee_count > 2;
    
    
    
-- 18) Calculate the total salary expenditure for active and inactive employees separately. 
-- [My solution]
SELECT
	employment_status,
    SUM(CASE WHEN employment_status = 'Active' THEN salary END) AS Active_total_salary,
    SUM(CASE WHEN employment_status = 'Inactive' THEN salary END) AS Inactive_total_salary
FROM
	employees
GROUP BY
	employment_status;
    
-- [correct and straight forward solution]
SELECT
	employment_status,
    SUM(salary) AS total_salary
FROM
	employees
GROUP BY
	employment_status;
    
    
    
-- 19) Find the department having the lowest average performance ratings. 
SELECT
	department,
    AVG(performance_rating) AS avg_performance_rating
FROM
	employees
GROUP BY
	department
ORDER BY
	avg_performance_rating
LIMIT
	1;
    
    
    
-- 20) Display employees who joined during 2022 or 2023 and have a performance rating above 4.0
-- [My solution]
SELECT
	*
FROM
	employees
WHERE
	joining_date BETWEEN '2022-01-01' AND '2023-12-31' AND
    performance_rating > 4.0;
    
-- [Another straight forward solution]
SELECT
	*
FROM
	employees
WHERE
	YEAR(joining_date) IN (2022, 2023) AND
    performance_rating > 4.0;
    
    
    
-- 21) Find the average age of employees in each department. Display only departments with an average age above 28 years. 
SELECT
	department,
    AVG(TIMESTAMPDIFF(YEAR, birth_date, CURDATE())) AS avg_age
FROM
	employees
GROUP BY 
	department
HAVING
	avg_age > 28;
    
    
    
-- 22) Find the departments where the total salary of remote employees exceeds 100000
-- [My solution]
SELECT
	department,
    SUM(CASE WHEN is_remote = 1 THEN salary END) AS total_salary_remote
FROM
	employees
GROUP BY
	department
HAVING
	total_salary_remote > 100000;
    
-- [Another straight forward solution]
SELECT
	department,
    SUM(salary) AS total_salary_remote
FROM
	employees
WHERE
	is_remote = 1
GROUP BY
	department
HAVING
	total_salary_remote > 100000;
    
    
    
-- 23) Display the top 5 employees based on the combined value of salary and bonus. Treat NULL bonuses as zero. 
SELECT
	employee_id,
    first_name,
    last_name,
    department,
    job_title,
    joining_date,
    birth_date,
    salary,
    bonus,
    salary + COALESCE(bonus, 0) AS total_compensation
FROM
	employees
ORDER BY
	total_compensation DESC
LIMIT
	5;
    
-- [JUST A TRY]
SELECT
	employee_id,
    first_name,
    last_name,
    department,
    job_title,
    joining_date,
    birth_date,
    salary,
    bonus,
    salary + COALESCE(bonus, 0) AS total_compensation,
    salary + bonus AS total_comp_withoutTreatingNullAs0
FROM
	employees
ORDER BY
	total_compensation DESC;
    
    
    
-- 24) Find the percentage contribution of each department's total salary to the company's total salary.
SELECT
	department,
	SUM(salary) AS department_salary,
    ROUND(SUM(salary) * 100 /(SELECT SUM(salary) FROM employees)) AS salary_percentage
FROM 
	employees
GROUP BY
	department;
    


-- 25) Find departments having exactly 2 employees with a performance rating greater than 4.0
SELECT
	department,
	COUNT(*) AS total_employees
FROM 
	employees 
WHERE 	
	performance_rating > 4.0 
GROUP BY 
	department
HAVING
	total_employees = 2;
    
    
    
-- 26) Display the number of employees hired in each year. Sort the result from the most recent hiring year to the oldes.
SELECT
	YEAR(joining_date) AS hiring_year,
    COUNT(*) AS total_employees
FROM 
	employees
GROUP BY
	hiring_year
ORDER BY
	hiring_year DESC;
    
    
    
-- 27) Find the department with highest average bonus, excluding employees whose bonus is Null
-- [MY WAY]
SELECT
	department,
    COUNT(*) AS number_of_employees,
    AVG(bonus) AS avg_bonus
FROM
	employees
GROUP BY
	department
ORDER BY
	avg_bonus DESC
LIMIT
	1;
    
-- [OTHER way]
SELECT
	department,
    COUNT(*) AS number_of_employees,
    AVG(bonus) AS avg_bonus
FROM
	employees
WHERE
	bonus IS NOT NULL
GROUP BY
	department
ORDER BY
	avg_bonus DESC
LIMIT
	1;
    
    
    
-- 28) Display employees whose salary is greater than the average salary of all employees except themselves (try without subqueries)
SELECT
	e.*
FROM
	employees e
WHERE
	e.salary > (SELECT
					(SUM(e2.salary) - e.salary) / (COUNT(e2.salary) - 1)
				FROM
					employees e2);
                    
                    
                    
-- 29) Find the states where the total number of employees is greater than 2 and the average salary is above 60000
SELECT
	state,
    COUNT(*) AS total_emps,
    AVG(salary) AS avg_salary
FROM
	employees
GROUP BY
	state
HAVING
	avg_salary > 60000  AND total_emps > 2;
    
    
    
-- 30) Calculate the salary difference between male and female employees in each department. Display the average salary for both genders
SELECT
	department,
    AVG(CASE WHEN gender = 'Male' THEN salary END) AS male_avg_salary,
	AVG(CASE WHEN gender = 'Female' THEN salary END) AS female_avg_salary,
    ABS(AVG(CASE WHEN gender = 'Male' THEN salary END) - AVG(CASE WHEN gender = 'Female' THEN salary END)) AS avg_salary_diff
FROM
	employees
GROUP BY
	department;
    
-- [Self corrected]
SELECT
	department,
    COALESCE(AVG(CASE WHEN gender = 'Male' THEN salary END), 0) AS male_avg_salary,
	COALESCE(AVG(CASE WHEN gender = 'Female' THEN salary END), 0) AS female_avg_salary,
    ABS(
		COALESCE(AVG(CASE WHEN gender = 'Male' THEN salary END), 0) - 
		COALESCE(AVG(CASE WHEN gender = 'Female' THEN salary END), 0)
        ) AS avg_salary_diff
FROM
	employees
GROUP BY
	department;
    
    
    
-- 31) Find departments where the number of employees earning more than 80000 is at leat 2. 
SELECT
	department,
    COUNT(*) AS total_employees
FROM
	employees
WHERE
	salary > 80000
GROUP BY
	department
HAVING
	COUNT(*) >= 2;
    
    
    
-- 32) Display employees whose joining date falls in the first quater (january - march) of any year. 
SELECT
	*
FROM
	employees
WHERE
	MONTHNAME(joining_date) IN ('January', 'February', 'March');

-- [OR]

SELECT
	*
FROM
	employees
WHERE
	MONTH(joining_date) IN (01, 02, 03);
    
-- [OR]

SELECT
	*
FROM
	employees
WHERE
	QUARTER(joining_date) = 1;
    
    
    
-- 33) Find the department with the highest percentage of employees earning more than 70000. 
SELECT
	department,
    COUNT(CASE WHEN salary > 70000 THEN salary END) AS employees_earning_above_70,
    COUNT(*) AS total_employees,
    (COUNT(CASE WHEN salary > 70000 THEN salary END) / COUNT(*)) * 100 AS percentage
FROM
	employees
GROUP BY
	department
ORDER BY
	percentage DESC
LIMIT
	1;
    
-- [ANOTHER WAY]
SELECT
	department,
    ROUND(SUM(CASE WHEN salary > 70000 THEN 1 ELSE 0 END) * 100 / COUNT(*), 2) AS percentage_employees_earning_above_70
FROM
	employees
GROUP BY 
	department
ORDER BY 
	percentage_employees_earning_above_70 DESC
LIMIT
	1;
    
    
    
-- 34) Calculate the average salary for each combination of department and employment status. 
SELECT
	department,
    employment_status,
    AVG(salary)
FROM
	employees
GROUP BY
	department,
    employment_status;
    
    
    
-- 35) Find the departments where the total bonus is greater than 10000 and the average performance rating
-- 	   is above 4.0
SELECT
	department,
    SUM(bonus) AS total_bonus,
    AVG(performance_rating) AS avg_rating
FROM
	employees
GROUP BY
	department
HAVING
	total_bonus > 10000 AND avg_rating > 4.0;
    
    
    
-- 36) Display the second and third highest-paid employees using sorting and LIMIT/OFFSET. 
SELECT
	*
FROM
	employees
ORDER BY
	salary DESC
LIMIT
	2
OFFSET
	1;
    
    
    
-- 37) Find the number of employees who joined in each month, irrespective of the year. Sort by 
--     employee count descending
SELECT
	MONTHNAME(joining_date) AS month_name,
    COUNT(*) AS total_employees
FROM
	employees
GROUP BY
	month_name
ORDER BY
	total_employees DESC;
    
    
    
-- 38) Find the departments where the average salary of remote employees is greater than 70000
SELECT
	department,
    AVG(CASE WHEN is_remote = 1 THEN salary END) AS avg_remote_salary
FROM
	employees
GROUP BY
	department
HAVING
	avg_remote_salary > 70000;

-- [ANOTHER WAY]
SELECT
	department,
    AVG(salary) AS avg_remote_salary
FROM
	employees
WHERE
	is_remote = 1
GROUP BY
	department
HAVING
	avg_remote_salary > 70000;
    
    
    
-- 39) Display employees whose salary is not within the salary range of 50k to 90k 
--     but whose perfromance rating is above 4.0
SELECT
	*
FROM
	employees
WHERE
	salary NOT BETWEEN 50000 AND 70000 AND performance_rating > 4.0;
    
    
    
-- 40) Calculate the ratio of active employees to inactive employees in each department.
SELECT
	department,
    COUNT(CASE WHEN employment_status = 'Active' THEN employment_status END) AS active_count,
    COUNT(CASE WHEN employment_status = 'Inactive' THEN employment_status END) AS inactive_count,
    ROUND(SUM(CASE WHEN employment_status = 'Active' THEN 1 ELSE 0 END) / 
    NULLIF(SUM(CASE WHEN employment_status = 'Inactive' THEN 1 ELSE 0 END), 0), 2)
FROM
	employees
GROUP BY
	department;
    
    
    
-- 41) Find the city with the highest average performance rating, considering only cities with at least 2 employees. 
SELECT
	city,
    AVG(performance_rating) AS average_rating,
    COUNT(*) AS number_of_employees
FROM
	employees
GROUP BY
	city
HAVING
	number_of_employees >= 2
ORDER BY
	average_rating DESC
	-- number_of_employees DESC
LIMIT
	1;
    
    
    
-- 42) Display departments where the number of employees receiving bonuses is greater than the number
--     of employees not receiving bonuses. 

SELECT
	department,
    COUNT(CASE WHEN bonus IS NOT NULL THEN bonus END) AS bonus_received,
    SUM(CASE WHEN bonus IS NOT NULL THEN 0 ELSE 1 END) AS bonus_not_received
FROM
	employees
GROUP BY
	department
HAVING
	bonus_received > bonus_not_received;
    
-- [OTHER WAY]
SELECT
	department,
    COUNT(bonus) AS e_bonus_received,
    COUNT(*) - COUNT(bonus) AS bonus_not_received
FROM
	employees
GROUP BY
	department
HAVING
	COUNT(bonus) > COUNT(*) - COUNT(bonus);
    
 
SELECT COUNT(bonus) FROM employees;



-- 43) Find the difference between the company's highest and average salary. 
SELECT
	MAX(salary),
    AVG(SALARY),
	MAX(salary) - AVG(SALARY) AS difference
FROM
	employees;
    
    
    
-- 44) Find the total salary paid to employees grouped by their joining year.
--     Display only years where the total salary exceeds 100000. 
SELECT
	YEAR(joining_date) AS year_of_joining,
	SUM(salary)
FROM
	employees
GROUP BY
	year_of_joining
HAVING
	SUM(salary) > 100000;
    
    
    
-- 45) Display employees who have a salary greater than the average salary of their employment status category. 
SELECT
	e.*
FROM
	employees e
WHERE
	e.salary > (SELECT
					AVG(e2.salary)
				FROM
					employees e2
				WHERE
					e2.employment_status = e.employment_status);
                    
                    
                    
-- 46) Find departments where the average salary of employees who joined after 2021 is greater than 75000. 
SELECT
	department,
    AVG(CASE WHEN YEAR(joining_date) > 2020 THEN salary END) AS avg_salary 
FROM
	employees
GROUP BY 
	department
HAVING
	avg_salary > 70000;
    
-- [ANOTHER WAY]
SELECT
	department,
    AVG(salary) AS avg_salary 
FROM
	employees
WHERE
	joining_date > '2022-01-01'
GROUP BY 
	department
HAVING
	avg_salary > 70000;
    
    
    
-- 47) Calculate the percentage of female employees in each department. 
--     Display departments where female representation is greater than 30%
SELECT
	department,
    SUM(CASE WHEN gender = 'Female' THEN 1 ELSE 0 END) AS female_e,
    SUM(CASE WHEN gender = 'Male' THEN 1 ELSE 0 END) AS male_e,
    ROUND((SUM(CASE WHEN gender = 'Female' THEN 1 ELSE 0 END) / 
    (SUM(CASE WHEN gender = 'Female' THEN 1 ELSE 0 END) + 
    SUM(CASE WHEN gender = 'Male' THEN 1 ELSE 0 END))), 2) * 100 AS female_percentage
FROM
	employees
GROUP BY
	department
HAVING
	female_percentage > 30.00;

-- [ANOTHER WAY]
SELECT
	department,
    ROUND((SUM(CASE WHEN gender = 'Female' THEN 1 ELSE 0 END) * 100) / 
    COUNT(*), 2) AS female_percentage
FROM
	employees
GROUP BY
	department
HAVING
	female_percentage > 30.00;
    
    
    
-- 48) Find top 3 departments with the highest average performance rating, considering only active employees. 
SELECT
	department,
    AVG(CASE WHEN employment_status = 'Active' THEN performance_rating END) AS active_performance_rating
FROM
	employees
GROUP BY
	department
ORDER BY 
	active_performance_rating DESC
LIMIT
	3;
    
-- I can replace CASE WHEN condition with where clause. 
    
-- 49) Display the difference between the average salary of remote employees and 
--     non-remote employees across the entire company.
SELECT
	AVG(CASE WHEN is_remote = 1 THEN salary END) AS avg_salary_remote_employees,
	AVG(CASE WHEN is_remote = 0 THEN salary END) avg_salary_non_remote_employees,
    ABS(AVG(CASE WHEN is_remote = 1 THEN salary END) - 
    AVG(CASE WHEN is_remote = 0 THEN salary END)) AS salary_difference
FROM
	employees;
    


-- 50) Find departments where the highest salary is at least twice the lowest salary. 
SELECT
	department,
    MAX(salary),
    MIN(salary)
FROM
	employees
GROUP BY
	department
HAVING
	MAX(salary) > 2 * MIN(salary);
    
    
    
-- 51) Display employees who have a performance rating above the company's average rating but a salary 
--     below the company's average salary.
SELECT
	*
FROM
	employees
WHERE
	performance_rating > (SELECT AVG(performance_rating) FROM employees) AND
    salary < (SELECT AVG(salary) FROM employees);


SELECT AVG(salary) FROM employees;
SELECT AVG(performance_rating) FROM employees;


-- 52) Find the total number of employees grouped by department and gender. Display only combinations 
--     having more than one employee. 
SELECT
	department,
    gender,
	COUNT(*) AS total_employees
FROM
	employees
GROUP BY
	department,
    gender
HAVING
	total_employees > 1
ORDER BY
	department;
    
    
    
-- 53) Find the departments where the average bonus is greater than 5000 and at least 2 employees have received 
--     a bonus. 
SELECT
	department,
    AVG(bonus) AS avg_bonus,
    SUM(CASE WHEN bonus IS NOT NULL THEN 1 ELSE 0 END) AS num_emp_got_bonus
FROM
	employees
GROUP BY
	department
HAVING
	avg_bonus > 5000 AND
    num_emp_got_bonus >= 2;
    
-- [HERE IN PLACE OF SUM, I CAN SIMPLY USE COUNT AS WELL, WHICH WILL ONLY COUNT THE RECORDS WITH SOME VALUES. 
--  IN THAT WAY I CAN AVOID THE WHOLE CASE WHEN CONDITION. ]




-- 54) Display the top 5 employees based on performance rating. If two employees have the same rating,
--     prioitize the one with the higher salary. 
SELECT
	*
FROM
	employees
ORDER BY
	performance_rating DESC,
    salary DESC
LIMIT
	5;
    
    
    
-- 55) Find the percentage of employees in each city who are working remotely. 
SELECT
	city,
    SUM(CASE WHEN is_remote = 1 THEN 1 ELSE 0 END) AS emp_working_remote,
    COUNT(*) AS total_emp,
    ROUND((SUM(CASE WHEN is_remote = 1 THEN 1 ELSE 0 END) * 100) / 
    COUNT(*), 2) AS percentage_working_remote
FROM
	employees
GROUP BY
	city;
    
    
    
-- 56) Find the department where the difference between average male salary and average female salary is the highest.
--     Consider only departments containing both genders. 
SELECT
	department,
    AVG(CASE WHEN gender = 'Male' THEN salary END) AS avg_male_salary,
    AVG(CASE WHEN gender = 'Female' THEN salary END) AS avg_female_salary,
    ABS((AVG(CASE WHEN gender = 'Male' THEN salary END)) - 
    (AVG(CASE WHEN gender = 'Female' THEN salary END))) AS salary_difference
FROM
	employees
GROUP BY
	department
HAVING
	avg_male_salary IS NOT NULL AND 
	avg_female_salary IS NOT NULL
ORDER BY 
	salary_difference DESC
LIMIT
	1;
    
-- [ANOTHER WAY]
SELECT
	department,
    ABS((AVG(CASE WHEN gender = 'Male' THEN salary END)) - 
    (AVG(CASE WHEN gender = 'Female' THEN salary END))) AS salary_difference
FROM
	employees
GROUP BY
	department
HAVING
	COUNT(CASE WHEN gender = 'Male' THEN 1 END) > 0 AND
    COUNT(CASE WHEN gender = 'female' THEN 1 END) > 0
ORDER BY 
	salary_difference DESC
LIMIT
	1;
    
    
    
-- 57) Display employees who joined in the same year as the earliest- joining employee.
SELECT
	*
FROM
	employees
WHERE
	YEAR(joining_date) = (SELECT 
							YEAR(MIN(joining_date))
						  FROM
							employees);

SELECT
	*
FROM
	employees
ORDER BY
	YEAR(joining_date)
LIMIT
	1;
    
    
    
-- 58) Find the departments where the average salary of active employees is lower than the average salary 
--     of inactive employees. 
SELECT
	department,
    AVG(CASE WHEN employment_status = 'Active' THEN salary END) AS avg_active_salary,
    AVG(CASE WHEN employment_status = 'inactive' THEN salary END) AS avg_inactive_salary
FROM
	employees
GROUP BY
	department
HAVING
	avg_active_salary < avg_inactive_salary;
    
    
    
-- 59) Calculate the total bonus paid by each department, including  employees with null bonuses as zero.
--     Sort in descending oerder.
SELECT
	department,
    COALESCE(SUM(bonus), 0) AS total_bonus,
    COUNT(bonus)
FROM
	employees
GROUP BY
	department
ORDER BY
	total_bonus DESC;
    
    
    
-- 60) Find the number of employees grouped by age categories. Below 25, 25-30, 31-35, Above 35. 
SELECT
	CASE 
		WHEN TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) < 25
			THEN 'Below 25'
		WHEN TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) BETWEEN 25 AND 30 
			THEN '25-30'
		WHEN TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) BETWEEN 31 AND 35
			THEN '31-35'
		WHEN TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) > 35 
			THEN 'Above 35' 
		END AS age_category,
	COUNT(*) AS total_employees
FROM
	employees
GROUP BY
	age_category;
    
    
    
-- 61) Find the departments where more than 60% of employees have a peformance rating of at least 4.0
SELECT
	department,
    COUNT(CASE WHEN performance_rating >= 4.0 THEN performance_rating END) AS good_performance_rating,
    COUNT(*) AS total_employees,
	ROUND((COUNT(CASE WHEN performance_rating >= 4.0 THEN performance_rating END) * 100) / 
    COUNT(*), 2) AS percenatge_good_performance_rating
FROM
	employees
GROUP BY
	department
HAVING
	((good_performance_rating * 100)/total_employees) >= 60;

-- [OTHER WAY]
SELECT
	department,
	ROUND((COUNT(CASE WHEN performance_rating >= 4.0 THEN performance_rating END) * 100) / 
    COUNT(*), 2) AS High_rating_percentage
FROM
	employees
GROUP BY
	department
HAVING
	High_rating_percentage >= 60;



-- 62) Display employees whose salary is greater than the department's average salary but whose performance rating is below 4.5.
SELECT
	department,
    AVG(salary) AS avg_salary
FROM
	employees
GROUP BY
	department;

SELECT
	e.*
FROM
	employees.e
WHERE
	performance_rating < 4.5 AND
    e.salary > (SELECT
					e2.department,
					AVG(e2.salary) AS avg_salary
				FROM
					employees.e2
				WHERE
					e2.department = e.department
			    GROUP BY
					e2.department);















select * from employees;
USE sql_practice;





