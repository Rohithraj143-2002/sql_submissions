create database School;
use School;
create table Student (Roll_No int primary key, Name varchar(25),
Marks int,
Grade char(1)
);

insert into Student (Roll_No,Name,Marks,Grade)
values
(1,'Rohith',85,'A'),
(2,'Anandhu',75,'B'),
(3,'charlie',95,'A'),
(4,'Akhil',65,'C');

select * from Student;
alter table Student add Contact varchar(15);
alter table Student drop column Grade;
alter table Student rename to Classten;
truncate table Classten;
drop table Classten;