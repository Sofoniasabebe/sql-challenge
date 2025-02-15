
departments
-
dept_no PK VARCHAR 
dept_name VARCHAR

dept_emp
-
emp_no INT PK FK >- employees.emp_no
dept_no VARCHAR PK FK >- departments.dept_no

dept_manager
-
dept_no VARCHAR PK FK >- departments.dept_no
emp_no INT PK FK >- employees.emp_no

employees
-
emp_no PK INT
emp_title_id VARCHAR FK >- titles.title_id
birth_date DATE
first_name VARCHAR
last_name VARCHAR
sex CHAR(1)
hire_date DATE 

salaries
-
emp_no INT PK FK >- employees.emp_no
salary BIGINT

titles
-
title_id PK VARCHAR
title VARCHAR