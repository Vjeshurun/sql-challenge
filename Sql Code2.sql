
--1. List the following details of each employee: employee number, last name, first name, sex, and salary.

Select e.emp_no as "Employee Number", e.last_name as "Last Name", e.first_name as "First Name",e.sex, s.salary 
from employees as e join salaries as s on e.emp_no = s.emp_no

--Select e.emp_no as Employee_Number, e.last_name as Last_Name, e.first_name as First_Name,e.sex, s.salary 
 from employees as e join salaries as s on e.emp_no = s.emp_no

--2. List first name, last name, and hire date for employees who were hired in 1986.

Select first_name, last_name, hire_date 
from employees 
where EXTRACT(YEAR FROM hire_date) in (1986)

--3. List the manager of each department (m0001, Manager) with the following information: department number, department name, the manager's employee number, last name, first name.

Select dm.dept_no as "Dept number", d.dept_name, e.emp_no as "Manager's Employee No.", e.first_name, e.last_name
from  dept_manager as dm, employees as e, departments as d, dept_emp as de
where dm.emp_no = e.emp_no AND dm.dept_no = d.dept_no AND d.dept_no = de.dept_no

	
--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
Select de.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e, departments as d, dept_emp as de
where de.emp_no = e.emp_no AND d.dept_no = de.dept_no 

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
Select first_name, last_name, sex
from employees
where first_name = 'Hercules' and last_name like 'B%'

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
Select de.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e, departments as d, dept_emp as de
where de.emp_no = e.emp_no AND d.dept_no = de.dept_no and d.dept_name = 'Sales'


--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
Select de.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e, departments as d, dept_emp as de
where de.emp_no = e.emp_no AND d.dept_no = de.dept_no and (d.dept_name = 'Sales' or d.dept_name = 'Development')

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
Select last_name, count(last_name) as "Count of last name"
from employees
group by last_name
order by count(last_name) desc
 

 
