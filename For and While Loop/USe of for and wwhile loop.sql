create procedure A(IN radius int)
begin
DECLARE Ar int;
DECLARE R int;
set R=radius;
set Ar=R*R*3.14;
SELECT concat('Area is ', Ar);
end;
 //



-- While LOOP

create procedure find()
begin
declare st int;
set st=3;
while st<9 do
 	call A(st);
	set st=st+1;
end while;
end;
//


-- For LOOP

create procedure find1()
begin
declare st int;
set st=3;
label : LOOP
	if st > 8  then 
	leave label;
	end if;
	call A(st);
	set st=st+1;
	iterate label;
end LOOP;
end;
//


