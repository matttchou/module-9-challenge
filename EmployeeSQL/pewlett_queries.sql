-- 1. List the employee number, last name, first name, sex, and salary of each employee.
-- from employees: employee number (emp_no), last name (last_name), first name (first_name), gender
-- from salaries: employee number (emp_no), salary

SELECT s.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees as e
INNER JOIN salaries as s
on s.emp_no = e.emp_no
order by s.emp_no;

-- 2. List employees who were hired in 1986
SELECT emp_no, last_name, first_name, hire_date 
FROM employees 
WHERE extract(year from hire_date) = 1986;

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT d.dept_no, d.dept_name, e.emp_title_id, e.last_name, e.first_name

FROM dept_emp as de
LEFT JOIN employees as e
	ON e.emp_no = de.emp_no
LEFT JOIN departments as d
	ON d.dept_no = de.dept_no

WHERE e.emp_title_id LIKE 'm%'
;

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

CREATE VIEW all_dept_emp AS -- Create view for the joined table

SELECT e.emp_no, e.emp_title_id, e.birth_date, e.last_name, e.first_name, e.gender, e.hire_date, d.dept_name, d.dept_no

FROM dept_emp as de
LEFT JOIN employees as e
	ON e.emp_no = de.emp_no
LEFT JOIN departments as d
	ON d.dept_no = de.dept_no
;

SELECT emp_no, last_name, first_name, dept_name

FROM all_dept_emp
;

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT e.first_name, e.last_name, e.gender
FROM employees as e
WHERE (e.first_name = 'Hercules') and (lower(e.last_name) like 'b%')
ORDER by e.last_name
;

-- Create table with most current departments for each employee to use for #6 and #7 below

CREATE VIEW current_dept_emp AS -- Create view for the joined table
SELECT e.emp_no, e.last_name, e.first_name, e.gender, d.dept_name
FROM dept_emp as de
LEFT JOIN employees as e
	ON e.emp_no = de.emp_no
LEFT JOIN departments as d
	ON d.dept_no = de.dept_no
;

SELECT emp_no, last_name, first_name, dept_name

FROM current_dept_emp
;

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
INNER JOIN current_dept_emp as cde
	on e.emp_no = cde.emp_no
INNER JOIN departments as d
	on d.dept_no = d.dept_no
WHERE lower(d.dept_name) = 'sales'
;

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT * FROM current_dept_emp
WHERE	dept_name IN ('Sales', 'Development')
;

-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name,count(last_name) as Frequency 
FROM employees 
GROUP BY last_name
ORDER BY frequency desc
;