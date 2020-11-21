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
-- This is accomplished by first selecting the columns that need to appear in our final table, then identifying our "base"
-- table, this is the one that we are joining into. Next we match department names with the department numbers in dept_manager.
-- Finally we add in the employee information for each manager.
select dept_manager.dept_no, departments.dept_name, employees.emp_no, employees.last_name, employees.first_name
from dept_manager
inner join departments on departments.dept_no = dept_manager.dept_no
inner join employees on employees.emp_no = dept_manager.emp_no

-- List out the department of every employee
-- This is accomplished by first matching every employee to a department and then merging in the name of the department.
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
inner join dept_emp on dept_emp.emp_no = employees.emp_no
inner join departments on departments.dept_no = dept_emp.dept_no


-- Herculean effort: List out all the employees whose first name is Hercules and whose last name starts with B
select last_name, first_name, sex
from employees
where first_name = 'Hercules'
and last_name like 'B%'

-- Select all of the people in the sales department and list their numbers, names, and departments
-- Some employees appear twice because they appear in multiple departments

select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
inner join dept_emp on dept_emp.emp_no = employees.emp_no
inner join departments on departments.dept_no = dept_emp.dept_no
where employees.emp_no in (
	
	select emp_no
	from dept_emp
	where dept_no in (

		select dept_no
		from departments
		where dept_name = 'Sales'
	)
)


-- This function accomplishes an identical task to the one above except that it adds in the people who are in the Development
-- group as well.
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
inner join dept_emp on dept_emp.emp_no = employees.emp_no
inner join departments on departments.dept_no = dept_emp.dept_no
where employees.emp_no in (
	
	select emp_no
	from dept_emp
	where dept_no in (

		select dept_no
		from departments
		where dept_name = 'Sales'
		or dept_name = 'Development'
	)
)

-- Count the frequency of each last name and sort in descending order
select last_name, count(*)
from   employees
group by last_name
order by count desc