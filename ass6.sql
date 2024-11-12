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

SELECT 
    Persons.Id AS Person_Id,
    Persons.Fname,
    Persons.Lname,
    Persons.Population AS Person_Population,
    Persons.Rating,
    Country.Country_name,
    Country.Population AS Country_Population,
    Country.Area
FROM 
    Persons
INNER JOIN 
    Country ON Persons.Country_Id = Country.Id;

SELECT 
    Persons.Id AS Person_Id,
    Persons.Fname,
    Persons.Lname,
    Persons.Population AS Person_Population,
    Persons.Rating,
    Country.Country_name,
    Country.Population AS Country_Population,
    Country.Area
FROM 
    Persons
LEFT JOIN 
    Country ON Persons.Country_Id = Country.Id;

SELECT 
    Persons.Id AS Person_Id,
    Persons.Fname,
    Persons.Lname,
    Persons.Population AS Person_Population,
    Persons.Rating,
    Country.Country_name,
    Country.Population AS Country_Population,
    Country.Area
FROM 
    Persons
RIGHT JOIN 
    Country ON Persons.Country_Id = Country.Id;

SELECT DISTINCT Country_name FROM Country
UNION
SELECT DISTINCT Fname AS Country_name FROM Persons;

SELECT Country_name FROM Country
UNION ALL
SELECT Fname AS Country_name FROM Persons;

SELECT 
    Id,
    Fname,
    Lname,
    Population,
    ROUND(Rating) AS Rounded_Rating,
    Country_Id
FROM 
    Persons;

