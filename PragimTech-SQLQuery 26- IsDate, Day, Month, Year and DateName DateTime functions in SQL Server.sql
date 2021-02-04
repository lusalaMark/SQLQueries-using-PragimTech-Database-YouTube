SELECT ISDATE('Mark')
SELECT ISDATE(GETDATE())

CREATE TABLE employeesDateOfbirth(id int, [Name] varchar (20),[Date of birth] varchar(50))
SELECT * from employeesDateOfbirth

INSERT INTO employeesDateOfbirth (id,[Name],[Date of birth]) values (2, 'Presm','1526:02:24 00:00:00:00')

SELECT [Name], [Dateofbirth], DATENAME (WEEKDAY,[Dateofbirth] AS [Day],
MONTH [Date of birth] AS monthNumber, DATENAME(MONTH,[Date of birth]) AS [MonthName], YEAR [Date of birth] AS [YEAR]
FROM employeesDateOfbirth