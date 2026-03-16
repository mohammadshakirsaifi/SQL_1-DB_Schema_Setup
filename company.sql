/* =========================================================
   Assignment: Company Database Setup
   Student Name: Mohammad Shakir
   Database Name: company_db
   File Name: company.sql
   ========================================================= */

/* ---------- 01. CREATE DATABASE ---------- */
CREATE DATABASE company_db;
USE company_db;

/* ---------- 02. CREATE COMPANIES TABLE ---------- */
CREATE TABLE companies (
    company_id INT PRIMARY KEY,
    company_name VARCHAR(255) NOT NULL
);

/* ---------- 03. CREATE DEPARTMENTS TABLE ---------- */
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(255) NOT NULL,
    company_id INT,
    CONSTRAINT fk_company
        FOREIGN KEY (company_id)
        REFERENCES companies(company_id)
);

/* ---------- 04. CREATE EMPLOYEES TABLE ---------- */
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    department_id INT,
    salary DECIMAL(15,2) NOT NULL,
    hire_date DATE NOT NULL,
    manager_id INT NULL,
    job_title VARCHAR(255) NOT NULL,
    CONSTRAINT fk_department
        FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);

/* ---------- 05. INSERT DATA INTO COMPANIES ---------- */
INSERT INTO companies (company_id, company_name) VALUES
(1, 'TechNova Solutions'),
(2, 'GlobalSoft Pvt Ltd');

/* ---------- 06. INSERT DATA INTO DEPARTMENTS ---------- */
INSERT INTO departments (department_id, department_name, company_id) VALUES
(101, 'Human Resources', 1),
(102, 'Engineering', 1),
(201, 'Sales', 2),
(202, 'Marketing', 2);

/* ---------- 07. INSERT DATA INTO EMPLOYEES ---------- */
INSERT INTO employees
(employee_id, first_name, last_name, department_id, salary, hire_date, manager_id, job_title)
VALUES
(1, 'John', 'Doe', 102, 75000.00, '2022-03-15', NULL, 'Senior Engineer'),
(2, 'Jane', 'Smith', 102, 65000.00, '2023-01-10', 1, 'Software Engineer'),
(3, 'Rahul', 'Verma', 101, 50000.00, '2021-06-01', NULL, 'HR Manager'),
(4, 'Anita', 'Sharma', 201, 55000.00, '2022-09-20', NULL, 'Sales Executive'),
(5, 'Amit', 'Patel', 202, 60000.00, '2023-02-05', NULL, 'Marketing Analyst');

/* ---------- 08. VERIFY COMPANIES DATA ---------- */
SELECT * FROM companies;

/* ---------- 09. VERIFY DEPARTMENTS DATA ---------- */
SELECT * FROM departments;

/* ---------- 10. VERIFY EMPLOYEES DATA ---------- */
SELECT * FROM employees;

/* ---------- 11. JOIN QUERY (FINAL RESULT) ---------- */
SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    e.job_title,
    d.department_name,
    c.company_name
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id
JOIN companies c
    ON d.company_id = c.company_id;
