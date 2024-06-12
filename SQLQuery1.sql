Create database University;
USE University;

Create table Modules(
modulenumber int primary key not null,
modulename varchar(255),
modulecode varchar(255),
lecture varchar(255),
);

Create table students(
studentnumber int primary key not null,
studentnames varchar(255),
studentEmail varchar(255),
studentaddress varchar(255),
studentcell varchar(255),

);
INSERT INTO Modules values
(1,'Development Software 2A', 'DSW02A','Prof kennedy'),
(2,'Information Systems 2A','IFS02A','DR Patrick'),
(3,'Business Analysis 2A','BAY02A','Bvuma Stella'),
(4, 'Communication Networking','CMN02A','Tebogo');

INSERT INTO students VALUES
(12,'Madubye kapkap','danielkapkap@gmail.com','Mokopane', '062-456-3435'),
(13,'malepa thabang','thabang@gmail.com','bakenburg','081-673-3567'),
(14,'Nkomo nimrod','nkomo@yahoo', 'bakenburg','062-2456-6789');
SELECT * FROM students;
SELECT studentnames
from students

SELECT * from Modules
WHERE modulenumber='1';

select *from students
where studentEmail like '%gmail.com%';

select 
* from modules
where modulename like '%system%';
