USE [Brazilian_Ecommerce]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dim].[DimTime](
   [PK_DimTime] INT
  ,[shipping_limit_date] DATETIME
  ,[order_purchase_timestamp] DATETIME
  ,[order_approved_at] DATETIME
  ,[order_delivered_carrier_date] DATETIME
  ,[order_delivered_customer_date] DATETIME
  ,[order_estimated_delivery_date] DATETIME
   

PRIMARY KEY CLUSTERED 
(
	[PK_DimTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = on) ON [PRIMARY]
) ON [PRIMARY]
GO

/* Commands completed successfully.

Completion time: 2022-09-13T02:08:24.1514023-03:00
*/

-- Carga do campo shipping_limit_date na DIM_Time

USE [Brazilian_Ecommerce];
GO

INSERT INTO [dim].[DimTime] ([shipping_limit_date])
SELECT [shipping_limit_date] FROM [dim].[DimOrderItems]


/*
(112650 rows affected)

Completion time: 2022-09-21T02:27:07.5576782-03:00
*/

USE [Brazilian_Ecommerce];
GO

DELETE FROM [dim].[DimTime]
WHERE [shipping_limit_date] IS NOT NULL
AND [order_purchase_timestamp] = '2017-01-01 00:00:00.000'
AND [order_approved_at] = '2017-01-01 00:00:00.000'
AND [order_delivered_carrier_date] = '2017-01-01 00:00:00.000'
AND [order_estimated_delivery_date] = '2017-01-01 00:00:00.000'

/*

(225300 rows affected)

Completion time: 2022-09-21T02:32:11.1980809-03:00

*/


USE [Brazilian_Ecommerce]; 
GO 

ALTER TABLE  [dim].[DimTime]
ADD [PK_Time] INT IDENTITY (1,1) PRIMARY KEY CLUSTERED 
GO


SELECT OI.[shipping_limit_date] AS [shipping_limit_date]  FROM [dim].[DimOrderItems] OI
JOIN [dim].[DimTime] DT
ON OI.[shipping_limit_date]  = DT.[shipping_limit_date] 