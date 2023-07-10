-- Phan Duc Hung 20214903
-- Kip 1 chieu t4 (727630) - Week4

-- Ex1:
-- select concat(first_name, ' ', last_name) as name, salary
-- from employees
-- where salary > all (select salary from employees where last_name = 'Bull')

-- Ex2:
-- select concat(first_name, ' ', last_name) as name
-- from employees
-- where department_id in (select department_id from departments where department_name = 'IT')

-- Ex3:
-- select concat(first_name, ' ', last_name)
-- from employees
-- where manager_id is not null and department_id in (select department_id
-- 												  from (departments d join locations l on d.location_id = l.location_id) o join countries c on o.country_id = c.country_id
-- 												  where o.country_id = 'US' and country_name = 'United States of America')

-- Ex4:
-- select concat(first_name, ' ', last_name) as name
-- from employees
-- where employee_id in (select distinct manager_id
-- 					 from employees)

-- Ex5:
-- select concat(first_name, ' ', last_name) as name, salary
-- from employees
-- where salary > (select avg(salary) from employees)

-- Ex6:
-- select concat(first_name, ' ', last_name) as name, salary
-- from employees
-- where salary > (select avg(salary) from employees)
-- and department_id in (select department_id from departments where department_name = 'IT')

-- Ex7:
-- select concat(first_name, ' ', last_name) as name, salary
-- from employees
-- where salary > all (select salary from employees where last_name = 'Bell')

-- Ex8:
-- select concat(first_name, ' ', last_name) as name, salary
-- from employees e
-- where salary <= all (select salary from employees where department_id = e.department_id)

-- Ex9:
-- select concat(first_name, ' ', last_name) as name, salary
-- from employees e
-- where salary > all (select avg(salary) from employees where department_id = e.department_id)

-- Ex10:
-- select concat(first_name, ' ', last_name) as name, salary
-- from employees
-- where salary > all (select salary from employees where job_id = 'SH_CLERK')
-- order by salary;

-- Ex11:
-- select concat(first_name, ' ', last_name) as name
-- from employees
-- where employee_id not in (select manager_id from departments)

-- Ex12:
-- select employee_id, first_name, last_name, salary
-- from employees e
-- where salary > (select avg(salary) from employees where department_id = e.department_id)

-- Ex13:
-- select *
-- from employees
-- where mod(employee_id,2) = 0

-- Ex14:
-- select salary
-- from employees
-- order by salary desc
-- offset 5 limit 1

-- Ex15:
-- select salary
-- from employees
-- order by salary
-- offset 4 limit 1

-- Ex16:
-- select *
-- from employees
-- order by employee_id desc
-- limit 10

-- Ex17:
-- select department_id, department_name
-- from departments
-- where department_id not in (select distinct department_id
-- 						   from employees)

-- Ex18:
-- select salary
-- from employees
-- order by salary desc
-- limit 3

-- Ex19:
-- select salary
-- from employees
-- order by salary
-- limit 3

-- Ex20:
-- select salary
-- from employees
-- order by salary desc

-- Restricting and Sorting
-- Ex1:
-- select concat(first_name, ' ', last_name) as name, salary
-- from employees
-- where salary < 10000 or salary > 15000

-- Ex2:
-- select concat(first_name, ' ', last_name) as name, department_id
-- from employees
-- where department_id = 30 or department_id = 100
-- order by department_id, first_name, last_name

-- Ex3:
-- select concat(first_name, ' ', last_name) as name
-- from employees
-- where (department_id = 30 or department_id = 100)
-- and (salary < 10000 or salary > 15000)

-- Ex4:
-- select concat(first_name, ' ', last_name) as name, hire_date
-- from employees
-- where date_part('year',hire_date) = 1987

-- Ex5:
-- select concat(first_name, ' ', last_name) as name
-- from employees
-- where first_name like '%b%' and first_name like '%c%'

-- Ex6:
-- select last_name, job_title
-- from employees e join jobs j on e.job_id = j.job_id
-- where salary not in (4500, 10000, 15000)
-- and (job_title = 'Shipping Clerk' or job_title = 'Programmer')

-- Ex7:
-- select concat(first_name, ' ', last_name) as name
-- from employees
-- where char_length(concat(first_name, ' ', last_name)) = 6

-- Ex8:
-- select last_name
-- from employees
-- where last_name like '__e%'

-- Ex9:
-- select job_title
-- from employees e join jobs j on e.job_id = j.job_id

-- Ex10:
-- select concat(first_name, ' ', last_name) as name, salary, round(0.15*salary) as PF
-- from employees

-- Ex11:
-- select *
-- from employees
-- where last_name in ('Blake', 'Scott', 'King', 'Ford')
