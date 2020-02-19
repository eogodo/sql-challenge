-- List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no;

-- List employees who were hired in 1986.
SELECT * FROM employees WHERE EXTRACT(YEAR FROM hire_date)=1986;

-- List the manager of each department with the following information: departmeynt number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name, m.from_date, m.to_date
FROM dept_manager m
JOIN departments d ON d.dept_no = m.dept_no
JOIN employees e ON m.emp_no = e.emp_no;

-- Above query for current managers only
SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name, m.from_date, m.to_date
FROM dept_manager m
JOIN departments d ON d.dept_no = m.dept_no
JOIN employees e ON m.emp_no = e.emp_no
WHERE EXTRACT(YEAR FROM m.to_date)=9999;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
JOIN departments d ON d.dept_no = de.dept_no
JOIN employees e ON de.emp_no = e.emp_no;

-- List all employees whose first name is "Hercules" and last names begin with "B."
SELECT * FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
JOIN employees e ON de.emp_no = e.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

-- Above query with current sales employees only
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
JOIN employees e ON de.emp_no = e.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' AND EXTRACT(YEAR FROM de.to_date)=9999;

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
JOIN employees e ON de.emp_no = e.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

-- Above query with current sales or development employees only
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
JOIN employees e ON de.emp_no = e.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE (d.dept_name = 'Sales' OR d.dept_name = 'Development') AND EXTRACT(YEAR FROM de.to_date)=9999;


-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, count(last_name) AS "Last Name Frequency"
FROM employees 
GROUP BY last_name 
ORDER BY count(last_name) desc;
