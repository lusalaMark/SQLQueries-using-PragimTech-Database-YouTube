-- CTE with one base table 
with Employees_Name_Gender 
as
(
select Id, Name, Gender
from tblemployee
)
select * from Employees_Name_Gender

-- updating a CTE 

with Employees_Name_Gender
as
(
select Id, Name,Gender  
from tblEmployee
)
update Employees_Name_Gender set Gender = 'male' 
where Id = 1

select * from tblEmployee

-- CTE on 2 base tables, update affecting only one base table
with EmployeeByDepartment
as
(
select Id, Name, Gender, DepartName
from tblemployee
join tblDepartment
on tblDepartment.DepartId = tblemployee.DepartmentId
)
update EmployeeByDepartment set Gender = 'Male' where id = 1

select * from tblemployee
select * from tblDepartment