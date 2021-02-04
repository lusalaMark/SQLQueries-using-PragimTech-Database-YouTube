create table productsDetails(ProductId int NOT NULL, Name nvarchar(50) NOT NULL, UnitPrice int NOT NULL)\

SELECT * FROM productsDetails

INSERT INTO productsDetails VALUES (1, 'Books', 20)
INSERT INTO productsDetails VALUES (2, 'Pens', 14)
INSERT INTO productsDetails VALUES (3, 'Pencils', 11)
INSERT INTO productsDetails VALUES (4, 'Clips', 10)

CREATE TABLE productSales (productId int NOT NULL,QuantitySold int NOT NULL )

SELECT * FROM productSales 

INSERT INTO  productSales VALUES (1, 10)
INSERT INTO  productSales VALUES (3, 23)
INSERT INTO  productSales VALUES (4, 21)
INSERT INTO  productSales VALUES (2, 12)
INSERT INTO  productSales VALUES (1, 13)
INSERT INTO  productSales VALUES (3, 12)
INSERT INTO  productSales VALUES (4, 13)
INSERT INTO  productSales VALUES (1, 11)
INSERT INTO  productSales VALUES (2, 12)
INSERT INTO  productSales VALUES (1, 14)

