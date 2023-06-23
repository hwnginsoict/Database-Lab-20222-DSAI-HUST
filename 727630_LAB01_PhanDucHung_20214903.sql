-- Phan Duc Hung 20214903
-- Kip 1 chieu t4 (727630) - Week1

-- CREATE TABLE regions (
-- 	region_id int PRIMARY KEY,
-- 	region_name varchar(25));
	
-- CREATE TABLE countries (
-- 	country_id varchar(2) PRIMARY KEY,
-- 	country_name varchar(40),
-- 	region_id int,
-- 	CONSTRAINT countries_fk2 FOREIGN KEY (region_id) REFERENCES regions(region_id));
	
-- CREATE TABLE locations (
-- 	location_id int PRIMARY KEY,
-- 	street_address VARCHAR(25),
-- 	postal_code VARCHAR(12),
-- 	city VARCHAR(30),
-- 	state_province VARCHAR(25),
-- 	country_id VARCHAR(2),
-- 	CONSTRAINT locations_fk FOREIGN KEY (country_id) REFERENCES countries(country_id));

-- CREATE TABLE departments (
-- 	department_id int PRIMARY KEY,
-- 	department_name VARCHAR(30),
-- 	manager_id int,
-- 	location_id int,
-- 	CONSTRAINT departments_fk FOREIGN KEY (location_id) REFERENCES locations(location_id));
	
-- CREATE TABLE jobs (
-- 	job_id varchar(10) PRIMARY KEY,
-- 	job_title varchar(35),
-- 	min_salary int,
-- 	max_salary int
-- );

-- CREATE TABLE employees (
-- 	employee_id int PRIMARY KEY,
-- 	first_name varchar(20),
-- 	last_name varchar(25),
-- 	email varchar(25),
-- 	phone_number varchar(20),
-- 	hire_date date,
-- 	job_id varchar(10),
-- 	salary int,
-- 	commission_pct decimal(18,3),
-- 	manager_id int,
-- 	department_id int,
-- 	CONSTRAINT employees_fk1 FOREIGN KEY (job_id) REFERENCES jobs(job_id),
-- 	CONSTRAINT employees_fk2 FOREIGN KEY (department_id) REFERENCES departments(department_id)
-- );

-- CREATE TABLE job_grades (
-- 	grade_level varchar(2) primary key,
-- 	lowest_sal int,
-- 	highest_sal int
-- );

-- CREATE TABLE job_history (
-- 	employee_id int,
-- 	start_date date,
-- 	end_date date,
-- 	job_id varchar(10),
-- 	department_id int,
-- 	constraint job_history_fk1 foreign key (employee_id) references employees(employee_id),
-- 	constraint job_history_fk2 foreign key (job_id) references jobs(job_id),
-- 	constraint job_history_fk3 foreign key (department_id) references departments(department_id),
-- 	primary key(employee_id, start_date)
-- );

-- Ex1:
-- insert into regions values (1,'SEA');
-- insert into countries(country_id, country_name, region_id) values
-- (01, 'Vietnam', 1);

-- Ex2:
-- insert into countries(country_id, country_name) values (02, 'Thailand')

-- Ex3:
-- select * into country_new from countries;
-- select * from country_new

-- Ex4:
-- insert into countries values (03, 'Cambodia', Null)

-- Ex5:
-- insert into countries values
-- (04, 'Singapore', Null),
-- (05, 'Indonesia', Null),
-- (06, 'Malaysia', Null)

-- Ex6:
-- delete from country_new
-- insert into country_new values
-- ('c1','India',1001),
-- ('c2','USA',1007),
-- ('c3','India',1003)
-- insert into regions values
-- (1001,Null),
-- (1007,Null),
-- (1003,Null)

-- insert into countries (country_id, country_name, region_id)
-- select * from country_new

-- Ex7:
-- insert into jobs values (00011,'police',10000,50000)

-- Ex10: I use PostgreSQL so there is no auto_increment, instead there is serial

-- CREATE TABLE countries_0 (
-- 	country_id serial PRIMARY KEY,
-- 	country_name varchar(40),
-- 	region_id int)
-- insert into countries_0 values (10,'France',5)
-- insert into countries_0 values (11,'Germany',5)

-- Ex11:

-- CREATE TABLE countries_0 (
-- 	country_id serial PRIMARY KEY,
-- 	country_name varchar(40),
-- 	region_id int)

-- alter table countries_0
-- alter country_name set default 'N/A'

-- insert into countries_0(country_id,region_id) values (13 ,5)

-- Ex12:
-- insert into job_history (job_id)
-- select job_id from jobs

-- Ex13
-- insert into employees (department_id, manager_id)
-- select department_id, manager_id
-- from departments
-- where department_id in (select department_id
-- 					   from departments
-- 					   group by department_id, manager_id)

-- Ex14:
-- insert into employees (department_id, job_id)
-- select department_id, job_id
-- from departments, jobs
-- where department_id in (select department_id
-- 					   from departments) and job_id in (select job_id
-- 													   from jobs)