select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
from employees
left join salaries
on employees.emp_no = salaries.emp_no

select last_name, first_name, hire_date
from employees
where hire_date like '%1986'

