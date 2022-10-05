USE [Brazilian_Ecommerce]; 
GO 

ALTER TABLE [dim].[DimProducts] DROP CONSTRAINT [PK__DimProdu__E5E6F73BB88206D7]
GO

USE [Brazilian_Ecommerce]; 
GO 

ALTER TABLE [dim].[DimProducts] DROP COLUMN [PK_Product]
GO

USE [Brazilian_Ecommerce]; 
GO 
ALTER TABLE [dim].[DimProducts]
ALTER COLUMN [product_weight_g] DECIMAL (6,1)

/*
USE [Brazilian_Ecommerce]; 
GO 

ALTER TABLE  [dim].[DimProducts]
ADD [PK_Seller] INT IDENTITY (1,1) PRIMARY KEY CLUSTERED 
GO
*/

