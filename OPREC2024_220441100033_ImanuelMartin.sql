CREATE DATABASE db_user_management;
USE db_user_management;

-- membuat tabel sesuai struktur 
CREATE OR REPLACE TABLE departments (department_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT ,
			  NAME VARCHAR (150) NOT NULL,
			  location VARCHAR (150) NOT NULL);
			  
CREATE OR REPLACE  TABLE employees (employee_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
			NAME VARCHAR (150) NOT NULL, 
			date_birth DATE NOT NULL,
			hire_date DATE NOT NULL,
			department_id INT NOT NULL,
			POSITION VARCHAR(150) NOT NULL,
			base_salary INT NOT NULL,
			FOREIGN KEY (department_id) REFERENCES departments (department_id)
			);

CREATE TABLE projects (projects_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, NAME VARCHAR (150) NOT NULL, budget INT NOT NULL, start_date DATE NOT NULL, end_date DATE NOT NULL);


-- tabell transaksi
CREATE TABLE employee_projects (employee_projects_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT , 
employee_id INT NOT NULL, 
project_id INT NOT NULL, 
hrs_worked INT NOT NULL, 
FOREIGN KEY (employee_id)REFERENCES employees (employee_id),
FOREIGN KEY (project_id) REFERENCES projects (projects_id ) );

CREATE TABLE salaries (salaries_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT  , 
employee_id INT NOT NULL, payment_date DATE NOT NULL ,gaji_dasar INT NOT NULL,
bonus INT NOT NULL,potongan INT NOT NULL , pendapatan INT NOT NULL, FOREIGN KEY (employee_id) REFERENCES employees (employee_id));

CREATE OR REPLACE TABLE LeaveRequests ( leave_requests_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
employee_id INT NOT NULL,
request_date DATE NOT NULL,
start_date DATE NOT NULL, 
end_date DATE NOT NULL, STATUS VARCHAR (150) NOT NULL , FOREIGN KEY (employee_id) REFERENCES employees (employee_id));

CREATE TABLE performance_reviews (performance_reviews_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
employee_id INT NOT NULL,
review_date DATE NOT NULL, 
reviewer VARCHAR (150) NOT NULL ,
performance_score INT NOT NULL,
comments TEXT (900) NOT NULL,
FOREIGN KEY (employee_id) REFERENCES employees (employee_id));

-- insert data dari file SQL Data Manipulation Language

SELECT * FROM departments;
SELECT * FROM employees;
-- INSERT into TABLE: departments
INSERT INTO departments (NAME, location)
   VALUES
      ('HR', 'New York'),
      ('IT', 'San Francisco'),
      ('Finance', 'Chicago'),
      ('Marketing', 'Los Angeles'),
      ('Sales', 'Houston');

-- INSERT into TABLE: employees
INSERT INTO employees (NAME, date_birth, hire_date, department_id, POSITION, base_salary)
   VALUES
      ('Alice Smith', '1985-06-15', '2010-03-01', 1, 'HR Manager', 80000),
      ('Bob Johnson', '1990-09-20', '2012-07-15', 2, 'Software Engineer', 95000),
      ('Charlie Davis', '1982-11-30', '2008-11-01', 3, 'Accountant', 70000),
      ('David Thompson', '1993-04-25', '2014-02-10', 4, 'Marketing Specialist', 65000),
      ('Eve Parker', '1979-01-18', '2005-06-23', 5, 'Sales Executive', 75000);

-- INSERT into TABLE: projects
INSERT INTO projects (NAME, budget, start_date, end_date)
   VALUES
      ('Project Alpha', 5000000, '2022-01-01', '2022-12-31'),
      ('Project Beta', 3000000, '2022-02-01', '2022-11-30'),
      ('Project Gamma', 7000000, '2022-03-01', '2023-03-31'),
      ('Project Delta', 4500000, '2022-04-01', '2022-10-31'),
      ('Project Epsilon', 6000000, '2022-05-01', '2023-05-31');
 SELECT * FROM projects;

-- INSERT into TABLE TRANSACTION: employee_projects
INSERT INTO employee_projects (employee_id, project_id, hrs_worked)
   VALUES
      (1, 1, 120),
      (2, 2, 100),
      (3, 3, 140),
      (4, 4, 80),
      (5, 5, 90);
      
SELECT * FROM employee_projects

-- INSERT into TABLE: salaries
INSERT INTO salaries (employee_id, payment_date, gaji_dasar, bonus, potongan, pendapatan)
   VALUES
      (1, '2023-01-31', 80000, 5000, 2000, 83000),
      (2, '2023-02-28', 95000, 6000, 2500, 98500),
      (3, '2023-03-31', 70000, 4000, 1500, 72500),
      (4, '2023-04-30', 65000, 3500, 1800, 66700),
      (5, '2023-05-31', 75000, 4500, 2200, 77300);
SELECT * FROM salaries;
-- INSERT into TABLE: leave_requests
INSERT INTO LeaveRequests (employee_id, request_date, start_date, end_date, STATUS)
   VALUES
      (1, '2024-01-10', '2024-02-01', '2024-02-10', 'Approved'),
      (2, '2024-02-05', '2024-03-01', '2024-03-05', 'Pending'),
      (3, '2024-03-12', '2024-04-01', '2024-04-07', 'Denied'),
      (4, '2024-04-20', '2024-05-01', '2024-05-10', 'Approved'),
      (5, '2024-05-15', '2024-06-01', '2024-06-05', 'Pending');
SELECT * FROM LeaveRequests;

-- INSERT into TABLE: performance_reviews
INSERT INTO performance_reviews (employee_id, review_date, reviewer, performance_score, comments)
   VALUES
      (1, '2024-05-01', 'John Doe', 85, 'Konsisten memenuhi ekspektasi. Etos kerja yang kuat.'),
      (2, '2024-05-10', 'Jane Smith', 90, 'Kinerja luar biasa. Pemain tim yang sangat baik.'),
      (3, '2024-05-15', 'Robert Brown', 78, 'Memenuhi ekspektasi. Bisa meningkatkan manajemen waktu.'),
      (4, '2024-05-20', 'Emily White', 88, 'Kinerja yang kuat. Kemampuan memecahkan masalah yang hebat.'),
      (5, '2024-06-01', 'Michael Green', 92, 'Hasil yang luar biasa. Melebihi ekspektasi di sebagian besar area.'),
      (1, '2024-06-10', 'Laura Black', 80, 'Kinerja solid. Dapat diandalkan dan tepat waktu.'),
      (2, '2024-06-15', 'William Grey', 83, 'Kinerja yang baik. Menunjukkan potensi untuk peran kepemimpinan.'),
      (3, '2024-06-20', 'Sophia Blue', 87, 'Konsisten berkinerja baik. Kemampuan analisis yang kuat.'),
      (4, '2024-06-25', 'Oliver Purple', 75, 'Memenuhi persyaratan dasar. Perlu peningkatan dalam komunikasi.'),
      (5, '2024-06-30', 'Isabella Red', 91, 'Kinerja sangat baik. Menunjukkan inisiatif yang kuat.');\
      
SELECT * FROM performance_reviews;




-- soal di mulai dikerjakan dari sini 
-- view
CREATE VIEW soal1 AS SELECT employees.name,POSITION, departments.name,payment_date,gaji_dasar,bonus,potongan,pendapatan 
FROM employees JOIN departments ON employees.department_id = departments.department_id
NATURAL JOIN salaries ORDER BY payment_date ASC;

-- view soal 2
CREATE VIEW soal2 AS SELECT departments.name , AVG (pendapatan) FROM salaries NATURAL JOIN departments;

-- view soal 3
CREATE VIEW soal 3 AS SELECT NAME,POSITION, departments.name AS departments FROM employees NATURAL JOIN departments 

-- stored procedure 

-- sp 1

DELIMITER // 

CREATE PROCEDURE CalculateBonus (IN employee_id VARCHAR(100) ,IN bonus_percentage (VARCHAR 100) )

BEGIN 
UPDATE salaries SET bonus = bonus_percentage WHERE eemployee_id = employee_id ;
END //

DELIMITER ;

-- sp 2


-- trigger 
DELIMITER //
CREATE TRIGGER bonus
AFTER INSERT salaries 
FOR EACH ROW 
BEGIN
UPDATE salaries SET bonus - 1000;
END ;
