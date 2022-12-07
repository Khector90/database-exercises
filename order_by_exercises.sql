USE employees;

select first_name, last_name, emp_no
from employees
WHERE last_name like 'e%'
order by emp_no desc;



