--LEFT, RIGHT, CHARINDEX and SUBSTRING functions

select * from Employees

alter table Employees add Email, varchar (20);

SELECT RIGHT ('ABCDE', 4)

SELECT LEFT ('ABCDE', 4)


SELECT CHARINDEX('@','DVCWXFZE@FGDFDS.COM')

SELECT SUBSTRING ('pam@bbb.com', CHARINDEX('@', 'pam@bbb.com')+1, 7 )