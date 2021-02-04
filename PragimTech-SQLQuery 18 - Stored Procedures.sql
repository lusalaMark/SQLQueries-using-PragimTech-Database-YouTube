spGetEnployeeByGenderAndDepartment 'Male',3

CREATE PROC spGetEnployeeByGenderAndDepartment

@Gender nvarchar(50),
@DepartmentId  int 
AS
BEGIN 
select [name], Gender, DepartmentId from Employees where Gender = @Gender and DepartmentId = @DepartmentId 
END


select * from Employees