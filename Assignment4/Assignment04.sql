--Unnamed PL/SQLcode block: Use of Control structure and Exception handling is mandatory.

--Suggested Problem statement:

--Consider Tables:

--1. Borrower(Roll_no, Name, Date of Issue, Name of Book, Status)

--2. Fine(Roll_no, Date, Amt)

--Accept Roll_no and Name of Book from user.

--Check the number of days (from date of issue).

--If days are between 15 to 30 then fine amount will be Rs 5per day.

--If no. of days>30, per day fine will be Rs 50 per day and for days less than 30, Rs. 5 per day.



CREATE TABLE Borrower(RollNo int,Name varchar(25),DOI date,BookName varchar(25),Status varchar(5));

CREATE TABLE Fine(RollNo int,Date date,Amt int);

delimiter //

 create procedure solve(IN rollno int,IN name varchar(25),IN doi date,IN bookname varchar(25),IN status varchar(25))
 begin
    insert into Borrower values(rollno,name,doi,bookname,status);
 end;
 //

call solve(1,'Anurag','2021-05-29','DBMS','I');//
call solve(2,'Ayush','2022-06-29','TOC','I');//
call solve(3,'Sayeed','2022-07-15','SPOS','I');//
call solve(4,'Darshan','2022-08-20','CNS','I');//
call solve(5,'Viraj','2022-07-02','DSA','I');//

CREATE PROCEDURE calculate(IN rollno int,IN bookname varchar(25))
BEGIN
	DECLARE date_of_issue date;
	DECLARE days int;
	DECLARE fine int ;
SELECT DOI into date_of_issue from Borrower where Borrower.rollno=rollno and Borrower.bookname=bookname;
	SET days = DATEDIFF(CURDATE(),date_of_issue);

	IF (days>=15 AND days<=30) THEN
		SET fine=5*days;
	ELSEIF (days>30) then
		SET fine=(days-30)*50+30*5;
	END IF;

	UPDATE Borrower SET Status='R' where Borrower.rollno=rollno and Borrower.bookname=bookname;
	IF(fine is not null) THEN
		insert into Fine values(rollno,CURDATE(),fine);
	END IF;
END //



 call calculate(1,'DBMS');//
 call calculate(2,'TOC');//
call calculate(4,'CNS');//

