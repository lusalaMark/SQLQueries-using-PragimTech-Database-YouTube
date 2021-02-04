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
				BEGIN TRY
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
						END TRY 
						BEGIN CATCH 
						 rollback transaction
						 SELECT 
						 ERROR_NUMBER() AS ErrorNumber,
						 ERROR_MESSAGE() AS ErrorMessage,
						 ERROR_PROCEDURE() AS ErrorProcedure,
						 ERROR_STATE() AS ErrorState,
						 ERROR_SEVERITY () AS ErrorSeverity
						 END CATCH
						 END
					END 

select * from tblproduct
select * from tblproductSales
EXECUTE spSellProduct 1,10