USE [Brazilian_Ecommerce];
GO

ALTER TABLE [Brazilian_Ecommerce].[dim].[DimOrderItems]
ADD seller_id VARCHAR (100)
ALTER TABLE [Brazilian_Ecommerce].[dim].[DimOrderItems]
ADD product_id VARCHAR (100)

ALTER TABLE [dim].[FactOrder] DROP CONSTRAINT [FK_DimOrderItems]
GO

/****** Object:  Index [PK_FactOrders]    Script Date: 22/09/2022 19:25:30 ******/
ALTER TABLE [dim].[FactOrder] DROP CONSTRAINT [PK_FactOrders] WITH ( ONLINE = OFF )
GO

/****** Object:  Index [PK_FactOrders]    Script Date: 22/09/2022 19:25:31 ******/

ALTER TABLE [dim].[DimTime] DROP CONSTRAINT [FK_DimOrderItemsTime]
GO


TRUNCATE TABLE [Brazilian_Ecommerce].[dim].[DimOrderItems]

USE [Brazilian_Ecommerce]
GO

/****** Object:  Index [PK__DimOrder__5EC062528D2A2848]    Script Date: 22/09/2022 19:32:01 ******/
ALTER TABLE [dim].[DimOrderItems] DROP CONSTRAINT [PK__DimOrder__5EC062528D2A2848] WITH ( ONLINE = OFF )
GO

ALTER TABLE [Brazilian_Ecommerce].[dim].[DimOrderItems]
DROP COLUMN [PK_DimOrderItems]

ALTER TABLE [Brazilian_Ecommerce].[dim].[DimOrderItems]
ADD [PK_DimOrderItems] INT identity(1,1)


ALTER TABLE [Brazilian_Ecommerce].[dim].[DimOrderItems] ADD PRIMARY KEY CLUSTERED 
(
	[PK_DimOrderItems] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO

ALTER TABLE [dim].[FactOrder]  WITH CHECK ADD  CONSTRAINT [FK_DimOrderItems] FOREIGN KEY([FK_DimOrderItems])
REFERENCES [dim].[DimOrderItems] ([PK_DimOrderItems])
GO

ALTER TABLE [dim].[FactOrder] CHECK CONSTRAINT [FK_DimOrderItems]
GO

ALTER TABLE [dim].[DimTime]  WITH CHECK ADD  CONSTRAINT [FK_DimOrderItemsTime] FOREIGN KEY([FK_DimOrderItems])
REFERENCES [dim].[DimOrderItems] ([PK_DimOrderItems])
GO

ALTER TABLE [dim].[DimTime] CHECK CONSTRAINT [FK_DimOrderItemsTime]
GO

ALTER TABLE [dim].[FactOrder] ADD  CONSTRAINT [PK_FactOrders] PRIMARY KEY CLUSTERED 
(
	[PK_FactOrder] ASC,
	[FK_Seller] ASC,
	[FK_Product] ASC,
	[FK_Payment] ASC,
	[FK_Order] ASC,
	[FK_DimOrderItems] ASC,
	[FK_Customer] ASC,
	[FK_Time] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,  IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO

ALTER TABLE [Brazilian_Ecommerce_DW].[fact].[FactOrder]  WITH CHECK ADD  CONSTRAINT [FK_DimOrderItems] FOREIGN KEY([FK_DimOrderItems])
REFERENCES [dim].[DimOrderItems] ([PK_DimOrderItems])
GO