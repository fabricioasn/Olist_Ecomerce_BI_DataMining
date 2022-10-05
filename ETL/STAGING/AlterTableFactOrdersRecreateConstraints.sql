USE [Brazilian_Ecommerce]
GO
ALTER TABLE [dim].[FactOrder] DROP CONSTRAINT [PK__FactOrde__3455A1BAA25FF0C0] WITH ( ONLINE = OFF )
GO



USE [Brazilian_Ecommerce]
GO
ALTER TABLE [dim].[FactOrder] DROP COLUMN [PK_FactOrder]



USE [Brazilian_Ecommerce]
GO
ALTER TABLE  [dim].[FactOrder]
ADD [PK_FactOrder] INT IDENTITY (1,1) PRIMARY KEY CLUSTERED 
GO
