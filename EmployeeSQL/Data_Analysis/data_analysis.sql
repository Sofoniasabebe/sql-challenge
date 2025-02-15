-- 1. List the employee number, last name, first name, sex, and salary of each employee.

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary 
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no; 

-- The 'e' is an alias for the employee table and the 's' is an alias for the salaries table. 
-- Joining the two tables on employee number guarantees we retrieve the salary for each employee.

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

-- 3. List the manager of each department along with their department number, department name, employee number, 
-- last name, and first name.

SELECT 
    d.dept_no,
    d.dept_name,
    e.emp_no,
    e.last_name,
    e.first_name
FROM departments d
JOIN dept_manager dm ON d.dept_no = dm.dept_no
JOIN employees e ON dm.emp_no = e.emp_no; 

-- For this task, a combination of three tables was used. From the departments table,
-- dept_no, and dept_name were retrieved. The dept_manager table was used to link departments
-- with managers via emp_no. Then to retrieve the manager's details, the employees table was used. 
-- Aliases used for tables: 'd' - departments, 'e' - employees, 'dm' - dept_manager. 

-- 4. List the department number for each employee along with that employee’s employee number, 
-- last name, first name, and department name.

SELECT 
    de.dept_no,
    e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
FROM dept_emp de
JOIN employees e ON de.emp_no = e.emp_no
JOIN departments d ON de.dept_no = d.dept_no;

-- To retrieve these information, three tables were used. To link the employees to their departments, the dept_emp
-- table was used. From the departments table, the names of the departments were fetched. Then, the employee table was
-- used to get the employee details - last name, first name and employee number. 
-- Aliases used for tables: 'de' - dept_emp, 'e' - employees, 'd' - departements. 

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and 
-- whose last name begins with the letter B.

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'; 

-- This task is completed by simply applying the WHERE clause with LIKE for pattern matching on the employees table. 

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.

SELECT e.emp_no, e.last_name, e.first_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

-- For this task, the employees table was joined with the dept_emp table on emp_no. 
-- The dep_emp table was joined with the departments table on dept_no. 
-- Then the results were filtered to only include employees in the Sales department by checking the dept_name. 
-- Aliases used for tables: 'de' - dept_emp, 'e' - employees, 'd' - departements. 

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, 
-- first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e 
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

-- For thus task, employees table, dept_emp table, and departments table were joined. Then the results were 
-- filtered on department names to extract only employees in the Sales and Development departments. 
-- Aliases used for tables: 'de' - dept_emp, 'e' - employees, 'd' - departements. 

-- 8. List the frequency counts, in descending order, of all the employee last names 
-- (that is, how many employees share each last name).

SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;

-- This was achieved by selecting the last-names along with their count of occurrences from the employee table. 
-- The group by method groups the records by the last names to allow the COUNT(*) function calculate how many times
-- a given last name appeared in the employees table. Then the results were displayed in descending order as required.  




