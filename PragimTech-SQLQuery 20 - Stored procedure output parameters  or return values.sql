-- output for procedures
alter proc spGetTotalCount1
as
begin 
declare @totalCount int  
set @totalCount = (select COUNT (Id)  FROM Employees)
select @totalCount 
end

declare @total int
execute spGetTotalCount1 @Total out
print @Total 

alter proc spGetTotalCount2
as
begin 
declare @total int
  return (select COUNT (Id)  FROM Employees)
end
--declare @total int
execute spGetTotalCount1 @Total out
print @Total 

create proc spGetNameById1
@Id int,
@Name nvarchar(30) out 
as
begin 
 select @Name = Name from Employees where @Id = Id
end
declare @Name nvarchar(30)
execute spGetNameById1 1, @Name out
print 'Name = ' + @Name

alter proc spGetNameById2
@Id int
as
begin 
 return (select Name from Employees where @Id = Id)
end
declare @Name nvarchar(30)
execute @Name = spGetNameById2 1
print 'Name = ' + @Name

