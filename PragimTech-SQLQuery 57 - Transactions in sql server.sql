SELECT * FROM Production.Product
set transaction isolation level read uncommitted
Begin Transaction 
update Production.Product set ReorderPoint = 400 where ProductID = 6