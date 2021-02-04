with EmployeeCount (DepartmentId, TotalEmployees)
as
(
		select DepartmentId, count(*) as total_Employees
		from employee
		group by DepartmentId
)

select DepartName, TotalEmployees
from departments
join EmployeeCount
on departments.DepartId = EmployeeCount.DepartmentId
ORDER BY TotalEmployees

select * from employee
select * from departments

