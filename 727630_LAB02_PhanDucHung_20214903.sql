-- Phan Duc Hung 20214903
-- Kip 1 chieu t4 (727630) - Week2

--SELECT

--Ex1:
-- select first_name, last_name
-- from employees

--Ex2:
-- select distinct department_id
-- from employees

--Ex3:
-- select *
-- from employees
-- where date_part('year', hire_date) = 2022

--Ex4:
-- select first_name, last_name, salary, salary*0.15 as PF
-- from employees

--Ex5:
-- select * 
-- from
-- (select first_name, last_name, salary, salary*0.15 as PF
-- from employees ) as p
-- where pf > 10000

--Ex6:
-- select *
-- from employees e join departments d on e.department_id = d.department_id

--Ex7:
-- select 171*214+625 as calculte

--Ex8:
-- select sum(salary) as total
-- from employees

--Ex9:
-- select max(salary), min(salary)
-- from employees

--Ex10:
-- select count(e.employee_id) as num , avg(e.salary)
-- from employees e

--Ex11:
-- select count(e.employee_id), department_id
-- from employees e
-- group by e.department_id

--Ex12:
-- select count(*)
-- from jobs
-- where job_id in (select job_id from employees)

--Ex13:
-- select concat(first_name,' ', last_name) as name
-- from employees

--Ex14:
-- select ltrim(first_name)
-- from employees

--Ex15:
-- select*
-- from employees
-- limit 10

--Ex16:
-- select round(salary/12,2) as monthly_salary
-- from employees

--Ex17:
-- select salary/12 as monthly_salary
-- from employees
-- where salary/12 < 5000

--JOIN

--Ex1:
-- select location_id, street_address, city, state_province, country_name
-- from locations l join countries c on l.country_id = c.country_id

--Ex2:
-- select first_name, last_name, department_id, department_name
-- from employees e natural join departments d 

--Ex3:
-- select first_name, last_name, d.department_id, department_name
-- from employees e ,departments d, locations l 
-- where l.city = 'London' and e.department_id = d.department_id and d.location_id = l.location_id

--Ex4:
-- select e.employee_id, e.last_name, m.employee_id, m.last_name
-- from employees e join employees m on e.manager_id = m.employee_id

--Ex5:
-- select e.first_name, e.last_name, e.hire_date
-- from employees e join (select hire_date from employees where last_name = 'Jones') j on e.hire_date > j.hire_date

--Ex7:
-- select jh.employee_id, j.job_title, (end_date - start_date) as num_day
-- from job_history jh join jobs j on jh.job_id = j.job_id
-- where jh.department_id = 90

--Ex8:
-- select d.department_id, d.department_name, m.first_name
-- from departments d join employees m on d.manager_id = m.employee_id

--Ex9:
-- select d.department_id, d.department_name, m.first_name, m.last_name, l.city
-- from departments d join employees m on d.manager_id = m.employee_id join locations l on d.location_id = l.location_id

--Ex11:
-- select j.job_title, m.employee_id, m.first_name, m.last_name, (m.salary - j.min_salary) as dif
-- from employees m join jobs j on m.job_id = j.job_id

--Ex12:
-- select *
-- from job_history jh
-- where employee_id in (select employee_id from employees where salary > 10000)

--Ex13:
-- select d.department_id, d.department_name, m.first_name, m.last_name, m.hire_date, m.salary
-- from departments d join employees m on d.manager_id = m.employee_id
-- where current_date - m.hire_date > 15*365

--GROUP BY

--Ex1:
-- select count(distinct job_id) as num
-- from employees e

--Ex2:
-- select department_id, sum(salary) as total
-- from employees
-- group by department_id

--Ex3:
-- select job_id,min_salary
-- from jobs
-- group by job_id

--Ex4:
-- select max_salary
-- from jobs
-- where job_title = 'Programmer'

--Ex5:
-- select avg(salary), count(employee_id)
-- from employees 
-- where department_id = 90

--Ex6:
-- select max(salary), min(salary), avg(salary)
-- from employees

--Ex8:
-- select (max(salary)- min(salary)) as df
-- from employees

--Ex9;
-- select m.employee_id, min(e.salary)
-- from employees m join employees e on m.employee_id = e.manager_id
-- group by m.employee_id

--Ex11:
-- select job_id, avg(salary) 
-- from employees e
-- where job_id not in (select job_id from jobs where job_title = 'Programmer')
-- group by job_id

--Ex13:
-- select job_id, max(salary) 
-- from employees
-- group by job_id
-- having max(salary) >= 4000

--Ex14:
-- select department_id, avg(salary)
-- from employees 
-- group by department_id
-- having count(*) > 10



