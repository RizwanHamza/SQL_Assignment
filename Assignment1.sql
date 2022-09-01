create database AssignmentDB
use AssignmentDB


--Clients Table
create table tblClients(
Client_ID int primary key,
Cname varchar(40) not null,
Address varchar(30),
Email varchar(30) unique,
Phone varchar(10),
Business varchar(20) not null
)

insert into tblClients values(1001,'ACME Utilities','Noida','contact@acmeutil.com','9586743632','Manufacturing'),
(1002,'Trackon Consultants','Mumbai','consult@trackon.com','8734567218','Consultant'),
(1003,'MoneySaver Distributors','Kolkata','save@moneysaver.com','7799845763','Reseller')

select * from tblClients


--Departments Table
create table tblDepartments(
Deptno int primary key,
Dname varchar(15) not null,
Loc varchar(20)
)

insert into tblDepartments values(10,'Design','Pune'),
(20,'Development','Pune'),
(30,'Testing','Mumbai')

select * from tblDepartments


--Employees Table
create table tblEmployees(
Empno int primary key,
Ename varchar(20) not null,
Job varchar(20),
salary float check(salary>0),
Deptno int foreign key references tblDepartments(Deptno)
)

insert into tblEmployees values(7001,'Sandeep','Analyst',25000,10),
(7002,'Rajesh','Designer',30000,10),
(7003,'Madhav','Developer',40000,20),
(7004,'Manoj','Testing',40000,30)

select * from tblEmployees


--Projects Table
create table tblProjects(
Project_ID int primary key,
Descr varchar(30) not null,
Start_Date date,
Planned_End_Date date,
Actual_End_Date date ,
Budget int check(Budget>0),
Client_Id int Foreign key references tblClients(Client_Id),
check(Actual_End_Date>Planned_End_Date)
)

insert into tblProjects values(401,'Inventory','01-Apr-11','01-Oct-11','31-Oct-11',150000,1001)
insert into tblProjects(Project_ID,Descr,Start_Date,Planned_End_Date,Budget,Client_Id) values(402,'Accounting','01-Aug-11','01-Jan-12',500000,1002),
(403,'Payroll','01-Oct-11','31-Dec-11',75000,1003)

select * from tblProjects


--EmpProjectTasks Table
create table tblEmplProjectTasks(
Project_ID int,
Empno int,
Start_Date date,
End_Date date,
Task varchar(25) not null,
Status varchar(15) not null,
primary key(Project_ID,Empno),
constraint fk_proid foreign key(Project_ID) references tblProjects(Project_ID),
constraint fk_emp foreign key(Empno) references tblEmployees(Empno)
)

insert into tblEmplProjectTasks values(401,7001,'01-Apr-11','20-Apr-11','System Analysis','Completed'),
(401,7002,'21-Apr-11','30-May-11','System Design','Completed'),
(401,7003,'01-Jun-11','15-Jul-11','Coding','Completed'),
(402,7002,'22-Aug-11','30-Sep-11','System Design','Completed')

select * from tblEmplProjectTasks

