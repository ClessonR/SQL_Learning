CREATE TABLE account(
    user_id SERIAL PRIMARY KEY, 
    username VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP NOT NULL ,
    last_login TIMESTAMP
)

CREATE TABLE job(
    job_id SERIAL PRIMARY KEY,
    job_name VARCHAR(255) UNIQUE NOT NULL,
)

CREATE TABLE account_job ( 
    user_id INTEGER REFERENCES account(user_id),
    job_id INTEGER REFERENCES job(job_id),
    hired_data TIMESTAMP NOT NULL
)


INSERT INTO account(username, password, email, created_at)
VALUES('Jose','password','jose@mail.com',CURRENT_TIMESTAMP)

insert into job(job_name) values ('astronaut')

insert into account_job(user_id, job_id, hire_date) VALUES (1,1,CURRENT_TIMESTAMP)

UPDATE account SET last_login = CURRENT_TIMESTAMP;

UPDATE account SET last_login = created_at

update account set last_login = CURRENT_timestamp RETURNING email,created_at, last_login

ALTER TABLE information 
rename to new_info

alter table new_info
rename column person to people

CREATE TABLE employees(
    emp_id SERIAL PRIMARY KEY, 
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    birthdate DATE CHECK(birthdate>'1900-01-01') ,
    hire_date DATE  CHECK(hire_date> birthdate),
    salary INTEGER  CHECK(salary>0),
)

-- ! Assessment 3 Solutions 

CREATE TABLE students(
	student_id SERIAL PRIMARY KEY,
	first_name varchar(255),
    last_name varchar(255),
    home_room_number INTEGER,
    phone_number  VARCHAR(1000) NOT NULL UNIQUE,
    email VARCHAR(255) UNIQUE,
    graduation_year INTEGER
)

CREATE TABLE teachers(
    teacher_id SERIAL PRIMARY KEY,
    first_name varchar(255),
    last_name varchar(255),
    home_room_number INTEGER,
    department VARCHAR(255),
    phone_number VARCHAR(1000) NOT NULL UNIQUE ,
    email VARCHAR(255) UNIQUE
)


-- ? Conditional Expressions and Procedures

-- General CASE
SELECT customer_id,
CASE 
    WHEN (customer_id <= 100) THEN 'Premium'
    WHEN (customer_id <= 200) THEN 'Plus'
    ELSE 'Default'
END AS customer_class
FROM customer


-- CASE expression
SELECT customer_id,
CASE customer_id, 
    WHEN 2 THEN 'Winner'
    WHEN 5 THEN 'Second Place'
    ELSE 'Normal'
END AS 'Raffle Results'
FROM customer

SELECT 
SUM(CASE rental_rate 
    WHEN 0.99 THEN 1
    ELSE 0 as 'Rental Rate'
END)
FROM film

SELECT 
SUM(CASE rental_rate 
    WHEN 0.99 THEN 1
    ELSE 0 
END) AS bargains,
SUM(CASE rental_rate 
    WHEN 2.99 THEN 1
    ELSE 0
END) AS regular
FROM film

SELECT 
SUM(CASE rating 
    WHEN 'R' THEN 1
    ELSE 0 
END) AS r,
SUM(CASE rating 
    WHEN 'PG' THEN 1
    ELSE 0 
END) AS pg,
SUM(CASE rating 
    WHEN 'PG-13' THEN 1
    ELSE 0 
END) AS pg13
FROM film

SELECT(
    SUM(CASE WHEN department = 'A' then 1 else 0 end) / 
    SUM(case when department ='B' then 1 else 0)
)

-- Doing the following will make the query not divide by zero, consequently preventing an error
SELECT(
    SUM(CASE WHEN department = 'A' then 1 else 0 end) / 
    NULLIF(SUM(case when department ='B' then 1 else 0 end),0)
) AS department_ratio
from depts