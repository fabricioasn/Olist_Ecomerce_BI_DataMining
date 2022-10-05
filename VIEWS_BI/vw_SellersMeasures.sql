USE [Brazilian_Ecommerce_DW]
GO

CREATE OR ALTER VIEW dbo.vwSellersMeasures
AS
SELECT COUNT([seller_id]) AS QTY_SELLERS
      ,[seller_city]
      ,[seller_state]
  FROM [dim].[DimSellers]
  GROUP BY [seller_city]
          ,[seller_state]
		
		
	/*	
	SELECT * FROM [Brazilian_Ecommerce_DW].[dbo].[vwSellersMeasures]
	ORDER BY QTY_SELLERS DESC
	*/
GO

