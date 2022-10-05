USE [Brazilian_Ecommerce]; 
GO 

ALTER TABLE [dim].[DimTime] DROP CONSTRAINT [PK__DimTime__0488EB06FBE6B9F9]
GO

USE [Brazilian_Ecommerce]; 
GO 

ALTER TABLE [dim].[DimTime] DROP COLUMN [PK_DimTime] 
GO

USE [Brazilian_Ecommerce]; 
GO 

ALTER TABLE  [dim].[DimTime]
ADD [PK_DimTime]  INT IDENTITY (1,1) PRIMARY KEY CLUSTERED 
GO
