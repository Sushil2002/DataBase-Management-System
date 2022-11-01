Assignment-02(DBMS)

use Lab;
create table  Dept(dept_id int,dname varchar(25),dlocation varchar(25),PRIMARY KEY(dept_id));

create table Employee(emp_id int,dept_id int,fname varchar(25),lname varchar(25),degination varchar(25),salary int,join_date date,FOREIGN KEY(dept_id) REFERENCES Dept(dept_id),PRIMARY KEY(emp_id));

create table Project (proj_id int primary key,dept_id int,pname varchar (25),plocation varchar(25),pcost int,pyear int,foreign key(dept_id) references Dept(dept_id));

--1.Insert at least 10 records in the Employee table and insert other tables accordingly.

insert into Dept values(1,'Computer','Pune');
insert into Dept values(2,'IT','Pune');
insert into Dept values(3,'Computer','Thane');
insert into Dept values(4,'IT','Thane');
insert into Dept values(5,'ENTC','Nashik');
insert into Dept values(6,'ENTC','Nashik');


insert into Employee values(1,1,'Sushil','Dhamane','Intern',10000,'2021-07-26');
insert into Employee values(2,6,'Krushna','Pulate','Team Lead',15000,'2020-05-14');
insert into Employee values(3,2,'Akshay','Patil','Project Manager',15000,'2018-06-27');
insert into Employee values(4,4,'Swayam','Boob','Developer',10000,'2012-07-20');
insert into Employee values(5,5,'Vaibhav','Nanne','Marketing Head',140000,'2014-01-24');
insert into Employee values(6,3,'Akshay','Jhadhav','CEO',100000,'2015-03-02');
insert into Employee values(7,1,'Gaurav','Sable','Team Lead',1046000,'2011-06-25');
insert into Employee values(7,1,'Gaurav','Sable','Team Lead',1046000,'2011-06-25');
insert into Employee values(8,1,'Gaurav','Gnagunrade','Developer',145600,'2014-07-12');
insert into Employee values(9,2,'Manadar','Narkhade','CTO',145410,'2010-04-21');
insert into Employee values(10,3,'Manish','Bhamre','Team Lead',14410,'2009-07-17');


insert into Project values(1,1,'ML','Pune',11005,2020);
insert into Project values(2,6,'Health Care','Mumbai',11455,2021);
insert into Project values(3,1,'Management System','Pune',11405,2024);
insert into Project values(4,3,'Chatbot','Delhi',14785,2015);
insert into Project values(5,4,'Stock Market','Banglore',14774,2017);
insert into Project values(6,2,'Clone App','Nashik',1423,2020);

--2.. Display all Employee details with Department ‘Computer’ and ‘IT’ and Employee first name starting with 'p' or 'h'.
select *from Employee natural join Dept where (Dept.dname='Computer' or Dept.dname='IT') and (emp_id in (select emp_id from Employee where fname like 'S%' or fname like 'G%'));

--3.Lists the number of different Employee Positions.
 select distinct degination from Employee;

--4.Give 10% increase in Salary of the Employee whose joindate before 2010.
update Employee set salary=salary+salary*(10/100) where (YEAR(join_date)>2015); 

--5.Delete all the department details having location as ‘mumbai’.
delete from dept where dlocation='Mumbai';

--6.. Find the names of Projects with location ‘pune’ . 
 select pname from Project where plocation='Pune';

--7.Find the project having cost in between 100000 to 500000.
 select *from Project where pcost>10000 and pcost<14000;

--8.Find the project having maximum price and find average Project cost.
select *from Project where pcost=(select max(pcost) from Project);

--9.Display all employees with Emp _id and Emp name in descending order.
select *from Employee order by fname desc;

--10. Display Proj_name,Plocation ,Pcost of all project started in 2004,2005,2007 
 select pname,plocation,pcost from Project where pyear=2020; 

