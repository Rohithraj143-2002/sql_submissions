CREATE DATABASE Managers;
USE Managers;
CREATE TABLE Managers
 (
    Manager_Id INT PRIMARY KEY,
    First_name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    DOB DATE,
    Age INT CHECK (Age >= 18), 
    Last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Gender CHAR(1) CHECK (Gender IN ('M', 'F')), 
    Department VARCHAR(50) NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL 
);

INSERT INTO Managers (Manager_Id, First_name, Last_Name, DOB, Age, Gender, Department, Salary) VALUES
(1, 'Arun', 'David', '1985-01-15', 38, 'M', 'HR', 30000),
(2, 'Alina', 'Sebastin', '1990-05-22', 33, 'F', 'Finance', 35000),
(3, 'Michael', 'Smith', '1979-08-30', 44, 'M', 'IT', 40000),
(4, 'Davis', 'Jones', '1987-12-17', 36, 'M', 'Marketing', 28000),
(5, 'Lissa', 'don', '1992-11-02', 31, 'F', 'IT', 27000),
(6, 'Emily', 'Brown', '1983-04-10', 40, 'F', 'HR', 25000),
(7, 'Rohith', 'Raj', '1975-07-19', 48, 'M', 'Finance', 32000),
(8, 'Oliv', 'Martinez', '1995-02-24', 29, 'F', 'IT', 36000),
(9, 'Danial', 'Gabri', '1988-09-08', 35, 'M', 'IT', 20000),
(10, 'Sowmya', 'rajan', '1993-03-16', 31, 'F', 'Marketing', 26000);

SELECT First_name, Last_Name, DOB 
FROM Managers 
WHERE Manager_Id = 1;

SELECT Manager_Id, First_name, Last_Name, (Salary * 12) AS Annual_Income 
FROM Managers;

SELECT * 
FROM Managers 
WHERE First_name <> 'Alina';

SELECT * 
FROM Managers 
WHERE Department = 'IT' AND Salary > 25000;

SELECT * 
FROM Managers 
WHERE Salary BETWEEN 10000 AND 35000;