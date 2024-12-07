CREATE DATABASE TEACHER;
USE TEACHER;
CREATE TABLE teachers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    subject VARCHAR(100),
    experience INT,
    salary DECIMAL(10, 2)
);

INSERT INTO teachers (name, subject, experience, salary)
VALUES 
    ('John Doe', 'Mathematics', 5, 50000),
    ('Jane Smith', 'Physics', 8, 60000),
    ('Emily Davis', 'Chemistry', 12, 70000),
    ('David Johnson', 'Biology', 3, 45000),
    ('Sarah Wilson', 'English', 15, 55000),
    ('Michael Brown', 'History', 2, 40000),
    ('Laura White', 'Geography', 10, 65000),
    ('James Black', 'Computer Science', 6, 75000);

DELIMITER //

CREATE TRIGGER before_insert_teacher
BEFORE INSERT ON teachers
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'salary cannot be negative';
    END IF;
END //

DELIMITER ;
CREATE TABLE teacher_log (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    teacher_id INT,
    action VARCHAR(50),
    timestamp DATETIME
);

DELIMITER //

CREATE TRIGGER after_insert_teacher
AFTER INSERT ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (NEW.id, 'INSERT', NOW());
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_delete_teacher
BEFORE DELETE ON teachers
FOR EACH ROW
BEGIN
    IF OLD.experience > 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete teacher with more than 10 years of experience';
    END IF;
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER after_delete_teacher
AFTER DELETE ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (OLD.id, 'DELETE', NOW());
END //

DELIMITER ;


