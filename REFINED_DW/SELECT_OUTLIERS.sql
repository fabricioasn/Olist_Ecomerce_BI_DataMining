USE [Brazilian_Ecommerce_DW]
GO

SELECT [seller_id]
      ,[seller_city]
      ,[seller_state]
  FROM [dim].[DimSellers]
  WHERE  seller_city LIKE '"%'
  OR seller_state LIKE '%,%'
  OR (seller_city LIKE '%"%'
  OR seller_city LIKE '%ƒ%'
  OR seller_city LIKE '%/%'
  OR seller_city LIKE '%\%'
  OR seller_city LIKE '%Â%'
  OR seller_city LIKE '%-%'
  OR seller_city LIKE '%@%')
GO


