--PROBLEM STATEMENT

--Write a Stored Procedure namely proc_Grade for the categorization of student. If marks scored
--by students in examination is <=1500 and marks>=990 then student will be placed in distinction
--category if marks scored are between 989 and900 category is first class, if marks899and 825
--category is Higher Second Class.
--Write a PL/SQLblock to use procedure created with above requirement.
--Stud_Marks(name, total_marks)
--Result(Roll,Name, Class)
--Note: Instructor will frame the problem statement for writing stored procedure and Function in
line with above statement.


CREATE TABLE Student(Name varchar(25),Totalmarks int);//

INSERT INTO Student VALUES('A',1390);//
INSERT INTO Student VALUES('B',1500);//
INSERT INTO Student VALUES('C',924);//
INSERT INTO Student VALUES('D',821);//
INSERT INTO Student VALUES('E',542);//


CREATE TABLE Result(RollNo int,Name varchar(25),Class varchar(25));//

INSERT INTO Result VALUES(1,'A','NULL');//
INSERT INTO Result VALUES(2,'B','NULL');//
INSERT INTO Result VALUES(3,'C','NULL');//
INSERT INTO Result VALUES(4,'D','NULL');//
INSERT INTO Result VALUES(5,'E','NULL');//

delimiter //

CREATE FUNCTION Grade(roll int)
RETURNS varchar(25)
DETERMINISTIC
BEGIN
DECLARE GRADE varchar(25);
DECLARE marks1 int;
SELECT Totalmarks INTO marks1 FROM Student as s,Result as r where s.Name=r.Name and roll=r.RollNo;
IF(marks1<=1500 and marks1>=990) THEN 
UPDATE Result SET Class='Distinction' WHERE Result.RollNo=roll;
SET GRADE='Distinction';
ELSEIF( marks1>=900 and marks1<=989) THEN
UPDATE Result SET Class='Frist Class' WHERE Result.RollNo=roll;
SET GRADE='First Class';
ELSEIF(marks1>=825 AND marks1<=899) THEN
UPDATE Result SET Class='Higher Second Class' WHERE Result.RollNo=roll;
SET GRADE='Higher Second Class';
ELSE 
UPDATE Result SET Class='Fail' WHERE Result.RollNo=roll;
SET GRADE='Fail';
END IF;
return GRADE;
END;
//




































