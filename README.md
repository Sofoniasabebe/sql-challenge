# sql-challenge
A research project about people whom the company employed during the 1980s and 1990s.

The tasks for this project were to design the tables to hold the data from the CSV files, import the CSV files into a SQL database, and then answer questions about the data. Hence, data modeling, data engineering, and data analysis, were done respectively.

### Data Modeling 

For this part of the project, I inspected the CSV files, and then sketched an Entity Relationship Diagram of the tables using the QuickDBD. 

The codes for the ERD, explanations for the ERD and a picture of the generated ERD are included in this repository. 

### Data Engineering

I created a table schema for the six tables. I specified the data types, primary keys, foreign keys, and other constraints for the tables. For the primary keys, I verified that the column is unique. For the tables where there were no unique identifying columns, I created composite keys. The schema created is included in the Data_Engineering folder in this repository. 

The tables were created in this order:

1. Departments table - no dependencies 

*For this table, department_number is used as a primary key since each department has a unique dept_no.*

2. Titles table - no dependencies 

*The title_id column can serve as the primary key in this table. All titles can be uniquely identified using the title_ids.*

3. Employee table - depends on titles 

*For this table, emp_no can serve as the primary key. It uinquely identifies each employee.* 
*Emp_tilte_id, from the titles table, can serve as a foreign key linking it to that particular table.*

4. Salaries table - depends on employees

*For this table, emp_no can serve as the foreign key and it can ensure that only valid employees are populated in this table.*

5. Department employee table - depends on employees and departments

*For this table, emp_no and dept_no can both serve as foreign keys.*
*However, this table could not have an explicit primary key since emp_name is no a realibale unique identifier due to the probability of multiple employees having the same name.*
*The two foreign keys, emp_no and dept_no, can also serve as a composite primary key by ensuring that an employee is not assigned to the same department more than once.*

6. Department manager table - depends on employees and departments 

*For this table, dept_no and emp_no can serve as foreign keys.*
*Both columns also serve as composite primary keys ensuring that an employee is not assigned as a manager of the same department multiple times.*

Then, each CSV file was imported into its corresponding SQL table in the order in which the tables were created. 

### Data Analysis

The first task was to list the employee number, last name, first name, sex, and salary of each employee. For this task, the tables used were the employee table and salaries table. Joining the two tables on employee number guaranteed the retrievial of the salary for each employee.

Then the first name, last name, and hire date for the employees who were hired in 1986 were listed. 

The next task was to list the manager of each department along with their department number, department name, employee number, last name, and first name. For this task, a combination of three tables was used. From the departments table,dept_no, and dept_name were retrieved. The dept_manager table was used to link departments with managers via emp_no. Then to retrieve the manager's details, the employees table was used. 

To list the department number for each employee along with that employee’s employee number, last name, first name, and department name, three tables were used. To link the employees to their departments, the dept_emp table was used. From the departments table, the names of the departments were fetched. Then, the employee table was used to get the employee details - last name, first name and employee number. 

The next task was to list first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B. This task is completed by simply applying the WHERE clause with LIKE for pattern matching on the employees table.

Also, to list each employee in the Sales department, including their employee number, last name, and first name, the employees table was joined with the dept_emp table on emp_no. The dep_emp table was joined with the departments table on dept_no. Then the results were filtered to only include employees in the Sales department by checking the dept_name. 

Similarly, to list each employee in the Sales and Development departments, including their employee number, last name, first name, and department name, employees table, dept_emp table, and departments table were joined. Then the results were filtered on department names to extract only employees in the Sales and Development departments.

The final task was to list the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name). This was achieved by selecting the last-names along with their count of occurrences from the employee table. The group by method groups the records by the last names to allow the COUNT(*) function calculate how many timesa given last name appeared in the employees table. Then the results were displayed in descending order as required.

Images showing outputs of the queries performed for the data analysis are included in the Outputs folder of this repository. 

*Data generated by Mockaroo, LLCLinks to an external site., (2022). Realistic Data Generator.*