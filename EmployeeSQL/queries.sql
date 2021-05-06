
SELECT employees.emp_no, last_name, first_name, sex, salaries.salary FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no;

---------------------------------------------------------

SELECT first_name, last_name, hire_date FROM employees
WHERE (hire_date > '1985-12-31') AND (hire_date < '1987-01-01')
ORDER BY hire_date;

---------------------------------------------------------
	
SELECT foo.dept_no,foo.dept_name, foo.emp_no, emp.last_name, emp.first_name 
FROM (SELECT dept_manager.dept_no,departments.dept_name,emp_no FROM dept_manager
JOIN departments ON departments.dept_no = dept_manager.dept_no) AS foo
JOIN employees AS emp ON emp.emp_no = foo.emp_no
ORDER BY dept_no;

---------------------------------------------------------

SELECT foo.emp_no, foo.last_name, foo.first_name, dep.dept_name
FROM (SELECT e.emp_no, e.last_name, e.first_name, d.dept_no FROM employees AS e
JOIN dept_emp AS d ON d.emp_no = e.emp_no) AS foo
JOIN departments AS dep ON dep.dept_no = foo.dept_no
ORDER BY emp_no;

---------------------------------------------------------

SELECT first_name, last_name, sex FROM employees
WHERE (first_name = 'Hercules') AND (LEFT(last_name,1) = 'B')
ORDER BY last_name;

---------------------------------------------------------

SELECT foo.emp_no, emp.last_name, emp.first_name, foo.dept_name FROM
(SELECT de.emp_no, dep.dept_name FROM dept_emp AS de
JOIN departments AS dep ON dep.dept_no = de.dept_no
WHERE dep.dept_name = 'Sales') AS foo
JOIN employees AS emp ON emp.emp_no = foo.emp_no
ORDER BY emp_no;

---------------------------------------------------------

SELECT foo.emp_no, emp.last_name, emp.first_name, foo.dept_name FROM
( SELECT de.emp_no, dep.dept_name FROM dept_emp AS de
JOIN departments AS dep ON dep.dept_no = de.dept_no
WHERE (dep.dept_name = 'Sales') OR(dep.dept_name = 'Development') ) AS foo
JOIN employees AS emp ON emp.emp_no = foo.emp_no
ORDER BY emp_no;

---------------------------------------------------------

SELECT last_name, COUNT(last_name) from employees
GROUP BY last_name
ORDER BY COUNT DESC;
