--Database Trigger (All Types: Row level and Statement level triggers, Before and After Triggers).
--Write a database trigger on Library table. The System should keep track of the records that are being updated or deleted. The old value of updated or deleted records should be added in
--Library_Audit table.
--Note: Instructor will Frame the problem statement for writing PL/SQLblock for all types of Triggers in line with above statement.


CREATE TABLE lib_table(Book_id VARCHAR(25),Title VARCHAR(25),Edition VARCHAR(25),Noofcopies INT);

CREATE TABLE lib_audit_table(Book_id VARCHAR(25),Title VARCHAR(25),Edition VARCHAR(25),Noofcopies INT,Date_of_modif DATE,Types_of_operation VARCHAR(25),Username VARCHAR(25));

delimiter //

CREATE PROCEDURE Intolib(IN  book_id  VARCHAR(25),IN title VARCHAR(25) , IN edition VARCHAR(25) , IN noofcopies INT)
BEGIN
 INSERT INTO  lib_table  VALUES(book_id , title , edition , noofcopies) ;
END;
//

delimiter ;

CALL Intolib('DS901','Dis.System','2018',4);
CALL Intolib('AS941','M.Learning','2014',2);
CALL Intolib('HI901','HC.Interface','2009',7);
CALL Intolib('TC901','TO.Computation','2017',6);
CALL Intolib('GH901','DBM.System','2010',1);

delimiter //

CREATE TRIGGER trig_update 
 AFTER UPDATE ON lib_table
 FOR EACH ROW
 BEGIN
 INSERT INTO lib_audit_table VALUES(OLD.Book_id,OLD.Title,OLD.Edition,OLD.Noofcopies,CURDATE(),'UPDATE',CURRENT_USER());
 END;
//

CREATE TRIGGER trig_del
 AFTER DELETE ON lib_table
 FOR EACH ROW
 BEGIN
 INSERT INTO lib_audit_table VALUES(OLD.Book_id,OLD.Title,OLD.Edition,OLD.Noofcopies,CURDATE(),'DELETE',CURRENT_USER());
 END;
//

delimiter ;

UPDATE lib_table SET Noofcopies=5 WHERE Book_id='GH901';

select *from lib_table;

select *from lib_audit_table ;

DELETE FROM lib_table where Book_id='GH901';

select *from lib_table;

select *from lib_audit_table ;












