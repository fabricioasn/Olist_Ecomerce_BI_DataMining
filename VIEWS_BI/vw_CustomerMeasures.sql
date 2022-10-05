USE [Brazilian_Ecommerce_DW]
GO

/****** Object:  View [dbo].[vwCustomerMeasures]    Script Date: 24/09/2022 05:57:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER   VIEW [dbo].[vwCustomerMeasures]
AS
SELECT [customer_city]
	,[customer_state]
	,count([customer_unique_id]) AS QTY_CUSTOMERS
	,RANK() OVER (
		PARTITION BY [customer_state] ORDER BY count([customer_unique_id]) ASC
		) AS RANK_CUSTOMER_STATE
	,RANK() OVER (
		ORDER BY count([customer_unique_id]) ASC
		) AS RANK_QTY_CUSTOMERS
	,ROW_NUMBER() OVER (
		ORDER BY count([customer_unique_id]) ASC
		) QTY_CUSTOMERS_ROWNUMBER
	,DENSE_RANK() OVER (
	    PARTITION BY [customer_state] ORDER BY count([customer_unique_id]) ASC
		) AS DENSE_RANK_QTY_CUSTOMER_STATE
	,DENSE_RANK() OVER (
	    ORDER BY count([customer_unique_id]) ASC
		) AS DENSE_RANK_QTY_CUSTOMER
FROM [Brazilian_Ecommerce_DW].[dim].[DimCustomers]
GROUP BY [customer_city]
	,[customer_state]

--SELECT * FROM [Brazilian_Ecommerce_DW].[dbo].[vwCustomerMeasures]
--ORDER BY QTY_CUSTOMERS ASC
--	,QTY_CUSTOMERS_ROWNUMBER ASC
--	,RANK_QTY_CUSTOMERS ASC
--	,RANK_CUSTOMER_STATE ASC
--	,DENSE_RANK_QTY_CUSTOMER_STATE ASC
GO


