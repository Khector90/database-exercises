USE employees;

select distinct title
    from titles;

select distinct last_name
from employees
where last_name like 'e%'
and last_name like '%e'
group by last_name
limit 5;