--Note:
--1.Specifying a parameter as IN, OUT, or INOUT is valid only for a PROCEDURE. For a FUNCTION, parameters are always regarded as IN parameters.
--2.The RETURNS clause may be specified only for a FUNCTION not for PROCEDURE.



create table Info(City varchar(25));

 delimiter //
 create procedure solve(IN city varchar(25))
 begin
 insert into Demo values(city);
 end;
 //

call solve('Pune');//


CREATE FUNCTION hello (s CHAR(20));
RETURNS CHAR(50) DETERMINISTIC
RETURN CONCAT('Hello, ',s,'!');


SELECT hello('world');



