
--Data Analysis
--Once you have a complete database, do the following:
--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, last_name, first_name,sex, salary
FROM employees inner join salaries on salaries.emp_no = employees.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.
--SELECT first_name, last_name, hire_date
--FROM employees where hire_date >= '01/01/1986' and hire_date <= '12/31/1986'

--SELECT first_name, last_name, hire_date
--FROM employees where hire_date between '01/01/1986' and '12/31/1986'

SELECT first_name, last_name, hire_date
FROM employees where date_part('year',hire_date) = '1986'

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT dept_manager.dept_no, departments.dept_name,employees.last_name, employees.first_name, employees.emp_no
FROM dept_manager left join departments on dept_manager.dept_no = departments.dept_no left join employees on dept_manager.emp_no = employees.emp_no; 

--4.List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT departments.dept_name,employees.last_name, employees.first_name, employees.emp_no, dept_emp.dept_no
FROM employees inner join dept_emp on employees.emp_no = dept_emp.emp_no inner join departments on departments.dept_no = dept_emp.dept_no; 

-- --5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT *
FROM EMPLOYEES
Where first_name = 'Hercules' and last_name like 'B%';

-- --6.List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, dept_emp.dept_no
FROM employees inner join dept_emp on employees.emp_no = dept_emp.emp_no inner join departments on departments.dept_no=dept_emp.dept_no 
where departments.dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
--SELECT *
--FROM departments

SELECT employees.emp_no, employees.last_name, employees.first_name, dept_emp.dept_no
FROM employees inner join dept_emp on employees.emp_no = dept_emp.emp_no inner join departments on departments.dept_no=dept_emp.dept_no 
where departments.dept_name in ('Sales','Development');

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT employees.last_name, COUNT(employees.last_name) as frequency_count
from employees
group by employees.last_name
order by frequency_count DESC;
