USE employees;

SELECT emp_no, first_name, last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya');



SELECT last_name
FROM employees
WHERE last_name like 'e%';

select last_name
from employees
where last_name like '%q%';