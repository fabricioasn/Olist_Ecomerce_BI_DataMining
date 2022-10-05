USE [Brazilian_Ecommerce_DW]
GO

USE [Brazilian_Ecommerce_DW]
GO

ALTER TABLE [fact].[FactOrder] DROP CONSTRAINT [FK_Location]
GO


ALTER TABLE [fact].[FactOrder] DROP COLUMN [FK_Location]
GO

ALTER TABLE [fact].[FactOrder] ADD [FK_Location] INT 
GO

ALTER TABLE [fact].[FactOrder]  WITH CHECK ADD  CONSTRAINT [FK_Location] FOREIGN KEY([FK_Location])
REFERENCES [dim].[DimLocation] ([PK_Location])
GO

ALTER TABLE [fact].[FactOrder] CHECK CONSTRAINT [FK_Location]
GO

ALTER TABLE [Brazilian_Ecommerce_DW].[dim].[DimTime] DROP COLUMN [FK_DimOrderItems]


/****** Object:  Index [PK_FactOrders]    Script Date: 22/09/2022 11:06:44 ******/
ALTER TABLE [fact].[FactOrder] DROP CONSTRAINT [PK_FactOrders] WITH ( ONLINE = OFF )
GO

/****** Object:  Index [PK_FactOrders]    Script Date: 22/09/2022 11:06:45 ******/
ALTER TABLE [fact].[FactOrder] ADD  CONSTRAINT [PK_FactOrders] PRIMARY KEY CLUSTERED 
(
	[PK_FactOrder] ASC,
	[FK_Seller] ASC,
	[FK_Product] ASC,
	[FK_Payment] ASC,
	[FK_Order] ASC,
	[FK_DimOrderItems] ASC,
	[FK_Customer] ASC,
	[FK_Time] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO


