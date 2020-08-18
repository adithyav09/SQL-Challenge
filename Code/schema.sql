CREATE TABLE departments(
    dept_no         VARCHAR(4) PRIMARY KEY      NOT NULL,
    dept_name       VARCHAR(40)                 NOT NULL,
    UNIQUE (dept_name)
);

CREATE TABLE title(
    title_id         VARCHAR(5) PRIMARY KEY      NOT NULL,
    title            VARCHAR(40)                 NOT NULL,
    UNIQUE (title)
);

CREATE TABLE employees(
    emp_no         INT PRIMARY KEY              NOT NULL,
    emp_title_id   VARCHAR(4)                   NOT NULL,
    birth_date      DATE                        NOT NULL,
    first_name      VARCHAR(16)                 NOT NULL,
    last_name       VARCHAR(16)                 NOT NULL,
    sex             VARCHAR(1)                  NOT NULL,
    hire_date       DATE                        NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES title (title_id)
);

CREATE TABLE dept_manager (
    dept_no         VARCHAR(4)                  NOT NULL,
    emp_no          INT                         NOT NULL,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

CREATE TABLE dept_emp (
    emp_no          INT                         NOT NULL,
    dept_no         VARCHAR(4)                  NOT NULL,
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

CREATE TABLE salaries (
    emp_no          INT                         NOT NULL, 
    salary          INT                         NOT NULL,
    PRIMARY KEY (emp_no),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);