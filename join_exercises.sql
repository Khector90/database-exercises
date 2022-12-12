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

select e.dept_name as Department_Name, concat(d.first_name, ' ', d.last_name) as Department_Manager
from departments as e
         join dept_manager as dm
              on e.dept_no = dm.dept_no
         join employees d
              on d.emp_no = dm.emp_no
         join titles as t
             on dm.emp_no = t.emp_no
where gender = 'F'
 and t.title = 'Manager'
    and curdate() < dm.to_date
order by e.dept_name;
#  close but no cigar maybe visit again later

# select distinct t.title, count(t.title) as total
# from titles as t
#     join dept_emp as de
#         on t.emp_no = de.emp_no
# where de.dept_no = 'd009'
#   and curdate() < t.to_date
# group by title
# order by total desc;

select t.title, count(t.title) as total
from employees as e
    join titles as t on e.emp_no = t.emp_no
    join dept_emp as de on e.emp_no =de.emp_no
    join departments as d on d.dept_no = de.dept_no
where t.to_date = '9999-01-01' and de.to_date = '9999-01-01' and d.dept_name = 'customer service'
group by t.title;

select e.dept_name as Department_Name, concat(d.first_name, ' ', d.last_name) as Department_Manager, s.salary
from departments as e
         join dept_manager as dm
              on e.dept_no = dm.dept_no
         join employees d
              on d.emp_no = dm.emp_no
         join titles as t
              on dm.emp_no = t.emp_no
        join salaries as s
              on d.emp_no = s.emp_no
where t.title = 'Manager'
  and curdate() < dm.to_date
  and curdate() < s.to_date
order by e.dept_name;

