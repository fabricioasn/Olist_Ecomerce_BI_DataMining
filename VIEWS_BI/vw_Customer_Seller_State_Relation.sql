USE [Brazilian_Ecommerce_DW]
GO

CREATE OR ALTER VIEW vwCustomer_Seller_State_Relation

AS

SELECT DC.[customer_id] AS CUSTOMER_ID
      ,DS.[seller_id] AS SELLER_ID
      ,[customer_state]
      ,[seller_state]
  FROM [dim].[DimCustomers] DC
  RIGHT JOIN [dim].[DimOrderItems] Di
  ON [PK_DimOrderItems] = [PK_Customer]
  LEFT JOIN [dim].[DimSellers] DS
  ON [PK_Seller] = [PK_DimOrderItems]
  


