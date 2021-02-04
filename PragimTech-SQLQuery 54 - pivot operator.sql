CREATE TABLE tblSalesAgentWithTheirSalesAmount(Sales_Agent nvarchar(20),Sales_Country nvarchar(20),Sales_Amount int)

insert into tblSalesAgentWithTheirSalesAmount values ('Tom', 'UK', 180)
insert into tblSalesAgentWithTheirSalesAmount values ('John', 'US', 260)
insert into tblSalesAgentWithTheirSalesAmount values ('John', 'UK', 270)
insert into tblSalesAgentWithTheirSalesAmount values ('David', 'India', 300)
insert into tblSalesAgentWithTheirSalesAmount values ('Tom', 'India', 400)
insert into tblSalesAgentWithTheirSalesAmount values ('John', 'US', 245)
insert into tblSalesAgentWithTheirSalesAmount values ('David', 'US', 260)
insert into tblSalesAgentWithTheirSalesAmount values ('Tom', 'India', 207)
insert into tblSalesAgentWithTheirSalesAmount values ('David', 'UK', 204)
insert into tblSalesAgentWithTheirSalesAmount values ('John', 'UK', 540)
insert into tblSalesAgentWithTheirSalesAmount values ('John', 'UK', 200)
insert into tblSalesAgentWithTheirSalesAmount values ('David', 'US',670)
insert into tblSalesAgentWithTheirSalesAmount values ('Tom', 'US', 870)
insert into tblSalesAgentWithTheirSalesAmount values ('John', 'UK', 700)
insert into tblSalesAgentWithTheirSalesAmount values ('David', 'India', 890)
insert into tblSalesAgentWithTheirSalesAmount values ('David', 'India', 250)
insert into tblSalesAgentWithTheirSalesAmount values ('David', 'India', 230)
insert into tblSalesAgentWithTheirSalesAmount values ('Tom', 'UK', 226)
insert into tblSalesAgentWithTheirSalesAmount values ('John', 'US', 290)
insert into tblSalesAgentWithTheirSalesAmount values ('David', 'UK', 205)

select * from tblSalesAgentWithTheirSalesAmount

SELECT Sales_Country, Sales_Agent,
SUM (Sales_Amount) AS Total 
from tblSalesAgentWithTheirSalesAmount
group by Sales_Country,Sales_Agent
order by Sales_Country,Sales_Agent

SELECT Sales_Agent, India, UK, US FROM tblSalesAgentWithTheirSalesAmount
PIVOT(
SUM(Sales_Amount)FOR Sales_Country IN (India,  US, UK)) AS PivotTable

CREATE TABLE tblProductSalesAmount(id int, Sales_Agent nvarchar(20),Sales_Country nvarchar(20),Sales_Amount int)

insert into tblProductSalesAmount values (1,'Tom', 'UK', 180)
insert into tblProductSalesAmount values (2, 'John', 'US', 260)
insert into tblProductSalesAmount values (3, 'John', 'UK', 270)
insert into tblProductSalesAmount values (4, 'David', 'India', 300)
insert into tblProductSalesAmount values (5, 'Tom', 'India', 400)
insert into tblProductSalesAmount values (6, 'John', 'US', 245)
insert into tblProductSalesAmount values (7, 'David', 'US', 260)
insert into tblProductSalesAmount values (8, 'Tom', 'India', 207)
insert into tblProductSalesAmount values (9, 'David', 'UK', 204)
insert into tblProductSalesAmount values (10, 'John', 'UK', 540)
insert into tblProductSalesAmount values (11, 'John', 'UK', 200)
insert into tblProductSalesAmount values (12, 'David', 'US',670)
insert into tblProductSalesAmount values (13, 'Tom', 'US', 870)
insert into tblProductSalesAmount values (14, 'John', 'UK', 700)
insert into tblProductSalesAmount values (15, 'David', 'India', 890)
insert into tblProductSalesAmount values (16, 'David', 'India', 250)
insert into tblProductSalesAmount values (17, 'David', 'India', 230)
insert into tblProductSalesAmount values (18, 'Tom', 'UK', 226)
insert into tblProductSalesAmount values (19, 'John', 'US', 290)
insert into tblProductSalesAmount values (20, 'David', 'UK', 205)

select * from tblProductSalesAmount

SELECT Sales_Agent, India, US, UK FROM tblProductSalesAmount
pivot(
	SUM(Sales_Amount) FOR Sales_Country IN (India, US, UK)
)
AS 
PivotTable

SELECT Sales_Agent, India, US, UK 
FROM (
	SELECT Sales_Agent, Sales_Country, Sales_Amount 
	FROM tblProductSalesAmount
) AS SourceTable
pivot(
	SUM(Sales_Amount) FOR Sales_Country IN (India, US, UK)
)
AS 
PivotTable