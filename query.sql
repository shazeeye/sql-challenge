

--List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender
FROM employees
INNER JOIN salaries ON employees.emp_no=salaries.emp_no;

--List employees who were hired in 1986 (need to change string to text).
SELECT emp_no, last_name, first_name, hire_date 
FROM employees
WHERE hire_date::text LIKE '%86%';


--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT employees.emp_no, employees.last_name, employees.first_name, dept_manager.dept_no, dept_manager.from_date, dept_manager.to_date, departments.dept_name
FROM employees
INNER JOIN dept_manager ON employees.emp_no=dept_manager.emp_no
INNER JOIN departments ON departments.dept_no = dept_manager.dept_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN dept_manager ON employees.emp_no=dept_manager.emp_no
INNER JOIN departments ON departments.dept_no = dept_manager.dept_no;

--List all employees whose first name is "Hercules" and last names begin with "B."
SELECT emp_no, last_name, first_name
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN dept_manager ON employees.emp_no=dept_manager.emp_no
INNER JOIN departments ON departments.dept_no = dept_manager.dept_no
WHERE dept_name='Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN dept_manager ON employees.emp_no=dept_manager.emp_no
INNER JOIN departments ON departments.dept_no = dept_manager.dept_no
WHERE dept_name='Sales' OR dept_name='Development';

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT first_name, last_name, COUNT(*) AS Count 
FROM employees
GROUP BY first_name, last_name
ORDER BY Count DESC;
