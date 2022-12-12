USE employees;

select distinct title
    from titles;

select distinct last_name
from employees
where last_name like 'e%'
and last_name like '%e'
group by last_name
limit 5;

select distinct last_name, first_name
from employees
where last_name like 'e%'
and last_name like '%e'
group by last_name, first_name;

select distinct last_name
from employees
where last_name like '%q%'
and last_name not like  '%qu%'
group by last_name
order by count(last_name)ASC;

SELECT DISTINCT COUNT(last_name), last_name
FROM employees
WHERE last_name LIKE '%q%'
  AND last_name NOT LIKE '%qu%'
GROUP BY last_name;

SELECT DISTINCT COUNT(*), gender
FROM employees
WHERE first_name IN ('Irene', 'Vidya', 'Maya')
GROUP BY gender;




