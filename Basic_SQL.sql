create table Student1
(
  student_rollNo int,
 student_name varchar(10),
 student_BOD date,
 student_MNO char,
 student_subject varchar(20),
)
Alter table Student1 ADD student_mark int;

select * from Student1;

drop table student1;

ALTER TABLE Student1 ADD last_Name VARCHAR(100);
 
insert into Student1(student_rollNo,student_name,student_BOD,student_MNO,student_subject,student_mark,last_Name)
values(1,'Sanjivani','2003-09-30',1234567890,'Mathematics',90,'Pore');
---------------------------------------------------------------------------------------------------------------------------------------------------
#OPERATOR:

1.Arithmatic Operator

select 10+5 AS result;

select 10-4 AS result;

select 33/3 As result;

select 33%3 AS result;

----Select 33^3 As result;-----------------------------------------------------------------------------------------------------------------------
SELECT POWER(33, 3) AS result;

2.logical operator

create table Logical_Operator
(
age int,
grade char(2),
name varchar(10)
);

select * from Logical_Operator;

insert into Logical_Operator(age,grade,name)values(17,'A','Sujit');

AND:

select * from Logical_Operator where age>=18 AND grade='A';

select * from Logical_Operator where age>18 OR grade='B';

select * from Logical_Operator where age BETWEEN 18 AND 25;

select * from Logical_Operator where age   IN(18,22);

SELECT * FROM Logical_Operator
WHERE (age >= 18 AND grade = 'A') OR (age > 18 AND grade = 'B');

SELECT * FROM students
WHERE (age > 18 AND grade = 'A') OR (age < 18 AND grade = 'B');


select * from Logical_Operator where age   NOT IN(18,22);
-------------------------------------------------------------------------------------------------------------------------------------------------------
3.Set Operator

