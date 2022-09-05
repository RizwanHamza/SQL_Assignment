use AssignmentDB


create table tblDept(
DeptNo int primary key,
DName varchar(20) not null,
Loc varchar(20)
)

insert into tblDept values(10,'Accounting','New York'),
(20,'Research','Dallas'),
(30,'Sales','Chicago'),
(40,'Operations','Boston')

select * from tblDept


create table tblEmp(
EmpNo int primary key,
EName varchar(20) not null,
Job varchar(20),
Mgr_Id int,
HireDate date,
Sal float,
Com float,
DeptNo int foreign key references tblDept(DeptNo)
)

insert into tblEmp values(7369,'SMITH','CLERK',7902,'17-DEC-80',800,null,20),
(7499,'ALLEN','SALESMAN',7698,'20-FEB-81',1600,300,30),
(7521,'WARD','SALESMAN',7698,'22-FEB-81',1250,500,30),
(7566,'JONES','MANAGER',7839,'02-APR-81',2975,null,20),
(7654,'MARTIN','SALESMAN',7698,'28-SEP-81',1250,1400,30),
(7698,'BLAKE','MANAGER',7839,'01-MAY-81',2850,null,30),
(7782,'CLARK','MANAGER',7839,'09-JUN-81',2450,null,10),
(7788,'SCOTT','ANALYST',7566,'19-APR-87',3000,null,20),
(7839,'KING','PRESIDENT',null,'17-NOV-81',5000,null,10),
(7844,'TURNER','SALESMAN',7698,'08-SEP-81',1500,0,30),
(7876,'ADAMS','CLERK',7788,'23-MAY-87',1100,null,20),
(7900,'JAMES','CLERK',7698,'03-DEC-81',950,null,30),
(7902,'FORD','ANALYST',7566,'03-DEC-81',3000,null,20),
(7934,'MILLER','CLERK',7782,'23-JAN-82',1300,null,10)

select * from tblEmp

--Retrieve a list of MANAGERS. 
select distinct(e1.EmpNo),e1.EName from tblEmp e1 inner join tblEmp e2 on e1.EmpNo = e2.Mgr_Id

-- Find out the names and salaries of all employees earning more than 1000 per month
select Ename,Sal from tblEmp where Sal > 1000

-- Display the names and salaries of all employees except JAMES. 
select EName,Sal from tblEmp where Ename <> 'James'

--Find out the details of employees whose names begin with ‘S’. 
select * from tblEmp where Ename like 'S%'

--Find out the names of all employees that have ‘A’ anywhere in their name. 
select * from tblEmp where EName like '%A%'

--Find out the names of all employees that have ‘L’ as their third character in their name. 
select * from tblEmp where EName like '__L%'

--Compute daily salary of JONES. 
select EName,sal/30 'Daily Salary' from tblEmp where EName = 'JONES'

--Calculate the total monthly salary of all employees. 
select sum(Sal) 'Total Salary' from tblEmp 

--Print the average annual salary . 
select avg(Sal) 'Average Salary' from tblEmp

--select the name, job, salary, department number of all employees except SALESMAN from department number 30. 
select EName,job,Sal,DeptNo from tblEmp where DeptNo = 30 and job <> 'SALESMAN'

--List unique departments of the EMP table.
select distinct(tblEmp.DeptNo),DName from tblEmp,tblDept where tblEmp.DeptNo = tblDept.DeptNo

--List the name and salary of employees who earn more than 1500 and are in department 10 or 30. Label the columns Employee and Monthly Salary respectively.
select EName 'Employee',Sal 'Monthly Salary' from tblEmp where Sal>1500 and DeptNo in (10,30)

--Display the name, job, and salary of all the employees whose job is MANAGER or ANALYST and their salary is not equal to 1000, 3000, or 5000.
select Ename,job,Sal from tblEmp where job in ('Manager','Analyst') and Sal not in(1000,3000,5000)

--Display the name, salary and commission for all employees whose commission amount is greater than their salary increased by 10%.
select EName,Sal,Com from tblEmp where Com > (Sal+.1*Sal)

--Display the name of all employees who have two Ls in their name and are in department 30 or their manager is 7782. 
select EName from tblEmp where Ename like '%L%L%' and (DeptNo = 30 or Mgr_Id = 7782)

--Display the names of employees with experience of over 10 years and under 20 yrs. Count the total number of employees.
select EName from tblEmp where DATEDIFF(yy,HireDate,GETDATE()) between 10 and 20

--Retrieve the names of departments in ascending order and their employees in descending order.
select EName,DName from tblEmp e,tblDept d where e.DeptNo = d.DeptNo order by DName asc,Ename desc

--Find out experience of MILLER. 
select DATEDIFF(yy,HireDate,GETDATE()) 'Experience' from tblEmp where EName = 'MILLER'

