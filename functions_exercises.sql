USE employees;

select concat(first_name, ' ', last_name)
from employees
where last_name like 'e%'
or last_name like '%e';

select * from employees
where birth_rate like '%-12-25';

select * from employees
where birth_date line '%-12-25'
and year (hire_date)
between 1990 and 1999;

select * from employees
where birth_date like '%-12-25'
and year(hire_date)
between 1990 and 1999
order by hire_date desc;

select datediff(curdate(), hire_date)
from employees
where birth_date like '%-12-25'
and year(hire_date) between 1990 and 1999
order by hire_date desc
limit 20;