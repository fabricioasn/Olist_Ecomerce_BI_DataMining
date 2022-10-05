USE [Brazilian_Ecommerce_DW]
GO

CREATE OR ALTER VIEW [dbo].[vwFactOrderMeasures]
AS
SELECT [order_status] AS ORDER_STATUS
    ,COUNT([order_status]) AS QTY_OCURRENCE_STATUS
	,MAX([price]) AS MAX_PRICE
	,MAX([payment_value]) AS MAX_PAYMENT
	,MIN([freight_value]) AS MIN_FREIGHT
	,MIN([price]) AS MIN_PRICE
	,MIN([payment_value]) AS MIN_PAYMENT
	,(MIN([price]) + MAX([price])) / 2 AS MEDIAN_PRICE
	,(MIN([freight_value]) + MAX([freight_value])) / 2 AS MEDIAN_FREIGHT
	,(MIN([payment_value]) + MAX([payment_value])) / 2 AS MEDIAN_PAYMENT
	,AVG([freight_value]) AS AVG_FREIGHT
	,AVG([price]) AS AVG_PRICE
	,AVG([payment_value]) AS AVG_PAYMENT
FROM [Brazilian_Ecommerce_DW].[fact].[FactOrder]
GROUP BY [order_status]
GO

