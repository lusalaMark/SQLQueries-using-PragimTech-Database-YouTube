CREATE TABLE tblEmployee(Id int NOT NULL, Name NVARCHAR(50) NOT NULL, Salary INT, Gender NVARCHAR(50), DepartmentId int)

INSERT INTO tblEmployee VALUES (1, 'John', 5000,'Male',3)
INSERT INTO tblEmployee VALUES (2, 'Mkey', NULL,'Male',2)
INSERT INTO tblEmployee VALUES (3, 'Pam', 6000,'Female',1)
INSERT INTO tblEmployee VALUES (4, 'Todd', 4800,'Male',4)
INSERT INTO tblEmployee VALUES (5, 'Sara', 3200,'Female',1)
INSERT INTO tblEmployee VALUES (6, 'Ben', 4800,'Male',3)

SELECT * FROM  tblEmployee

CREATE VIEW vwEmployeeDetailsExceptSalary
as
SELECT Id, Name,Gender, DepartmentId
FROM tblEmployee

SELECT * FROM vwEmployeeDetailsExceptSalary
WHERE Gender = 'Male'

-- INLINE TABLE VALUED FUNCTION AS A REPLACEMENT FOR PARAMETERISED VIEWS 
CREATE FUNCTION fnEmployeeDetails(@Gender nvarchar(20))
RETURNS TABLE 
AS 
return 
(SELECT Id, Name, Gender, DepartmentId
FROM tblEmployee WHERE Gender = @GeFV4nder)

SELECT * FROM dbo.fnEmployeeDetails('Male')