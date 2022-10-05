USE [Brazilian_Ecommerce]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dim].[DimOrder](
   [order_id] VARCHAR (100)
  ,[order_status] VARCHAR (20)
  )
  
USE [Brazilian_Ecommerce]
GO
  
ALTER TABLE [dim].[DimOrder] ALTER COLUMN [order_status] VARCHAR (100)

-- Create PK Identity

USE [Brazilian_Ecommerce]; 
GO 

ALTER TABLE  [dim].[DimOrder]
ADD [PK_Order] INT IDENTITY (1,1) PRIMARY KEY CLUSTERED 
GO

ALTER TABLE [Brazilian_Ecommerce].[dim].[DimOrder] ADD customer_id VARCHAR(100)


-- ADD IN DW SELLER_ID AND PRODUCT_ID 

USE [Brazilian_Ecommerce_DW];
GO

ALTER TABLE [Brazilian_Ecommerce_DW].[dim].[DimOrderItems]
ADD seller_id VARCHAR (100)
ALTER TABLE [Brazilian_Ecommerce_DW].[dim].[DimOrderItems]
ADD product_id VARCHAR (100)


-- load columns in DW 

INSERT INTO [Brazilian_Ecommerce_DW].[dim].[DimOrderItems]
( [seller_id]
      ,[product_id]
	  )
	 SELECT [seller_id],[product_id]
  FROM [Brazilian_Ecommerce].[dim].[DimOrderItems]
  ORDER BY PK_DimOrderItems
GO
/*
(112650 rows affected)

Completion time: 2022-09-22T19:52:07.7285337-03:00
*/ 
