-- List out all employees with their salaries
-- Select the proper columns that we need from the employees table and then combine with the salaries table by matching
-- the employee numbers.
select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
from employees
left join salaries
on employees.emp_no = salaries.emp_no

-- List out all of the employees that were hired in 1986
-- This is accomplished by searching for all employees whose hire dates contained '1986'
select last_name, first_name, hire_date
from employees
where hire_date like '%1986'

-- List out the manager of each department
select dept_manager.dept_no, departments.dept_name, employees.emp_no, employees.last_name, employees.first_name
from dept_manager
inner join departments on departments.dept_no = dept_manager.dept_no
inner join employees on employees.emp_no = dept_manager.emp_no