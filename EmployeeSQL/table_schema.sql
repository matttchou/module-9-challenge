-- Create tables

-- Create titles table
CREATE Table titles (
	title_id VARCHAR(5) PRIMARY KEY NOT NULL,
	title VARCHAR(40) NOT NULL
);

-- Create employees table
CREATE Table employees (
	emp_no INT PRIMARY KEY NOT NULL,
	emp_title_ID VARCHAR(5),
	birth_date DATE NOT NULL,
	first_name VARCHAR(35) NOT NULL,
	last_name VARCHAR(35) NOT NULL,
	gender VARCHAR(1)NOT NULL,
	hire_date DATE NOT NULL,
	foreign key (emp_title_ID) references titles (title_id)
);

-- Create departments table
CREATE Table departments (
	dept_no VARCHAR(8) Primary Key NOT NULL,
	dept_name VARCHAR(40) NOT NULL
);

-- Create department employee table
CREATE Table dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(8) NOT NULL,
    foreign key (emp_no) references employees (emp_no),
    foreign key (dept_no) references departments (dept_no),
	Primary Key (emp_no, dept_no)
);

-- Create Department manager table
CREATE Table dept_manager (
	dept_no VARCHAR(8) NOT NULL,
	emp_no INT Primary Key NOT NULL,
    foreign key (emp_no) references employees (emp_no),
    foreign key (dept_no) references departments (dept_no)
);

-- Create salaries table
CREATE table salaries (
	emp_no INT Primary Key NOT NULL,
	salary INT NOT NULL,
    foreign key (emp_no) references employees (emp_no)
);


