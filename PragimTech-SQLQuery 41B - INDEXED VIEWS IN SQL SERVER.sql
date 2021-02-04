CREATE VIEW vWTotalSalesByProduct
WITH SCHEMABINDING 
AS
SELECT Name,
SUM(ISNULL ((QuantitySold * UnitPrice), 0 )) as TotalSales,
COUNT_BIG(*) AS TotalTransactions
FROM dbo.productSales 
JOIN dbo.productsDetails
ON dbo.productsDetails.ProductId = dbo.productSales.ProductId
GROUP BY Name

SELECT * FROM vWTotalSalesByProduct

CREATE UNIQUE CLUSTERED INDEX UIX_vWTotalSalesByProduct_Name
ON vWTotalSalesByProduct(Name)