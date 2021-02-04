SELECT FLOOR (RAND ()*100)

DECLARE @Counter int 
set @Counter = 1; 
while (@Counter <= 10)
BEGIN 
 PRINT FLOOR (RAND()*10000)
 SET @Counter +=1;
END