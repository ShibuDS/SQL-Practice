CREATE DATABASE sql_practice;
USE sql_practice;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    department VARCHAR(50),
    job_title VARCHAR(50),
    salary DECIMAL(10,2),
    joining_date DATE,
    birth_date DATE,
    city VARCHAR(50),
    state VARCHAR(50),
    gender VARCHAR(10),
    employment_status VARCHAR(20) DEFAULT 'Active',
    manager_id INT,
    performance_rating DECIMAL(3,1),
    bonus DECIMAL(10,2),
    is_remote BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


INSERT INTO employees
(first_name, last_name, email, phone, department, job_title,
 salary, joining_date, birth_date, city, state, gender,
 employment_status, manager_id, performance_rating, bonus, is_remote)
VALUES

('Amit', 'Sharma', 'amit.sharma@email.com', '9876543210',
 'IT', 'Data Analyst', 65000, '2022-03-15', '1997-05-12',
 'Bangalore', 'Karnataka', 'Male', 'Active', 5, 4.2, 5000, TRUE),

('Priya', 'Verma', 'priya.verma@email.com', '9876543211',
 'HR', 'HR Executive', 48000, '2021-07-20', '1995-08-25',
 'Mysore', 'Karnataka', 'Female', 'Active', 6, 4.0, 3000, FALSE),

('Rahul', 'Patel', 'rahul.patel@email.com', '9876543212',
 'Finance', 'Financial Analyst', 72000, '2020-01-10', '1994-11-03',
 'Mumbai', 'Maharashtra', 'Male', 'Active', 7, 4.5, 7000, TRUE),

('Sneha', 'Reddy', 'sneha.reddy@email.com', '9876543213',
 'IT', 'Data Scientist', 95000, '2023-06-01', '1998-02-18',
 'Hyderabad', 'Telangana', 'Female', 'Active', 5, 4.8, 10000, TRUE),

('Vikram', 'Singh', 'vikram.singh@email.com', '9876543214',
 'Sales', 'Sales Executive', 55000, '2022-09-12', '1996-12-09',
 'Delhi', 'Delhi', 'Male', 'Active', 8, 3.8, 6000, FALSE),

('Neha', 'Gupta', 'neha.gupta@email.com', '9876543215',
 'Marketing', 'Marketing Analyst', 62000, '2021-11-05', '1997-07-14',
 'Pune', 'Maharashtra', 'Female', 'Active', 9, 4.1, 4500, TRUE),

('Arjun', 'Mehta', 'arjun.mehta@email.com', '9876543216',
 'IT', 'Software Engineer', 85000, '2019-04-22', '1993-09-21',
 'Bangalore', 'Karnataka', 'Male', 'Active', 5, 4.6, 8000, FALSE),

('Kavya', 'Nair', 'kavya.nair@email.com', '9876543217',
 'HR', 'Recruiter', 52000, '2023-01-16', '1999-03-30',
 'Kochi', 'Kerala', 'Female', 'Active', 6, 3.9, NULL, FALSE),

('Rohit', 'Kumar', 'rohit.kumar@email.com', '9876543218',
 'Finance', 'Accountant', 58000, '2020-08-19', '1995-06-11',
 'Chennai', 'Tamil Nadu', 'Male', 'Inactive', 7, 3.5, 2500, FALSE),

('Anjali', 'Joshi', 'anjali.joshi@email.com', '9876543219',
 'Sales', 'Sales Manager', 90000, '2018-02-05', '1990-10-17',
 'Delhi', 'Delhi', 'Female', 'Active', NULL, 4.7, 12000, TRUE),

('Karan', 'Malhotra', 'karan.malhotra@email.com', '9876543220',
 'IT', 'ML Engineer', 110000, '2024-02-12', '1999-01-25',
 'Bangalore', 'Karnataka', 'Male', 'Active', 5, 4.9, 15000, TRUE),

('Pooja', 'Shah', 'pooja.shah@email.com', '9876543221',
 'Marketing', 'Content Writer', 45000, '2022-05-30', '1998-04-19',
 'Ahmedabad', 'Gujarat', 'Female', 'Active', 9, 3.7, 2000, FALSE),

('Suresh', 'Iyer', 'suresh.iyer@email.com', '9876543222',
 'IT', 'Database Administrator', 88000, '2017-10-11', '1989-12-05',
 'Chennai', 'Tamil Nadu', 'Male', 'Active', 5, 4.4, 9000, FALSE),

('Divya', 'Menon', 'divya.menon@email.com', '9876543223',
 'Finance', 'Finance Manager', 105000, '2016-06-18', '1988-05-22',
 'Kochi', 'Kerala', 'Female', 'Active', NULL, 4.6, 11000, TRUE),

('Manish', 'Yadav', 'manish.yadav@email.com', '9876543224',
 'Sales', 'Sales Executive', 51000, '2024-04-01', '2000-08-16',
 'Jaipur', 'Rajasthan', 'Male', 'Active', 10, 3.6, NULL, FALSE);