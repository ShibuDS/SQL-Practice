USE sql_practice;

SELECT 
	*
FROM 
	employees;
    
-- 1) Display all employees who belongs to the IT department.
SELECT *
FROM 
	employees
WHERE
	department = "IT";
    
-- 2) Display all employees whose salary is greater than 70000.
SELECT *
FROM
	employees
WHERE
	salary > 70000;
    
-- 3) Display all employees whose salary is less than 60000.
SELECT *
FROM
	employees
WHERE
	salary < 60000;
    
-- 4) Display all employees whose salary is exactly 85000.
SELECT *
FROM
	employees
WHERE
	salary = 85000;
    
-- 5) Display all the employees who lives in Banglore.
SELECT *
FROM 
	employees
WHERE
	city = 'Bangalore';
    
-- 6) Display all employees who are currently active.
SELECT *
FROM 
	employees
WHERE
	employment_status = 'Active';
    
-- 7) Display all employees who are Female.
SELECT *
FROM
	employees
WHERE 
	gender = "Female";
    
-- 8) Display all employees who are working remotely.
SELECT *
FROM 
	employees
WHERE
	is_remote = 1;
    
-- 9) Display all employees who are not working remotely.
SELECT *
FROM
	employees
WHERE
	is_remote = 0;
    
-- 10) Display employees whose performance rating is greater than 4.0
SELECT *
FROM
	employees
WHERE
	performance_rating > 4.0;
    
-- 11) Display employees whose performance rating is less than or equal to 4.0
SELECT *
FROM
	employees
WHERE
	performance_rating <= 4.0;
    
-- 12) Display employees whose salary is between 50000 and 80000
SELECT *
FROM 
	employees
WHERE
	salary BETWEEN 50000 AND 80000;
    
 SELECT *
FROM 
	employees
WHERE
	salary > 50000 AND salary < 80000;   
    
-- 13) Display employees whose salary is not between 50000 and 80000.
SELECT *
FROM 
	employees
WHERE
	salary NOT BETWEEN 50000 AND 80000;

-- 14) Display employees who belong to either IT OR Finance.
SELECT *
FROM
	employees
WHERE 
	department IN ('IT', 'Finance'); 
 
 SELECT *
FROM
	employees
WHERE 
	department = 'IT' OR department = 'Finance';
    
-- 15) Display employees who either belongs to Bangalore, Mysore or Chennai.
SELECT *
FROM 
	employees
WHERE
	city IN ('Bangalore', 'Mysore', 'Chennai');
    
-- 16) Display employees who ar not from IT department.
SELECT *
FROM
	employees
WHERE
	department != 'IT';
    
-- 17) Display employees whose bonus is NULL.
SELECT *
FROM
	employees
WHERE
	bonus IS NULL;
    
-- 18) Display employees whose bonus is NOT NULL.
SELECT *
FROM
	employees
WHERE
	bonus IS NOT NULL;
    
-- 19) Display employees who have no manager assigned.
SELECT *
FROM
	employees
WHERE
	manager_id IS NULL;
    
-- 20) Display employees whose job title contain the word Analyst.
SELECT *
FROM
	employees
WHERE
	job_title LIKE '%Analyst%';
    
-- 21) Display employee whose first name starts with A  
SELECT *
FROM 
	employees
WHERE 
	first_name LIKE 'A%';
    
 -- 22) Display employees whose lst name ends with A 
 SELECT *
 FROM 
	employees 
WHERE
	last_name LIKE '%A';
    
-- 23) Display employees whose first name contain i    
SELECT *
FROM
	employees
WHERE 
	first_name LIKE '%i%';
  
-- 24) Display employees whose department is either IT, HR OR Sales and whose salary greater than 60000 
SELECT *
FROM 
	employees
WHERE
	department IN ('IT', 'HR', 'Sales') AND
    salary > 60000;
  
-- 25) Display active employees from IT whose salary is greater than 60000
SELECT *
FROM
	employees
WHERE
	employment_status = 'Active' AND
	department = 'IT' AND
    salary > 60000;

-- 26) Display employees from IT who have a performance rating greater than 4.5 
SELECT *
FROM 
	employees
WHERE
	department = 'IT' AND
    performance_rating > 4.5;
    
-- 27) Display employees from finance whose salary is greater than 60000 and who are working remotely
SELECT *
FROM 
	employees
WHERE
	department = 'Finance' AND
    salary > 60000 AND
    is_remote = 1;
    
-- 28) Display female employees whose salary is greater than 60000
SELECT *
FROM
	employees
WHERE 
	gender = 'Female' AND
    salary > 60000;
    
-- 29) Display male employees whose salary is greater than 60000
  SELECT *
FROM
	employees
WHERE 
	gender = 'Male' AND
    salary > 60000;

-- 30) Display employees who are active and have a performance rating greater than 4.0
SELECT *
FROM 
	employees
WHERE 
	employment_status = 'Active' AND
    performance_rating > 4.0;
    
-- 31) Display employees from IT or Finance whose salary is greater than 70000
SELECT *
FROM
	employees
WHERE
	department = 'IT' AND
    salary > 70000;
    
-- 32) Display employees whose salary is greater than 80000 but whose performance rating is less than 4.7
SELECT *
FROM
	employees
WHERE
	salary > 80000 AND
    performance_rating < 4.7;
    
-- 33) Display employees whose bonus is greater than 5000 and whose salary is less than 100000
SELECT *
FROM
	employees
WHERE
	bonus > 5000 AND
    salary < 100000;
    
-- 34) Display employees who joined after 2022-01-01
SELECT *
FROM 
	employees
WHERE 
	joining_date > '2022-01-01';
    
-- 35) Display employees who joined before 2022-01-01
SELECT *
FROM 
	employees
WHERE 
	joining_date < '2022-01-01';
  
-- 36) Display employees who joined between 2020-01-01 and 2023-12-31 
SELECT *
FROM 
	employees
WHERE
	joining_date BETWEEN '2020-01-01' AND '2023-12-31';
  
-- 37) Display employees born after 1997-01-01
SELECT *
FROM
	employees
WHERE
	birth_date > '1997-01-01';
    
-- 38) Display employees who are active, working remotely and earning more than 70000
SELECT *
FROM
	employees
WHERE
	employment_status = 'Active' AND
    is_remote = 1 AND
    salary > 70000;
    
-- 39) Display employees from Bangalore whose salary is between 60000 and 100000
SELECT *
FROM
	employees
WHERE 
	city = 'Bangalore' AND
    salary BETWEEN 60000 AND 100000;
  
-- 40) Display employees who are either from Karnataka or Maharashtra
SELECT *
FROM
	employees
WHERE
	state IN ('Karnataka', 'Maharashtra');

-- 41) Display all the employees ordered by salary from lowest to highest
SELECT *
FROM
	employees
ORDER BY
	SALARY ASC;
    
-- 42) Display all the employees ordered by salary from highest to lowest 
SELECT *
FROM
	employees
ORDER BY 
	salary DESC;
    
-- 43) Display employees ordered alphabetically by first name
SELECT *
FROM
	employees
ORDER BY
	first_name;
    
-- 44) Display employees ordered by department alphabetically
SELECT *
FROM
	employees
ORDER BY
	department;
    
-- 45) Display employees ordered by performance ratings from highest to lowest
SELECT *
FROM 
	employees
ORDER BY
	performance_rating DESC;
  
-- 46) Display employees ordered by joining date from oldest to newest.
SELECT *
FROM
	employees
ORDER BY
	joining_date;
    
-- 47) Display employees ordered by joining date from newest to oldest.
SELECT *
FROM
	employees
ORDER BY
	joining_date DESC;
    
-- 48) Display employees ordered by salary descending and first name ascending.
SELECT *
FROM
	employees
ORDER BY 
	salary DESC,
    first_name ASC;
    
-- 49) Displays employees ordered first by department and then by salary.
SELECT *
FROM
	employees
ORDER BY
	department,
    salary DESC;
  
-- 50) Display employees ordered by performance rating descending and salary descending.
SELECT *
FROM
	employees
ORDER BY
	performance_rating DESC,
    salary DESC;
 
-- 51) Display only the top 5 highest paid employees
SELECT
	*
FROM
	employees
ORDER BY
	salary DESC
limit
	5;
    
-- 52) Display only the 3 employees with the lowest salaries
SELECT
	*
FROM
	employees
ORDER BY 
	salary 
LIMIT
	3;
    
-- 53) Display the 5 employees with the highest performance ratings
SELECT
	*
FROM
	employees
ORDER BY 
	performance_rating DESC
LIMIT
	5;
    
-- 54) Display the 5 employees who joined most recently
SELECT
	*
FROM
	employees
ORDER BY 
	joining_date DESC
LIMIT
	5;
    
-- 55) Display the active employees ordered by salary from highest to lowest
SELECT 
	*
FROM
	employees
WHERE 
	employment_status = 'Active'
ORDER BY
	salary DESC;
 
-- 56) Find the total number of employees
SELECT
	count(*)
FROM
	employees;
    
-- 57) Find the total salary paid to all the employees
 SELECT
	sum(salary) AS total_salary
FROM
	employees;
    
-- 58) Find the average salary of all employees
 SELECT
	AVG(salary) AS average_salary
FROM
	employees;
    
-- 59) Find the highest salary in the company
SELECT
	MAX(salary) AS highest_salary
FROM
	employees;
    
    -- OR
SELECT
	salary AS highest_salary
FROM
	employees
ORDER BY 
	salary DESC
LIMIT
	1;

-- 60) Find the lowest salary in the company
SELECT
	MIN(salary) AS minimum_salary
FROM
	employees;
 
-- 61) Find the average performance rating of all the employees
SELECT
	AVG(performance_rating) AS average_performance_rating
FROM
	employees;
    
-- 62) Find the highest performance rating
SELECT
	MAX(performance_rating) as highest_performance_rating
FROM
	employees;
    
-- 63) Find the lowest performance rating
SELECT
	MIN(performance_rating) as lowest_performance_rating
FROM
	employees;	
    
-- 64) Find the total bonus paid to employees
SELECT
	SUM(bonus) AS total_bonus
FROM
	employees;
    
-- 65) Find the average bonus
SELECT
	AVG(bonus) AS average_bonus
FROM
	employees;
    
-- 66) Find the highest bonus paid
SELECT
	MAX(bonus) AS highest_bonus
FROM
	employees;
    
-- 67) Find the number of employees who do not have a bonus
 SELECT
	COUNT(*) AS total_employees_without_bonus
FROM
	employees
WHERE
	bonus IS NULL;
    
-- 68) Find the number of employees who have received bonus
SELECT
	COUNT(*) AS total_employees_received_bonus
FROM
	employees
WHERE
	bonus IS NOT NULL;
    
-- 69) Find the number of employees working remotely
SELECT
	COUNT(*) AS number_of_employees_working_remotely
FROM 
	employees
WHERE
	is_remote = 1;
    
-- 70) Find the number of employees who have a manager assigned
SELECT
	COUNT(*) AS number_of_employees_manager_assigned
FROM
	employees
WHERE
	manager_id IS NOT NULL;
 
-- 71) Find the number of employees in each department
SELECT
	department,
	COUNT(*) AS total_employees
FROM 
	employees
GROUP BY 
	department;
    
-- 72) Find the average salary for each department
SELECT
	department,
    AVG(salary) AS average_salary
FROM
	employees
GROUP BY
	department;
    
-- 73) Find the total salary paid for each department
SELECT
	department,
	SUM(salary) AS total_salary
FROM
	employees
GROUP BY
	department;
    
-- 74) Find the highest salary in each department
SELECT
	department,
    MAX(salary) AS highest_salary
FROM
	employees
GROUP BY
	department;
    
-- 75) Find the lowest salary in each department
 SELECT
	department,
    MIN(salary) AS lowest_salary
FROM
	employees
GROUP BY
	department;
    
-- 76) Find the average performance rating for each department
SELECT
	department,
    AVG(performance_rating) as avg_rating
FROM
	employees
GROUP BY 
	department;
    
-- 77) Find the numner of employees in each city
SELECT
	CITY,
    COUNT(CITY) as number_of_employees
FROM
	employees
GROUP BY
	city;
    
-- 78) Find the numner of employees in each state
SELECT
	state,
    COUNT(state) as number_of_employees
FROM
	employees
GROUP BY
	state;
    
-- 79) Find the number of male and female employees
SELECT
	gender,
    COUNT(gender) as number_of_employees
FROM
	employees
GROUP BY
	gender;
    
-- 80) Find the average salary for male and female employees separately
SELECT
	gender,
    AVG(salary) AS average_salary
FROM
	employees
GROUP BY
	gender;
    
-- 81) Find the total bonus paid by each department
SELECT
	department,
    SUM(bonus) AS total_bonus
FROM
	employees
GROUP BY
	department;
    
-- 82) Find the average bonus paid by each department
 SELECT
	department,
    AVG(bonus) AS average_bonus
FROM
	employees
GROUP BY
	department;
    
-- 83) Find the highest performance ratings in each department
SELECT
	department,
    MAX(performance_rating) AS highest_rating
FROM
	employees
GROUP BY
	department;
    
-- 84) Find the number of active and inactive employees
SELECT
	employment_status,
    COUNT(employment_status)
FROM
	employees
GROUP BY
	employment_status;
    
-- 85) Find the number of remote and non_remote employees
SELECT
	is_remote,
    COUNT(is_remote) AS number_of_employees
FROM
	employees
GROUP BY
	is_remote;
 
 -- 86) Find the number of employees in each department and display the departments from highest employees count to lowest.
SELECT
	department,
    COUNT(department) AS number_of_employees
FROM
	employees
GROUP BY
	department
ORDER BY
	number_of_employees DESC;
    
-- 87)Find the average salary for each department and display departments from highest average salary to lowest.
SELECT
	department,
    AVG(salary) AS average_salary
FROM
	employees
GROUP BY
	department
ORDER BY 
	average_salary DESC;
    
-- 88) Find the total salary of each department and display the department from highest salary to lowest. 
SELECT
	department,
    SUM(salary) as total_salary
FROM
	employees
GROUP BY 
	department
ORDER BY 
	total_salary DESC;
    
-- 89) Find the highest salary of each department and display the department from highest salary to lowest. 
SELECT
	department,
    MAX(salary) as maximun_salary
FROM
	employees
GROUP BY 
	department
ORDER BY 
	maximun_salary DESC;
    
-- 90) Find the highest performace rating of each department and display the department from highest salary to lowest.
SELECT
	department,
    MAX(performance_rating) as highest_PR
FROM
	employees
GROUP BY 
	department
ORDER BY 
	highest_PR DESC;


-- 91) Display departments having more that 2 employees
 SELECT
	department,
    count(department) AS number_of_employees
FROM
	employees
GROUP BY
	department
HAVING
	number_of_employees > 2;

-- 92) Display departments having an average salary greater than 70000.
SELECT
	department,
    AVG(salary) AS average_salary
FROM 
	employees
GROUP BY
	department
HAVING
	average_salary > 70000;
    
-- 93) Display departments whose total salary is greater than 200000.
SELECT
	department,
    SUM(salary) AS total_salary
FROM
	employees
GROUP BY 
	department
HAVING
	total_salary > 200000;
    
-- 94) Display departments whose highest salary is greater than 90000.
SELECT
	department,
    MAX(salary) AS highest_salary
FROM
	employees
GROUP BY
	department
HAVING
	highest_salary > 90000;
    
-- 95) Display departments whose average performance rating is greater than 4.0
SELECT
	department,
    AVG(performance_rating) AS avg_per_rtng
FROM 
	employees
GROUP BY
	department
HAVING
	avg_per_rtng > 4.0;

-- 96) Display department having at least 3 employees and an average salary greater than 60000.
SELECT
	department,
    COUNT(*) AS number_of_employees,
    AVG(SALARY) AS average_salary
FROM
	employees
GROUP BY 
	department
HAVING
	number_of_employees >= 3 AND
    average_salary > 60000;
    
-- 97) Display cities having more than 1 employee.
SELECT
	CITY,
    COUNT(*) AS number_of_employees
FROM
	employees
GROUP BY
	city
HAVING
	number_of_employees > 1;
    
-- 98) Display states having more than 1 employee.
SELECT
	state,
    COUNT(*) AS number_of_employees
FROM
	employees
GROUP BY
	state
HAVING
	number_of_employees > 1;
    
-- 99) Display departments where the total bonus is greater than 15000.
SELECT
	department,
    SUM(bonus) AS total_bonus
FROM
	employees
GROUP BY
	department
HAVING
	total_bonus > 15000;
    
-- 100) Dispaly departments having more than 2 employees, where the average salary is greater than 60000,
--      and sort the result by average salary from highest to lowest.
SELECT
	department,
    count(*) AS number_of_employees,
    AVG(salary) AS average_salary
FROM
	employees
GROUP BY
	department
HAVING
	number_of_employees > 2 AND
	average_salary > 60000;

-- OR

 SELECT
	department,
    count(*) AS number_of_employees,
    AVG(salary) AS average_salary
FROM
	employees
GROUP BY
	department
HAVING
	number_of_employees > 2 AND
	average_salary > 60000
ORDER BY
	average_salary DESC;