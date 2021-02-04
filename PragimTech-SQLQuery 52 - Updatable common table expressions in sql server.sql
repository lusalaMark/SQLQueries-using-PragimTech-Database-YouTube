WITH 
EmployeeCTE (id,[Name],Manager,[Level] )
as 
(
	select id,[Name], ManagerId,1
	from tblemployManager
	where ManagerId is null 

	union all
	select tblemployManager.id, tblemployManager.Name, 
	tblemployManager.ManagerId,EmployeeCTE.[Level]+1
	from tblemployManager
	join EmployeeCTE
	on tblemployManager.ManagerId = EmployeeCTE.id

	
)

select empCTE.Name as Employee, isnull (MgrCTE.Name, 'Super Boss') as Manager,
empCTE.[Level]
from Employee.CTE empCTE
LEFT JOIN employeeCTE MgrCTE
ON empCTE.ManagerId = MgrCTE.id

select * from tblemployManager