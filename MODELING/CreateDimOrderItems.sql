USE [Brazilian_Ecommerce]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dim].[DimOrderItems](
   [order_item_id] VARCHAR (100)
  ,[freight_value] DECIMAL (10,2)
  ,[price] DECIMAL (10,2)
  ,[shipping_limit_date] DATETIME
  )
  
  
-- Create PK 

USE [Brazilian_Ecommerce]; 
GO 

ALTER TABLE  [dim].[DimOrderItems]
ADD [PK_DimOrderItems] INT IDENTITY (1,1) PRIMARY KEY CLUSTERED 
GO