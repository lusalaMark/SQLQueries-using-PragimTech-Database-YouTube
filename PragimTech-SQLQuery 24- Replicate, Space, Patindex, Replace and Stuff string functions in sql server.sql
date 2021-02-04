select * from Employees


update Employees 
set Email = 'uttuita@gmail.com' 
where id = 11;
ALTER TABLE Employees

ADD Email varchar(30)

--REPLICATE FUNCTION 
SELECT REPLICATE ('Lusala', 3)

SELECT Name, SUBSTRING(Email, 1,2) + REPLICATE ('*',5) + SUBSTRING(Email, CHARINDEX('@',Email), LEN(Email) - CHARINDEX
('@', Email)+1) as Emails
from Employees


-- PATINDEX FUNCTION 
SELECT Email, PATINDEX ('%@gmail.com', Email) as FirstOccurance
FROM Employees
WHERE PATINDEX ('@gmail.com', Email) > 0

--REPLACE FUNCTION 
SELECT Email,REPLACE (Email, '.com', '.net') as NETMAILS 
FROM Employees