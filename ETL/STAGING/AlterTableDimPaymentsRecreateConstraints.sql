USE [Brazilian_Ecommerce]; 
GO 

ALTER TABLE  [dim].[DimPayments]
ALTER COLUMN [payment_value] decimal (12,2);


USE [Brazilian_Ecommerce]; 
GO 

ALTER TABLE [dim].[DimPayments] DROP CONSTRAINT [PK__DimPayme__4A25B8D429B2C8FD]
GO

USE [Brazilian_Ecommerce]; 
GO 

ALTER TABLE [dim].[DimPayments] DROP COLUMN [PK_Payment]
GO

USE [Brazilian_Ecommerce]; 
GO 

ALTER TABLE  [dim].[DimPayments]
ADD [PK_Payment] INT IDENTITY (1,1) PRIMARY KEY CLUSTERED 
GO
