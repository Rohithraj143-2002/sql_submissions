CREATE DATABASE COUNTRY;
USE COUNTRY;

CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(50),
    Population INT,
    Area INT
);

CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Population INT,
    Rating FLOAT,
    Country_Id INT,
    DOB DATE,
    FOREIGN KEY (Country_Id) REFERENCES Country(Id)
);

INSERT INTO Country (Id, Country_name, Population, Area)
VALUES 
(1, 'USA', 331000000, 9833520),
(2, 'Canada', 38000000, 9984670),
(3, 'Brazil', 213000000, 8515770),
(4, 'UK', 67000000, 243610),
(5, 'Australia', 25600000, 7692024),
(6, 'India', 1380000000, 3287263),
(7, 'China', 1440000000, 9596961),
(8, 'Russia', 146000000, 17098242),
(9, 'Japan', 126000000, 377975),
(10, 'Germany', 83000000, 357022);

INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, DOB)
VALUES 
(1, 'John', 'Doe', 5000, 4.5, 1, '1980-01-15'),
(2, 'Jane', 'Smith', 3000, 3.9, 2, '1992-07-23'),
(3, 'Rohith', 'Raj', 100000, 4.2, 3, '1985-05-12'),
(4, 'Michael', 'Williams', 15000, 4.8, 4, '1978-03-11'),
(5, 'Emily', 'Brown', 2000, 3.5, 5, '1995-11-29'),
(6, 'Linda', 'Jones', 2500, 4.0, 6, '1988-08-17'),
(7, 'David', 'Garcia', 3000, 4.1, 7, '1990-09-05'),
(8, 'James', 'Martinez', 7000, 3.8, 8, '1982-12-19'),
(9, 'Jennifer', 'Rodriguez', 4000, 4.7, 9, '1984-06-30'),
(10, 'Patricia', 'Martinez', 5000, 3.6, 10, '1993-02-22');
DELIMITER //

CREATE FUNCTION CalculateAge(DOB DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE Age INT;
    
    SET Age = TIMESTAMPDIFF(YEAR, DOB, CURDATE());
    RETURN Age;
END //
DELIMITER ;


SELECT Id, Fname, Lname, DOB, CalculateAge(DOB) AS Age
FROM Persons;

SELECT Country_name, LENGTH(Country_name) AS Name_Length
FROM Country;

SELECT Country_name, LEFT(Country_name, 3) AS First_Three_Chars
FROM Country;

SELECT Country_name, UPPER(Country_name) AS Country_Uppercase, LOWER(Country_name) AS Country_Lowercase
FROM Country;