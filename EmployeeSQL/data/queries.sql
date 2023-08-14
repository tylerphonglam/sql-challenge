--List the employee number, last name, first name, sex, and salary of each employee
CREATE TABLE request_1 AS
SELECT e.emp_no as "Employee Number", e.last_name as "Last Name", e.first_name as "First Name", e.sex as "Sex", s.salary as "Salary"
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no;
SELECT * FROM request_1;

--List the first name, last name, and hire date for the employees who were hired in 1986
CREATE TABLE request_2 AS
SELECT last_name, first_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;
SELECT * FROM request_2;

--List the manager of each department along with their department number, department name, employee number, last name, and first name
CREATE TABLE request_3 AS
SELECT m.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM dept_manager m
Join departments d ON m.dept_no = d.dept_no
Join employees e ON m.emp_no = e.emp_no;
SELECT * FROM request_3;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name
CREATE TABLE request_4 AS
SELECT e.dept_no as "Department Number",e.emp_no AS "Employee Number", d.last_name AS "Last Name", d.first_name AS "First Name", n.dept_name AS "Deparment Name"
FROM dept_emp e
JOIN employees d ON d.emp_no = e.emp_no
JOIN departments n ON n.dept_no = e.dept_no;
SELECT * FROM request_4;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
CREATE TABLE request_5 AS
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';
SELECT * FROM request_5;

--List each employee in the Sales department, including their employee number, last name, and first name
CREATE TABLE request_6 AS
SELECT e.emp_no, e.last_name, e.first_name
FROM employees e
JOIN dept_emp d ON d.emp_no = e.emp_no
JOIN departments f ON f.dept_no = d.dept_no
WHERE f.dept_no = (SELECT dept_no FROM departments WHERE dept_name = 'Sales');
SELECT * FROM request_6;

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
CREATE TABLE request_7 AS
SELECT e.emp_no, e.last_name, e.first_name, f.dept_name
FROM employees e
JOIN dept_emp d ON d.emp_no = e.emp_no
JOIN departments f ON f.dept_no = d.dept_no
WHERE f.dept_no IN (SELECT dept_no FROM departments WHERE dept_name IN ('Sales', 'Development'));
SELECT * FROM request_7;

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
CREATE TABLE request_8 AS
SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;
SELECT * FROM request_8;