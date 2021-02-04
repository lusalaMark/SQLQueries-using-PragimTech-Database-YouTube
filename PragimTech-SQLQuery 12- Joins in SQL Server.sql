SELECT * FROM tblEmployee
SELECT * FROM tblDepartment

SELECT Name,Gender Salary, DepartmentId
FROM tblEmployee INNER JOIN tblDepartment
ON tblEmployee.DepartmentId = tblDepartment.DepartId

SELECT Name,Gender Salary, DepartmentId
FROM tblEmployee LEFT OUTER JOIN tblDepartment
ON tblEmployee.DepartmentId = tblDepartment.DepartId

SELECT Name,Gender Salary, DepartmentId
FROM tblEmployee RIGHT OUTER JOIN tblDepartment
ON tblEmployee.DepartmentId = tblDepartment.DepartId

SELECT Name,Gender Salary, DepartmentId
FROM tblEmployee FULL OUTER JOIN tblDepartment
ON tblEmployee.DepartmentId = tblDepartment.DepartId

SELECT Name,Gender Salary, DepartmentId
FROM tblEmployee CROSS JOIN tblDepartment
