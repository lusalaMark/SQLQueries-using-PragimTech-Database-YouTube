CREATE TRIGGER tr_tblEmployee_ForUpdate
ON tblEmployee
FOR UPDATE 
AS 
BEGIN 
	
	select * from deleted
	select * from inserted

END

update tblEmployee set Name = 'James', Salary = 3000, Gender = 'Male'
where id = 8 
DELETE  FROM tblEmployee 
WHERE Id = 1

ALTER  trigger  tr_tblEmployee_ForUpdate
on tblEmployee
for update 
as 
begin 
declare @Id int
declare @OldName nvarchar(50), @NewName nvarchar(50)
declare @OldSalary int, @NewSalary int
declare	@oldGender nvarchar(10), @NewGender nvarchar(10)
declare @OldDepartmentId int, @NewDepartmentId int

declare @AuditString nvarchar(1000)
 
 select * 
 into #TempTable
 from inserted

 while (Exists(Select Id from #TempTable))
 Begin 
 set @AuditString = ''
 SELECT TOP 1 @Id = Id,	@NewName  = Name,
 @NewGender = Gender, @NewSalary = Salary, 
 @NewDepartmentId = DepartmentId
 from #TempTable

 SELECT @OldName = Name, @OldGender = Gender , @OldSalary = Salary,
 @OldDepartmentId = DepartmentId 
 from deleted where Id = @Id

 SET @AuditString  = 'Employee with Id = ' + cast(@Id as nvarchar(4))+ ' changed '

 if(@OldName <> @NewName)
 set @AuditString = @AuditString + 'NAME from ' + @OldName + ' to ' + @NewName

 if(@OldGender <> @NewGender)
 set @AuditString = @AuditString + 'Gender from ' + @OldGender + ' to ' + @NewGender

  if(@OldSalary <> @NewSalary)
 set @AuditString = @AuditString + 'Salary from ' + @OldSalary + ' to ' + @NewSalary

  if(@OldDepartmentId <> @NewDepartmentId)
 set @AuditString = @AuditString + 'DepartmentId from ' + @OldDepartmentId + ' to ' + @NewDepartmentId

 insert into tblEmployeeAudit values(@AuditString)
 delete from #TempTable where Id = @Id
 end 
 end 

select * from tblEmployee
select * from tblEmployeeAudit
 update tblEmployee set Name = 'Rodda', Salary = 900, Gender ='Female'
 where Id = 4