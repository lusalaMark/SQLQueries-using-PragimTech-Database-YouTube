with EmployeeCountBy_Payroll_It_Department (DepartmentName, Total)
as
(
		select Name, count(id) as TotalEmployees
		from tblemployee
		join tblDepartment
		on tblemployee.DepartmentId = tblDepartment.DepartId
		where DepartName in (' Payroll','IT')
		group by Name
),
EmployeeCountBy_HR_Admin_Department (DepartmentName, Total)
as
(
		select Name, count(id) as TotalEmployees
		from tblemployee
		join tblDepartment
		on tblemployee.DepartmentId = tblDepartment.DepartId
		where DepartName in (' HR','Admin')
		group by Name
)
select * from EmployeeCountBy_Payroll_It_Department
union 
select * from EmployeeCountBy_HR_Admin_Department

