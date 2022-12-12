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

select distinct title
from titles
where emp_no IN (
    select emp_no
    from employees
    where first_name = 'Aamod'
    );

select first_name, last_name, gender
from employees
where gender = 'F' and emp_no in
(   select emp_no
    from dept_manager
    where curdate() < to_date
    );

select first_name, last_name, gender, dept_name
from employees
where gender = 'F' and emp_no in
    (   select emp_no
    from dept_manager
     where curdate() < to_date
     );