SELECT *FROM Employee

SELECT E.Name as Employee, M.Name as Manager 
FROM Employee E
LEFT JOIN Employee M
ON E.[Manager Id] = M.[Employee Id]

SELECT E.Name as Employee, M.Name as Manager 
FROM Employee E
LEFT JOIN Employee M
ON E.[Manager Id] = M.[Employee Id]

SELECT E.Name as Employee, M.Name as Manager 
FROM Employee E
INNER JOIN Employee M
ON E.[Manager Id] = M.[Employee Id]
