use Brazilian_Ecommerce_DW
go

create or alter view dbo.vwOrderSellersSoldout 
as

SELECT DISTINCT MAX([price]) AS MAX_PRICE
	,MIN([freight_value]) AS MIN_FREIGHT
	,MIN([price]) AS MIN_PRICE
	,(MIN([price]) + MAX([price])) / 2 AS MEDIAN_PRICE
	,(MIN([freight_value]) + MAX([freight_value])) / 2 AS MEDIAN_FREIGHT
	,AVG([freight_value]) AS AVG_FREIGHT
	,AVG([price]) AS AVG_PRICE
	--,(([price])+([freight_value])) AS PAYMENT
      ,DI.[seller_id]
	  ,DS.[seller_state]
      ,COUNT([product_id]) QTY_SOLD_PRODUCT
  FROM [dim].[DimSellers] DS 
  LEFT JOIN [dim].[DimOrderItems] DI
  ON DI.[seller_id] = DS.[seller_id]
  WHERE DI.[seller_id] = DI.[seller_id]
  GROUP BY DI.[seller_id],DS.[seller_id],DS.[seller_state]--,(([price])+([freight_value]))
  