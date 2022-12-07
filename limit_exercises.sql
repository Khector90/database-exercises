USE employees;

SELECT DISTINCT title FROM titles

select distinct last_name from employees
order by last_name desc
limit 10;

select emp_no
from salaries
order by salary desc
limit 4
offset 46;