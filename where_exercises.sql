USE employees;

SELECT emp_no, first_name, last_name, gender
FROM employees
WHERE first_name in  ('Irena', 'Vidya', 'Maya') and gender = 'M';



SELECT last_name
FROM employees
WHERE last_name like 'e%';

select last_name
from employees
where last_name like '%q%';

select last_name, first_name
from employees
where last_name like '%e' or  last_name like 'e%';

select last_name, first_name
from employees
where last_name like 'e%' and last_name like '%e';

select last_name, first_name
from employees
where last_name like '%q%' and last_name not like '%qu%';