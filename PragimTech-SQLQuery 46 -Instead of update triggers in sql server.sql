select * from employee
select * from departments
select * from vwEmployeeDetails


alter view vwEmployeeDetails 
as
select 
Id, Name,Gender, DepartName
from employee
join departments
on departments.DepartId = employee.DepartmentId

select * from vwEmployeeDetails

--update affecting multiple base tables 
update vwEmployeeDetails set Name = 'Jose' , 
        DepartName = 'IT' WHERE id = 1 


--update affecting one base tables
update departments set DepartName = 'HR' WHERE DepartId = 3 

--alter trigger  tr_vwEmployeeDetails_instead_Of_Update
--on vwEmployeeDetails
--instead of update 
--as 
--begin 
-- select * from inserted 
-- select *from deleted
--end 

CREATE trigger tr_vwEmployeeDetails_instead_Of_Update
on vwEmployeeDetails
instead of update
as
begin 
	-- if employeeId is updated 
	if (update(id))
	begin 
		raiserror('Id cannot be changed ', 16, 1)
	End

	-- if DeptName is Updated 
	if (update(Name))
	begin 
		Declare @DepartId int
		select @DepartId = DepartId 
		from departments
		join inserted 
		on inserted.Name = departments.DepartName

		if (@DepartId is null)
		begin 
		Raiserror('Invalid  Department Name',16, 1)
		return
end
		update employee set DepartmentId = @DepartId
		from inserted
		join employee
		on employee.id = inserted.id
	end

-- if gender is updated 
if (update(Gender))
 begin 
	update employee set Gender = inserted.Gender
	from inserted
	join employee
	on employee.id = inserted.id
 end

  --if name is updated 
  if (update(Name))
 begin 
	update employee set Name = inserted.Name
	from inserted
	join employee
	on employee.id = inserted.id
 end
end 