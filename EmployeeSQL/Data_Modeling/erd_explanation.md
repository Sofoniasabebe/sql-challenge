### Explanation of the Entity Relationship Diagram

### Departments table
For this table, department_number is used as a primary key since each department has a unique dept_no. The table is linked to dep_emp table via dept_no and dept_manager table via dept_no. 

### Department Employee table 
For this table, emp_no and dept_no can both serve as foreign keys. However, this table could not have an explicit primary key since emp_name is no a realibale unique identifier due to the probability of multiple employees having the same name. 
The two foreign keys, emp_no and dept_no, can also serve as a composite primary key by ensuring that an employee is not assigned to the same department more than once. 

### Department Manager table
For this table, dept_no and emp_no can serve as foreign keys. Both columns also serve as composite primary keys ensuring that an employee is not assigned as a manager of the same department multiple times. 

### Employees table
For this table, emp_no can serve as the primary key. It uinquely identifies each employee. Emp_tilte_id, from the titles table, can serve as a foreign key linking it to that particular table. 

### Salaries table
For this table, emp_no can serve as the foreign key and it can ensure that only valid employees are populated in this table. 

### Titles table
The title_id column can serve as the primary key in this table. All titles can be uniquely identified using the title_ids. This table can be linked to the employees table via emp_title_id. 
