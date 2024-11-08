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


INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id)
VALUES 
(1, 'John', 'Doe', 5000, 4.5, 1),
(2, 'Jane', 'Smith', 3000, 3.9, 2),
(3, 'Rohith', 'Raj', 100000, 4.2, 3),
(4, 'Michael', 'Williams', 15000, 4.8, 4),
(5, 'Emily', 'Brown', 2000, 3.5, 5),
(6, 'Linda', 'Jones', 2500, 4.0, 6),
(7, 'David', 'Garcia', 3000, 4.1, 7),
(8, 'James', 'Martinez', 7000, 3.8, 8),
(9, 'Jennifer', 'Rodriguez', 4000, 4.7, 9),
(10, 'Patricia', 'Martinez', 5000, 3.6, 10);

SELECT LEFT(Country_name, 3) AS Country_Abbreviation FROM Country;

SELECT CONCAT(Fname, ' ', Lname) AS Full_Name FROM Persons;

SELECT COUNT(DISTINCT Country_Id) AS Unique_Countries FROM Persons;

SELECT MAX(Population) AS Max_Population FROM Country;

SELECT MIN(Population) AS Min_Population FROM Persons;

INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id)
VALUES 
(11, 'Alice', NULL, 4000, 3.5, 1),
(12, 'Tom', NULL, 5000, 4.0, 2);

SELECT COUNT(Lname) AS Non_Null_Lnames FROM Persons;

SELECT COUNT(*) AS Total_Rows FROM Persons;


SELECT Population FROM Country LIMIT 3;

SELECT * FROM Country ORDER BY RAND() LIMIT 3;

SELECT * FROM Persons ORDER BY Rating DESC;

SELECT Country_Id, SUM(Population) AS Total_Population 
FROM Persons 
GROUP BY Country_Id;

SELECT Country_Id 
FROM Persons 
GROUP BY Country_Id 
HAVING SUM(Population) > 50000;

SELECT Country_Id, COUNT(*) AS Total_Persons, AVG(Rating) AS Average_Rating 
FROM Persons 
GROUP BY Country_Id 
HAVING COUNT(*) > 2 
ORDER BY Average_Rating ASC;