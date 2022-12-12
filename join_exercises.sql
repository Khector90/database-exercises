USE employees;

select e.dept_name as Department_Name, concat(d.first_name, ' ', d.last_name)as full_name
from departments as e
    join dept_manager as dm
        on e.dept_no = dm.dept_no
    join employees d
        on d.emp_no = dm.emp_no
    join titles as t on dm.emp_no = t.emp_no
where t.title = 'Manager'
    and curdate() < dm.to_date
order by e.dept_name;

select e.dept_name as Department_Name, concat(d.first_name, ' ', d.last_name) as full_name
from departments as e
         join dept_manager as dm
              on e.dept_no = dm.dept_no
         join employees d
              on d.emp_no = dm.emp_no
         join titles as t on dm.emp_no = t.emp_no
where gender = 'F'
 and t.title = 'Manager'
    and curdate() < dm.to_date
order by e.dept_name;

