USE [Brazilian_Ecommerce_DW]
GO

CREATE OR ALTER VIEW [dbo].[vwCustomer_Seller_State_Relation]

AS

SELECT [customer_state]
      ,[seller_state]
	  ,[customer_city]
	  ,[seller_city]
	  ,DENSE_RANK() OVER (
	    PARTITION BY [customer_state] , [customer_state] ORDER BY [PK_DimOrderItems]
		) AS DENSE_RANK_CUSTOMER_SELLER_STATE
  FROM [dim].[DimCustomers] DC
  RIGHT JOIN [dim].[DimOrderItems] Di
  ON [PK_DimOrderItems] = [PK_Customer]
  LEFT JOIN [dim].[DimSellers] DS
  ON [PK_Seller] = [PK_DimOrderItems]
  WHERE seller_state IS NOT NULL




GO


