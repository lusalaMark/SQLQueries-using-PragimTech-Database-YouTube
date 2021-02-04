CREATE TABLE employee(id int,Name nvarchar (50), Gender nvarchar (10),DepartmentId int)

 insert into employee values (1,'John',	'Male', 3)
 insert into employee values (2, 'MIKE',	'Male', 2)
 insert into employee values (3, 'Pam',	'Female', 1)
 insert into employee values (4, 'Todd',	'Male', 4)
 insert into employee values (5, 'Sara',	'Femalee', 1)
 insert into employee values (6, 'Ben',	'Male', 3)

 create table departments(DepartId int, DepartName nvarchar(30))
 insert into departments values (1, 'IT')
 insert into departments values (2, 'Payroll')
 insert into departments values (3, 'HR')
 insert into departments values (4, 'Admin')

select * from employee
select * from departments



alter view vwEmployeeDetails 
as
select 
Id, Name,Gender, DepartName
from employee
join departments
on departments.DepartId = employee.DepartmentId

select * from vwEmployeeDetails

insert into vwEmployeeDetails values (8, 'Valie', 'Female', 'IT')

create trigger  tr_vwEmployeeDetails_instead_Of_Insert
on vwEmployeeDetails
instead of insert 
as 
begin 
 select * from inserted 
 select *from deleted
end 

alter trigger tr_vwEmployeeDetails_instead_Of_Insert
on vwEmployeeDetails
instead of insert
as
begin 
 Declare @DepartId int
 
 select @DepartId = DepartId 
 from departments
 join inserted 
 on inserted.DepartName = departments.DepartName

 if (@DepartId is null)
 begin 
 Raiserror('Invalid  Department Name. Statement terminated',16, 1)
 return
end

insert into employee (id, Name, Gender,DepartmentId)
select Id, Name, Gender, @DepartId
from inserted
end 

