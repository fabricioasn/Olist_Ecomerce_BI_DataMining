USE [Brazilian_Ecommerce]; 
GO 

ALTER TABLE [dim].[DimSellers] DROP CONSTRAINT [PK__DimSelle__F67AFD130B720047]
GO

USE [Brazilian_Ecommerce]; 
GO 

ALTER TABLE [dim].[DimSellers] DROP COLUMN [PK_Seller]
GO


/*
USE [Brazilian_Ecommerce]; 
GO 

ALTER TABLE  [dim].[DimSellers]
ADD [PK_Seller] INT IDENTITY (1,1) PRIMARY KEY CLUSTERED 
GO
*/