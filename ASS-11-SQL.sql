CREATE DATABASE library;

USE library;

CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(15)
);

CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(100),
    Position VARCHAR(100),
    Salary DECIMAL(10, 2),
    Branch_no INT );
   

CREATE TABLE Books (
    ISBN VARCHAR(20) PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(100),
    Rental_Price DECIMAL(10, 2),
    Status VARCHAR(3), -- 'yes' or 'no'
    Author VARCHAR(100),
    Publisher VARCHAR(100)
);

CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(100),
    Customer_address VARCHAR(255),
    Reg_date DATE
    );

CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    ISBN_book VARCHAR(20));



CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    ISBN_book2 VARCHAR(20));
   

INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no)
VALUES (1, 101, '123 Main St, City', '1234567890');

INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no)
VALUES (1, 'John Doe', 'Manager', 60000, 1),
       (2, 'Jane Smith', 'Assistant', 45000, 1),
       (3,'Rohith raj', 'Manager', 60000, 1),
       (4,'abi','clerk',40000,1),
       (5, 'Eve', 'Assistant', 42000, 1),
        (6, 'Frank', 'Clerk', 32000, 1),
(7, 'Grace', 'Manager', 70000, 1),
(8, 'Hank', 'Clerk', 35000, 1),
(9, 'Ivy', 'Assistant', 41000, 1),
(10, 'Jack', 'Clerk', 33000, 1),
(11, 'Liam', 'Assistant', 43000, 2),
(12, 'Mia', 'Clerk', 34000, 2),
(13, 'Noah', 'Manager', 75000, 2),
(14, 'Olivia', 'Clerk', 36000, 2),
(15, 'Sophia', 'Assistant', 45000, 2),
(16, 'James', 'Clerk', 37000, 2);

	  

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES ('978-1-23456-789-0', 'History of Science', 'History', 30.00, 'yes', 'John Smith', 'XYZ Publishing'),
       ('978-1-23456-789-1', 'Advanced Programming', 'Technology', 50.00, 'no', 'Alice Brown', 'ABC Publishers');

INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES (1, 'Rohith Raj', 'kodakara tcr', '2022-01-01'),
       (2, 'Sara Williams', '789 Pine Rd', '2022-01-10'),
       (3,'anandhu s','kodaly tcr','2022-01-15'),
       (4,'noyal mj','chiyyaram','2002-02-4'),
       (5,'Akshay','kodakara','2001-02-2');


INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, ISBN_book)
VALUES (1, 1, 'History of Science', '2023-06-10', '978-1-23456-789-0'),
	(2,2,'Power','2022-01-15','968-2-67896-709-1');

       

INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, ISBN_book2)
VALUES (1, 1, 'History of Science', '2023-07-10', '978-1-23456-789-0');

SELECT Book_title, Category, Rental_Price
FROM Books
WHERE Status = 'yes';

SELECT Emp_name, Salary
FROM Employee
ORDER BY Salary DESC;

SELECT B.Book_title, C.Customer_name
FROM Books B
JOIN IssueStatus I ON B.ISBN = I.ISBN_book
JOIN Customer C ON I.Issued_cust = C.Customer_Id;

SELECT Category, COUNT(*) AS Total_Books
FROM Books
GROUP BY Category;

SELECT Emp_name, Position
FROM Employee
WHERE Salary > 50000;

SELECT C.Customer_name
FROM Customer C
LEFT JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust
WHERE C.Reg_date < '2022-01-01' AND I.Issue_Id IS NULL;

SELECT E.Branch_no, COUNT(E.Emp_Id) AS Total_Employees
FROM Employee E
GROUP BY E.Branch_no;

SELECT DISTINCT C.Customer_name
FROM Customer C
JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust
WHERE I.Issue_date BETWEEN '2023-06-01' AND '2023-06-30';

SELECT Book_title
FROM Books
WHERE Book_title LIKE '%history%';

SELECT E.Branch_no, COUNT(E.Emp_Id) AS Total_Employees
FROM Employee E
GROUP BY E.Branch_no
HAVING COUNT(E.Emp_Id) > 5;

SELECT E.Emp_name, B.Branch_address
FROM Employee E
JOIN Branch B ON E.Branch_no = B.Branch_no
WHERE E.Position = 'Manager';

SELECT DISTINCT C.Customer_name
FROM Customer C
JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust
JOIN Books B ON I.ISBN_book = B.ISBN
WHERE B.Rental_Price > 25;
