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

--List all employees whose name begins with 'A'. 
select * from tblEmp where EName like 'A%'

--Select all those employees who don't have a manager. 
select * from tblEmp where Mgr_Id is null

-- List employee name, number and salary for those employees who earn in the range 1200 to 1400.
select EName,EmpNo,Sal from tblEmp where Sal between 1200 and 1400

--Give all the employees in the RESEARCH department a 10% pay rise. Verify that this has been done by listing all their details before and after the rise. 
select * from tblEmp
update tblEmp
set sal = sal+.1*sal where DeptNo = (select DeptNo from tblDept where Dname='RESEARCH')
select * from tblEmp

-- Find the number of CLERKS employed. Give it a descriptive heading.
select count(*) as 'No of Clerks' from tblEmp where job = 'Clerk'

--Find the average salary for each job type and the number of people employed in each job. 
select job,avg(sal) as 'Average Salary',count(*) as 'No of Employees' from tblEmp group by job

--List the employees with the lowest and highest salary.
select min(Sal) as 'Minimum Salary', max(Sal) as 'Maximum Salary' from tblEmp

-- List full details of departments that don't have any employees. 
select * from tblDept where DeptNo not in (select DeptNo from tblEmp group by DeptNo)

--Get the names and salaries of all the analysts earning more than 1200 who are based in department 20. Sort the answer by ascending order of name. 
select EName,Sal,job,DeptNo from tblEmp where job='Analyst' and Sal>1200 and DeptNo = 20 order by EName

-- For each department, list its name and number together with the total salary paid to employees in that department. 
select DeptNo,sum(sal) from tblEmp group by DeptNo


-- Find out salary of both MILLER and SMITH.
select EName,Sal from tblEmp where EName in ('MILLER','SMITH')

-- Find out the names of the employees whose name begin with ‘A’ or ‘M’. 
select * from tblEmp where EName like '[AM]%'

--Compute yearly salary of SMITH. 
select EName,Sal*12 as 'Yearly Salary' from tblEmp where EName = 'SMITH'

--List the name and salary for all employees whose salary is not in the range of 1500 and 2850. 
select EName,Sal from tblEmp where Sal not between 1500 and 2850

--list all employees along with their managers
select e1.EName as 'Employee Name', m1.EName as 'Manager Name'
from tblEmp e1 inner join tblEmp m1 on e1.Mgr_Id = m1.EmpNo


