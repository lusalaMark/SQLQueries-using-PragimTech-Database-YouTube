create database db_View
create table tblemployees(Id int NOT NULL,[Name] varchar(20), Salary int , Gender varchar(20),Department_Id int)
create table tblemployeesDepartment(Id int NOT NULL,[Depart_Name] varchar(20))


insert into tblemployees values(1, 'Mark', 200000, 'Male', 1)
insert into tblemployees values(2, 'Fanice', 100000, 'Female', 3)
insert into tblemployees values(3, 'Martin', 10000, 'Male', 2)
insert into tblemployees values(4, 'Marry', 40000, 'Female', 1)
insert into tblemployees values(5, 'Faith', 20000, 'Female', 3)
insert into tblemployees values(6, 'Marcus', 25000, 'Male', 4)

insert into tblemployeesDepartment values (1, 'IT')
insert into tblemployeesDepartment values (2, 'Payroll')
insert into tblemployeesDepartment values (3, 'HR')
insert into tblemployeesDepartment values (4, 'Admin')


select * from tblemployees
select * from tblemployeesDepartment

select  [Name], Salary, Gender, Depart_Name 
from tblemployees
JOIN  tblemployeesDepartment
ON  tblemployees.Department_Id = tblemployeesDepartment.Id

create view vwEmployeesDepartment
as
select  [Name], Salary, Gender, Depart_Name
from tblemployees
JOIN  tblemployeesDepartment
ON  tblemployees.Department_Id = tblemployeesDepartment.Id

create view vwITEmployeesDepartment
as
select  [Name], Salary, Gender, Depart_Name
from tblemployees
JOIN  tblemployeesDepartment
ON  tblemployees.Department_Id = tblemployeesDepartment.Id
where tblemployeesDepartment.Depart_Name = 'IT'

select * from vwEmployeesDepartment
SELECT * FROM vwITEmployeesDepartment