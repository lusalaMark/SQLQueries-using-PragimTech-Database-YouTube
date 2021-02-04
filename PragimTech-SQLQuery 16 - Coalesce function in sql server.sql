CREATE table tblcoalse(
id int, firstName varchar (50), MiddleName varchar(50), LastName varchar(50)
)

 insert into tblcoalse (id,firstName,MiddleName,LastName) values (1, 'Sam', NULL, NULL)
 insert into tblcoalse (id,firstName,MiddleName,LastName) values (1, NULL, 'Todd', 'Tanzan')
 insert into tblcoalse (id,firstName,MiddleName,LastName) values (1, NULL, NULL, 'Sarah')
 insert into tblcoalse (id,firstName,MiddleName,LastName) values (1, 'Ben', NULL, NULL)
 insert into tblcoalse (id,firstName,MiddleName,LastName) values (1, 'James', 'Nick', 'Nancy')

 select * from tblcoalse 
 SELECT Id, coalesce (firstName,MiddleName, LastName) as Name 
 FROM tblcoalse
