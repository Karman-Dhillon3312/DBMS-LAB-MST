-- Question 2: Course Registration System
-- A. Theory:
-- Explain the importance of integrity constraints in SQL. Describe how Primary Key, Foreign Key, NOT NULL, UNIQUE, DEFAULT, and CHECK constraints prevent invalid data. Also explain how DDL and DML commands are used to manage the database.
-- B. Practical:
-- Create a Course Registration System using Student and Course tables.
-- 1. Create both tables with suitable attributes.
-- 2.-- Use a Primary Key for each table and establish a Foreign Key relationship.
-- 3. Apply suitable NOT NULL, UNIQUE, DEFAULT, and CHECK constraints.
-- 4. Insert at least 5 students and 4 courses.
-- 5. Display students enrolled in a particular course.
-- 6. Update the course of a student.
-- 7. Delete a student using a suitable condition.
-- 8. Add a new column using ALTER.
-- 9. Rename one table using RENAME.
-- 10. Display the final records using SELECT.

create database studentDB;
use studentDB;


create table course (
	courseID int primary key,
    course_name varchar(100) not null,
    department varchar(100) not null
);

create table student (
	rollno int primary key,
    name varchar(50),
    age int check (age > 16),
    courseID int,
    foreign key (courseID)
		references course (courseID)
        
);


insert into course (courseID, course_name, department)
values
(101, 'aiml', 'ait'),
(102, 'mba', 'aim'),
(103, 'cyber', 'ait'),
(104, 'bba', 'ef1');

insert into student (rollno , name , age, courseID)
values
(1,'karman', 20, 101),
(2, 'kartik', 19, 101),
(3, 'tanuj', 21, 102),
(4, 'aditya', 21, 103),
(5, 'arpan', 19, 104);
    
set SQL_SAFE_UPDATES = 0;
    
select * from student;
select * from course;

-- particular display
select * from student
where courseID = 102;

-- update student
update student
set courseID = 102
where rollno = 5;

-- delete a student
delete from student
where rollno = 4;

alter table student
add attendace int;

update student
set attendace = 90
where rollno = 1;

update student
set attendace = 85
where rollno = 2;

update student
set attendace = 80
where rollno = 3;

update student
set attendace = 95
where rollno = 5;


-- rename table
alter table course
rename column courseID to course_ID;

-- display
select * from course;
select * from student;








