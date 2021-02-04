CREATE TABLE tblEmployeeAudit(id int PRIMARY KEY NOT NULL IDENTITY(1,1),
Audit_Data nvarchar(90))

select * from tblEmployee
SELECT * FROM tblEmployeeAudit

SELECT * FROM inserted

ALTER TRIGGER tr_tblEmployee_ForInsert
ON tblEmployee
FOR INSERT 
AS 
BEGIN 
	
	DECLARE @Id int 
	SELECT @Id = Id FROM  inserted

	insert into tblEmployeeAudit
	Values ('New Employee with Id  = ' + CAST(@Id as nvarchar(5)) + ' is added at ' +
	cast (GETDATE() as nvarchar(20)))
END

insert into tblEmployee values (10, 'Jimmy', 2900,'male',3)

CREATE TRIGGER tr_tblEmployee_ForDelete
ON tblEmployee
FOR DELETE 
AS 
BEGIN 
	
	DECLARE @Id int 
	SELECT @Id = Id FROM  deleted

	insert into tblEmployeeAudit
	Values ('An existing Employee with Id  = ' + CAST(@Id as nvarchar(5)) + ' is deleted at' +
	cast (GETDATE() as nvarchar(20)))
END

DELETE  FROM tblEmployee 
WHERE Id = 1
