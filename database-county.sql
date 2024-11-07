CREATE DATABASE DETAILS;
USE DETAILS;

CREATE TABLE country (
    id INT PRIMARY KEY,
    country_name VARCHAR(50),
    population BIGINT,
    area DECIMAL(10, 2)
);

INSERT INTO country (id, country_name, population, area) VALUES
(1, 'United States', 331002651, 9833517.00),
(2, 'China', 1439323776, 9596961.00),
(3, 'India', 1380004385, 3287263.00),
(4, 'Indonesia', 273523615, 1904569.00),
(5, 'Pakistan', 220892340, 881912.00),
(6, 'Brazil', 212559417, 8515767.00),
(7, 'Nigeria', 600000, 923768.00),
(8, 'Bangladesh', 164689383, 147570.00),
(9, 'Russia', 145934462, 17098242.00),
(10, 'Mexico', 128932753, 1964375.00);

CREATE TABLE Persons (

    Id INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Population INT,
    Rating FLOAT,
    Country_Name VARCHAR(50),
    Country_Id INT
);

INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Name, Country_Id) VALUES
(1, 'John', 'Smith', 346078398 , 4.5, 'USA', 1),
(2, 'Michael', 'Johnson', 39874455 , 3.8, 'Canada', 2),
(3, 'Robert', 'Williams', 1428627663 , 4.7, 'India', 3),
(4, 'James', 'Brown', 27122411 , 4.2, 'Australia', 4),
(5, 'David', 'Jones',67596281 , 4.9, 'UK', 5),
(6, 'Maria', 'Garcia',23456 , 3.6, NULL, NULL),
(7, 'William', 'Miller', 84548231 , 5.0, 'Germany', 6),
(8, 'Linda', 'Davis', 66584368 , 4.1, 'France', 7),
(9, 'Richard', 'Rodriguez', 600000, 2.9, 'lithuania', 8),
(10, 'Joseph', 'Martinez',341814420 , 4.8, 'USA', 1);

SELECT DISTINCT Country_name FROM Persons;
SELECT Fname AS First_Name, Lname AS Last_Name FROM Persons;
SELECT * FROM Persons WHERE Rating > 4.0;
SELECT * FROM Country WHERE Population > 1000000;
SELECT * FROM Persons WHERE Country_name = 'USA' OR Rating > 4.5;
SELECT * FROM Persons WHERE Country_name IS NULL;
SELECT * FROM Persons WHERE Country_name IN ('USA', 'Canada', 'UK');
SELECT * FROM Persons WHERE Country_name NOT IN ('India', 'Australia');
SELECT * FROM Country WHERE Population BETWEEN 500000 AND 2000000;
SELECT * FROM Country WHERE Country_name NOT LIKE 'C%';