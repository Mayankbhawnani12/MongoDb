-- Database Creation
CREATE DATABASE ORG123;
SHOW DATABASES;
USE ORG123;

-- Table Creation
CREATE TABLE Worker (
    WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    FIRST_NAME CHAR(25),
    LAST_NAME CHAR(25),
    SALARY INT(15),
    JOINING_DATE DATETIME,
    DEPARTMENT CHAR(25)
);

-- Data Insertion
INSERT INTO Worker (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
    (001, 'Monika', 'Arora', 100000, '2014-02-20 09:00:00', 'HR'),
    (002, 'Niharika', 'Verma', 80000, '2014-06-11 09:00:00', 'Admin'),
    (003, 'Vishal', 'Singhal', 300000, '2014-02-20 09:00:00', 'HR'),
    (004, 'Amitabh', 'Singh', 500000, '2014-02-20 09:00:00', 'Admin'),
    (005, 'Vivek', 'Bhati', 500000, '2014-06-11 09:00:00', 'Admin'),
    (006, 'Vipul', 'Diwan', 200000, '2014-06-11 09:00:00', 'Account'),
    (007, 'Satish', 'Kumar', 75000, '2014-01-20 09:00:00', 'Account'),
    (008, 'Geetika', 'Chauhan', 90000, '2014-04-11 09:00:00', 'Admin');

-- Queries
SELECT * FROM Worker WHERE SALARY > 100000 AND DEPARTMENT = 'HR';
SELECT * FROM Worker WHERE SALARY > 200000;
SELECT * FROM Worker WHERE SALARY BETWEEN 100000 AND 200000;
SELECT * FROM Worker WHERE WORKER_ID IN (2,4,6,8);
SELECT * FROM Worker WHERE SALARY BETWEEN 200000 AND 400000 AND WORKER_ID IN (1, 2, 3, 4, 5);
SELECT * FROM Worker WHERE DEPARTMENT = 'HR' ORDER BY SALARY ASC;
SELECT MIN(SALARY) FROM Worker WHERE DEPARTMENT = 'HR';
SELECT FIRST_NAME, LAST_NAME FROM Worker WHERE DEPARTMENT = 'HR' AND SALARY = (SELECT MIN(SALARY) FROM Worker WHERE DEPARTMENT = 'HR');
SELECT DEPARTMENT, FIRST_NAME, LAST_NAME, SALARY FROM Worker w WHERE SALARY = (SELECT MAX(SALARY) FROM Worker WHERE DEPARTMENT = w.DEPARTMENT);
SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT FROM Worker WHERE (DEPARTMENT = 'Admin' OR DEPARTMENT = 'Account') AND SALARY = (SELECT MIN(SALARY) FROM Worker WHERE DEPARTMENT IN ('Admin', 'Account'));
SELECT * FROM Worker;
SELECT DISTINCT DEPARTMENT FROM Worker;

-- Alias Usage
SELECT WORKER_ID AS emp_code FROM Worker;

-- UNION and UNION ALL
SELECT WORKER_ID FROM Worker UNION SELECT FIRST_NAME FROM Worker;
SELECT DEPARTMENT, SALARY FROM Worker WHERE DEPARTMENT = 'HR' AND SALARY > 100000 UNION SELECT DEPARTMENT, SALARY FROM Worker WHERE DEPARTMENT = 'Admin' AND SALARY > 100000 ORDER BY SALARY;
SELECT DEPARTMENT, WORKER_ID FROM Worker WHERE DEPARTMENT = 'HR' UNION SELECT DEPARTMENT, WORKER_ID FROM Worker WHERE DEPARTMENT = 'Account' ORDER BY WORKER_ID;

-- CASE Statement
SELECT WORKER_ID, FIRST_NAME, DEPARTMENT,
    CASE 
        WHEN SALARY > 300000 THEN 'Rich people'
        WHEN SALARY BETWEEN 100000 AND 300000 THEN 'Middle stage'
        ELSE 'Poor people'
    END AS People_stage_wise
FROM Worker;

-- Grouping and Aggregations
SELECT DEPARTMENT, COUNT(WORKER_ID) AS Total_Employees FROM Worker GROUP BY DEPARTMENT ORDER BY DEPARTMENT;
SELECT DISTINCT DEPARTMENT, (SELECT COUNT(*) FROM Worker AS W2 WHERE W2.DEPARTMENT = W1.DEPARTMENT) AS Total_Employees FROM Worker AS W1 ORDER BY DEPARTMENT;
SELECT 'HR' AS DEPARTMENT, COUNT(WORKER_ID) AS Total_Employees FROM Worker WHERE DEPARTMENT = 'HR' UNION SELECT 'Admin' AS DEPARTMENT, COUNT(WORKER_ID) AS Total_Employees FROM Worker WHERE DEPARTMENT = 'Admin' UNION SELECT 'Account' AS DEPARTMENT, COUNT(WORKER_ID) AS Total_Employees FROM Worker WHERE DEPARTMENT = 'Account' ORDER BY DEPARTMENT;

-- Finding Departments with Min and Max Employees
(SELECT DEPARTMENT, COUNT(DEPARTMENT) AS total_employees FROM Worker GROUP BY DEPARTMENT ORDER BY total_employees ASC LIMIT 1) UNION ALL (SELECT DEPARTMENT, COUNT(DEPARTMENT) AS total_employees FROM Worker GROUP BY DEPARTMENT ORDER BY total_employees DESC LIMIT 1);


create table category(
c_id int primary key,
c_name varchar(25) not null unique,
c_decrp varchar(250) not null
);

insert into category values (102, 'furnitures', 'it stores all set of wooden items');
select * from category;
desc category;

use org123;
CREATE TABLE Products (
    P_ID int primary key,
    p_Name varchar(250) NOT NULL,
    c_id int ,
    CONSTRAINT c_id FOREIGN KEY (c_id)
    REFERENCES category(c_id)
);
show tables from org123;
desc products;

drop table products;

insert into products values (904, 'Wooden table', null);
select * from products;


select * from category;

delete from category where c_id=101;

drop table category;


create database saturday;
use saturday;

create table category(
c_id int primary key,
c_name varchar(25) not null unique,
c_decrp varchar(250) not null
);

insert into category values (101, 'electronics', 'it stores all set of electronics items');
select * from category;
desc category;

CREATE TABLE Products (
    P_ID int primary key,
    p_Name varchar(250) NOT NULL,
    c_id int ,
    CONSTRAINT c_id FOREIGN KEY (c_id)
    REFERENCES category(c_id) on delete cascade
);

insert into products values (904, 'INTEL I5 Processor', 101);
select * from products;
delete from category where c_id=101;
select * from category;

CREATE DATABASE ORG123;
SHOW DATABASES;
USE ORG123;

CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');

CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');

create table vitBhopal (id int primary key, name varchar(20) not null,
department varchar(25) not null);
insert into vitbhopal values (104,'Karthik','cs'),(103,'Arun','cs');

create table vit (id int primary key, name varchar(20) not null,
college varchar(25) not null);
insert into vit values (104,'Karthik','chennai'),(103,'Arun','bhopal');
select * from vit;

select * from vitbhopal;

select name as WinnerOfTheYear from vitbhopal
where id = (select id from vit where college='bhopal');


CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');

CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');
CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');
 
 
 
