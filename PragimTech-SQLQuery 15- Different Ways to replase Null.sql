select * from tblemployesRecord

SELECT ISNULL(NULL, 'Director of the company') as Manager
SELECT COALESCE(NULL, 'Director of the company') as Manager

--SELECT E.Name AS Employee, ISNULL(M.name, 'Director of the company') as Manager 
--SELECT E.Name AS Employee, COALESCE(M.name, 'Director of the company') as Manager 
SELECT E.Name AS Employee, CASE WHEN M.NAME IS NULL THEN  'Director of the company' ELSE M.NAME END  as Manager 

FROM tblemployesRecord E
LEFT JOIN tblemployesRecord M 
ON E.[Manager ID] = M.[Employee ID]

