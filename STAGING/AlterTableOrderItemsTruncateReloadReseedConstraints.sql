USE [Brazilian_Ecommerce]
GO

ALTER TABLE [dim].[DimTime] DROP CONSTRAINT [FK_DimOrderItemsTime]
GO

ALTER TABLE [dim].[DimTime] DROP COLUMN [FK_DimOrderItems]

ALTER TABLE [dim].[FactOrder] DROP CONSTRAINT [FK_DimOrderItems]
GO

ALTER TABLE [dim].[DimTime] ADD [FK_DimOrderItems] INT

ALTER TABLE [dim].[FactOrder]  WITH CHECK ADD  CONSTRAINT [FK_DimOrderItems] FOREIGN KEY([FK_DimOrderItems])
REFERENCES [dim].[DimOrderItems] ([PK_DimOrderItems])
GO

ALTER TABLE [dim].[FactOrder] CHECK CONSTRAINT [FK_DimOrderItems]
GO

  TRUNCATE TABLE [dim].[DimOrderItems]

ALTER TABLE [dim].[DimTime]  WITH CHECK ADD  CONSTRAINT [FK_DimOrderItemsTime] FOREIGN KEY([FK_DimOrderItems])
REFERENCES [dim].[DimOrderItems] ([PK_DimOrderItems])
GO

ALTER TABLE [dim].[DimTime] CHECK CONSTRAINT [FK_DimOrderItemsTime]
GO


UPDATE [DIM].[DimTime]
SET FK_DimOrderItems = PK_Time
WHERE FK_DimOrderItems IS NULL