CREATE TABLE AREAS(Radius INT,Area INT);

delimiter //

create procedure func(IN radius int,IN area int)
begin
insert into AREAS values(radius,area);
end;
//

create procedure calculate(IN radius int)
begin
DECLARE A int ;
DECLARE R int ;
set R=radius ;
set A=3.14*R*R ;
call func(radius,A);
end;
//


