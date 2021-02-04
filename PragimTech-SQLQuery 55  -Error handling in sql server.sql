create table tblproduct(
	ProductId int PRIMARY KEY, 
	Nmae nvarchar(50),
	UnitPrice int,
	QtyAvailable int
	)

insert into tblproduct values (
	1,'Laptops', 2340, 90
)
insert into tblproduct values (
	2,'Desktops', 1340, 40
)



create table tblproductSales(
ProductSalesSold int PRIMARY KEY, ProductId int, QuantitySold int
)


alter PROCEDURE spSellProduct
	@ProductId int,
	@quantityToSell int
	AS
	BEGIN 
		-- CHECK THE STOCK AVAILABLE, FOR PRODUCT WE WANT TO SELL 
		DECLARE @StockAvailable int
		SELECT @StockAvailable = QtyAvailable
		FROM tblproduct WHERE ProductId = @ProductId
		-- THROW AN ERROR TO THE CALLING APPLICATION IF ENOUGH STOCK 
		--IS NOT AVAILABLE 
		if (@StockAvailable < @quantityToSell)
		BEGIN 
			Raiserror('Not enough stock available', 16 , 1)
		END
		-- IF ENOUGH STOCK AVAILABLE 
		ELSE 
			BEGIN 
				BEGIN TRAN
					-- FIRST REDUCE THE QUANTITY 
					UPDATE tblproduct SET QtyAvailable = (QtyAvailable - @quantityToSell)
						WHERE ProductId = @ProductId

						DECLARE @MaxProducedSalesId int
					-- CALCULATE MAXIMUM PRODUCT SOLD 
					SELECT @MaxProducedSalesId = CASE WHEN
													MAX (ProductSalesSold) IS NULL 
													THEN  0 ELSE MAX (ProductSalesSold)
													END
													FROM tblproductSales
						-- Increment @maxproductSold by 1, so that we dont get a primary key violation 
						set @MaxProducedSalesId = @MaxProducedSalesId + 1
						insert into tblproductSales values (@MaxProducedSalesId, @ProductId, @quantityToSell)
						if (@@ERROR <> 0)
						BEGIN 
						 rollback transaction
						 PRINT('Transaction rolled back!! ')
						 end
						else 
						BEGIN
							COMMIT TRAN
							PRINT('Transaction commited!!')
						END
						END
					END 


select * from tblproduct
select * from tblproductSales
EXECUTE spSellProduct 1,1
EXECUTE spSellProduct 2,2