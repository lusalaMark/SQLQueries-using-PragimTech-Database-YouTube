USE [Sample2]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[spGetEmployees]

SELECT	'Return Value' = @return_value

GO
