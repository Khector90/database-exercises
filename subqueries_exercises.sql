USE employees;

select emp_no, hire_date
from employees
where emp_no = 101010;

select last_name, hire_date
from employees
where hire_date IN (
    select hire_date
    from employees
    where hire_date ='1990-10-22'
    );