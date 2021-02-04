SELECT * FROM Employees
SELECT * FROM tblDepartment

SELECT Name, Gender, Salary,Department
FROM Employees
LEFT JOIN tblDepartment
on Employees.DepartmentId = tblDepartment.id
WHERE Employees.DepartmentId = 1

SELECT Name, Gender, Salary,Department
FROM Employees
RIGHT JOIN tblDepartment
on Employees.DepartmentId = tblDepartment.id
WHERE Employees.DepartmentId IS NULL

SELECT Name, Gender, Salary,Department
FROM Employees
RIGHT JOIN tblDepartment
on Employees.DepartmentId = tblDepartment.id
WHERE Employees.DepartmentId IS NULL
OR tblDepartment.id IS NULL 

SELECT Name, Gender, Salary,Department
FROM Employees
FULL JOIN tblDepartment
on Employees.DepartmentId = tblDepartment.id
WHERE Employees.DepartmentId IS NULL
OR tblDepartment.id IS NULL 