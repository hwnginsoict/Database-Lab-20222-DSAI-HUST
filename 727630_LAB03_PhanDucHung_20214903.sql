-- Phan Duc Hung 20214903
-- Kip 1 chieu t4 (727630) - Week3

-- Function date and time

Ex1:
select first_name, hire_date
from employees
where hire_date > '1987-06-01' and hire_date < '1987-07-30'

Ex2:
select first_name, last_name
from employees
where date_part('month', hire_date) = 6

Ex3:
select first_name, last_name
from employees
where date_part('year', hire_date) = 1987

Ex4:
select d.department_name, m.first_name, m.last_name, m.salary
from departments d join employees m on d.manager_id = m.employee_id
where current_date - m.hire_date > 5*365

Ex5:
select employee_id, last_name, (date_trunc('month',hire_date) + interval '1 month')::date as date_of_first_salary
from employees

Ex6:
select first_name, hire_date, date_part('year',current_date) - date_part('year', hire_date) as years_of_exp
from employees

Ex7:
select d.department_id, date_part('year',hire_date) as hire_years, count(employee_id) as number_of_employees
from employees e join departments d on e.department_id = d.department_id
group by d.department_id,  date_part('year',hire_date)

-- Function string

Ex1:
select replace(phone_number,'124','999')
from employees

Ex2:
select concat(email, '@gmail.com')
from employees

Ex3:
select employee_id, concat(first_name,' ',last_name), date_part('month', hire_date) as hire_month
from employees

Ex4:
select employee_id, substring(email,1,  char_length(email) - 3)
from employees e

Ex5:
select *
from employees
where first_name = upper(first_name)

Ex6:
select substring(phone_number,char_length(phone_number)-3)
from employees

Ex7:
select split_part(street_address,' ',-1)
from locations

Ex8:
select street_address
from locations 
where length(street_address) <= all (select length(street_address) from locations)

Ex9:
select job_title,split_part(job_title,' ',1)
from jobs
where job_title like '% %'

Ex10:
select length(first_name), last_name, substring(last_name,3)
from employees
where substring(last_name,3) like '%c%'

Ex11:
select first_name, length(first_name)
from employees
where first_name like 'A%'
or first_name like 'J%'
or first_name like 'M%'
order by first_name

Ex12:
select first_name, salary, concat('$',substring(concat('0000000000',salary),length(concat('0000000000',salary))-10))
from employees 

Ex13:
select substring(first_name,1,8),concat(salary/1000,'$')
from employees
order by salary desc

Ex14:
select employee_id, first_name, last_name, hire_date
from employees
where date_part('day',hire_date) = 7 or 
date_part('month',hire_date) = 7

