CREATE DATABASE WORKER ;
USE WORKER ;

CREATE TABLE Worker (
    Worker_Id INT NOT NULL PRIMARY KEY,
    FirstName CHAR(25) NOT NULL,
    LastName CHAR(25) NOT NULL,
    Salary INT NOT NULL,
    JoiningDate DATETIME NOT NULL,
    Department CHAR(25) NOT NULL
);

INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
VALUES 
(101, 'John', 'Doe', 55000, '2024-01-15', 'Engineering'),
(102, 'Jane', 'Smith', 60000, '2024-01-20', 'Marketing'),
(103, 'Robert', 'Brown', 45000, '2024-02-05', 'HR'),
(104, 'Emily', 'Davis', 65000, '2024-03-01', 'Sales'),
(105, 'Michael', 'Johnson', 70000, '2024-03-10', 'Finance'),
(106, 'Sarah', 'Lee', 48000, '2024-04-01', 'Engineering'),
(107, 'David', 'Wilson', 54000, '2024-04-15', 'HR'),
(108, 'Laura', 'Moore', 52000, '2024-05-05', 'Sales'),
(109, 'James', 'Taylor', 55000, '2024-05-10', 'Finance'),
(110, 'Alice', 'Clark', 61000, '2024-06-01', 'Marketing');


CREATE PROCEDURE AddNewWorker(
    IN p_WorkerId INT,
    IN p_FirstName CHAR(25),
    IN p_LastName CHAR(25),
    IN p_Salary INT,
    IN p_JoiningDate DATETIME,
    IN p_Department CHAR(25)
)
    INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
    VALUES (p_WorkerId, p_FirstName, p_LastName, p_Salary, p_JoiningDate, p_Department);

CALL AddNewWorker(111, 'Charlie', 'Adams', 49000, '2024-07-01', 'Engineering');


CREATE PROCEDURE GetSalary(
    IN p_WorkerId INT,
    OUT p_Salary INT
)

    SELECT Salary INTO p_Salary
    FROM Worker
    WHERE Worker_Id = p_WorkerId;


CALL GetSalary(101, @Salary);
SELECT @Salary AS WorkerSalary;


CREATE PROCEDURE UpdateDepartment(
    IN p_WorkerId INT,
    IN p_Department CHAR(25)
)

    UPDATE Worker
    SET Department = p_Department
    WHERE Worker_Id = p_WorkerId;

CALL UpdateDepartment(101, 'HR');


CREATE PROCEDURE GetWorkerCountByDepartment(
    IN p_Department CHAR(25),
    OUT p_WorkerCount INT
)

    SELECT COUNT(*) INTO p_WorkerCount
    FROM Worker
    WHERE Department = p_Department;

CALL GetWorkerCountByDepartment('Engineering', @WorkerCount);
SELECT @WorkerCount AS WorkerCountInEngineering;


CREATE PROCEDURE GetAvgSalaryByDepartment(
    IN p_Department CHAR(25),
    OUT p_AvgSalary DECIMAL(15, 2)
)

    SELECT AVG(Salary) INTO p_AvgSalary
    FROM Worker
    WHERE Department = p_Department;

CALL GetAvgSalaryByDepartment('Engineering', @AvgSalary);
SELECT @AvgSalary AS AvgSalaryInEngineering;
