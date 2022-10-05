USE [Brazilian_Ecommerce_DW];
GO


/****** Create ALL Tables Brazilian_Ecommerce_DW Database******/


CREATE TABLE [dim].[DimCustomers](
	[customer_id] [varchar](100) NOT NULL,
	[customer_zip_code_prefix] [varchar](60) NULL,
	[customer_city] [varchar](100) NULL,
	[customer_state] [varchar](100) NULL,
	[customer_unique_id] [varchar](100) NOT NULL,
	[PK_Customer] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_Customer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dim].[DimLocation]    Script Date: 22/09/2022 01:07:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dim].[DimLocation](
	[geolocation_state] [varchar](100) NULL,
	[UF_Code] TINYINT NULL,
	[PK_Location] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_Location] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dim].[DimOrder]    Script Date: 22/09/2022 01:07:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dim].[DimOrder](
	[order_id] [varchar](100) NULL,
	[order_status] [varchar](100) NULL,
	[PK_Order] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_Order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dim].[DimOrderItems]    Script Date: 22/09/2022 01:07:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dim].[DimOrderItems](
	[order_item_id] [varchar](100) NULL,
	[freight_value] [decimal](10, 2) NULL,
	[price] [decimal](10, 2) NULL,
	[shipping_limit_date] [datetime] NULL,
	[PK_DimOrderItems] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_DimOrderItems] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dim].[DimPayments]    Script Date: 22/09/2022 01:07:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dim].[DimPayments](
	[payment_sequential] [tinyint] NULL,
	[payment_type] [varchar](50) NULL,
	[payment_installments] [smallint] NULL,
	[payment_value] [decimal](12, 2) NULL,
	[PK_Payment] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_Payment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dim].[DimProducts]    Script Date: 22/09/2022 01:07:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dim].[DimProducts](
	[product_id] [varchar](100) NULL,
	[product_weight_g] [decimal](6, 1) NULL,
	[product_length_cm] [smallint] NULL,
	[product_height_cm] [smallint] NULL,
	[product_width_cm] [smallint] NULL,
	[product_category_name] [varchar](100) NULL,
	[PK_Product] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_Product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dim].[DimSellers]    Script Date: 22/09/2022 01:07:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dim].[DimSellers](
	[seller_id] [varchar](100) NULL,
	[seller_zip_code_prefix] [varchar](10) NOT NULL,
	[seller_city] [varchar](100) NULL,
	[seller_state] [varchar](100) NULL,
	[PK_Seller] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_Seller] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dim].[DimTime]    Script Date: 22/09/2022 01:07:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dim].[DimTime](
	[shipping_limit_date] [datetime] NULL,
	[order_purchase_timestamp] [datetime] NULL,
	[order_approved_at] [datetime] NULL,
	[order_delivered_carrier_date] [datetime] NULL,
	[order_delivered_customer_date] [datetime] NULL,
	[order_estimated_delivery_date] [datetime] NULL,
	[PK_Time] [int] IDENTITY(1,1) NOT NULL,
	[FK_DimOrderItems] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_Time] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [fact].[FactOrder]    Script Date: 22/09/2022 01:07:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [fact].[FactOrder](
	[order_id] [varchar](100) NULL,
	[time_id] [varchar](100) NULL,
	[order_item_id] [varchar](100) NULL,
	[product_id] [varchar](100) NULL,
	[seller_id] [varchar](100) NULL,
	[customer_id] [varchar](100) NULL,
	[payment_id] [varchar](100) NULL,
	[order_status] [varchar](20) NULL,
	[price] [decimal](10, 2) NULL,
	[freight_value] [decimal](10, 2) NULL,
	[payment_value] [decimal](10, 2) NULL,
	[FK_Payment] [int] NOT NULL,
	[FK_Order] [int] NOT NULL,
	[FK_Customer] [int] NOT NULL,
	[FK_Product] [int] NOT NULL,
	[FK_Seller] [int] NOT NULL,
	[PK_FactOrder] [int] IDENTITY(1,1) NOT NULL,
	[FK_DimOrderItems] [int] NOT NULL,
	[FK_Time] [int] NOT NULL,
	[FK_Location] [int] NOT NULL
 CONSTRAINT [PK_FactOrders] PRIMARY KEY CLUSTERED 
(
	[PK_FactOrder] ASC,
	[FK_Seller] ASC,
	[FK_Product] ASC,
	[FK_Payment] ASC,
	[FK_Order] ASC,
	[FK_DimOrderItems] ASC,
	[FK_Customer] ASC,
	[FK_Time] ASC,
	[FK_Location] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [Brazilian_Ecommerce_DW].[dim].[DimOrderItems]
ADD seller_id VARCHAR (100)
ALTER TABLE [Brazilian_Ecommerce_DW].[dim].[DimOrderItems]
ADD product_id VARCHAR (100)

ALTER TABLE [dim].[DimTime] ADD  CONSTRAINT [Default_order_purchase_timestamp]  DEFAULT ('2017-01-01 00:00:00.000') FOR [order_purchase_timestamp]
GO

ALTER TABLE [dim].[DimTime] ADD  CONSTRAINT [Default_order_approved_at]  DEFAULT ('2017-01-01 00:00:00.000') FOR [order_approved_at]
GO

ALTER TABLE [dim].[DimTime] ADD  CONSTRAINT [Default_order_delivered_carrier_date]  DEFAULT ('2017-01-01 00:00:00.000') FOR [order_delivered_carrier_date]
GO

ALTER TABLE [dim].[DimTime] ADD  CONSTRAINT [Default_order_delivered_customer_date]  DEFAULT ('2017-01-01 00:00:00.000') FOR [order_delivered_customer_date]
GO

ALTER TABLE [dim].[DimTime] ADD  CONSTRAINT [Default_order_estimated_delivery_date]  DEFAULT ('2017-01-01 00:00:00.000') FOR [order_estimated_delivery_date]
GO

ALTER TABLE [dim].[DimTime]  WITH CHECK ADD  CONSTRAINT [FK_DimOrderItemsTime] FOREIGN KEY([FK_DimOrderItems])
REFERENCES [dim].[DimOrderItems] ([PK_DimOrderItems])
GO

ALTER TABLE [dim].[DimTime] CHECK CONSTRAINT [FK_DimOrderItemsTime]
GO

ALTER TABLE [fact].[FactOrder]  WITH CHECK ADD  CONSTRAINT [FK_Customer] FOREIGN KEY([FK_Customer])
REFERENCES [dim].[DimCustomers] ([PK_Customer])
GO

ALTER TABLE [fact].[FactOrder] CHECK CONSTRAINT [FK_Customer]
GO

ALTER TABLE [fact].[FactOrder]  WITH CHECK ADD  CONSTRAINT [FK_DimOrderItems] FOREIGN KEY([FK_DimOrderItems])
REFERENCES [dim].[DimOrderItems] ([PK_DimOrderItems])
GO

ALTER TABLE [fact].[FactOrder] CHECK CONSTRAINT [FK_DimOrderItems]
GO

ALTER TABLE [fact].[FactOrder]  WITH CHECK ADD  CONSTRAINT [FK_Order] FOREIGN KEY([FK_Order])
REFERENCES [dim].[DimOrder] ([PK_Order])
GO

ALTER TABLE [fact].[FactOrder] CHECK CONSTRAINT [FK_Order]
GO

ALTER TABLE [fact].[FactOrder]  WITH CHECK ADD  CONSTRAINT [FK_Payment] FOREIGN KEY([FK_Payment])
REFERENCES [dim].[DimPayments] ([PK_Payment])
GO

ALTER TABLE [fact].[FactOrder] CHECK CONSTRAINT [FK_Payment]
GO

ALTER TABLE [fact].[FactOrder]  WITH CHECK ADD  CONSTRAINT [FK_Product] FOREIGN KEY([FK_Product])
REFERENCES [dim].[DimProducts] ([PK_Product])
GO

ALTER TABLE [fact].[FactOrder] CHECK CONSTRAINT [FK_Product]
GO

ALTER TABLE [fact].[FactOrder]  WITH CHECK ADD  CONSTRAINT [FK_Seller] FOREIGN KEY([FK_Seller])
REFERENCES [dim].[DimSellers] ([PK_Seller])
GO

ALTER TABLE [fact].[FactOrder] CHECK CONSTRAINT [FK_Seller]
GO

ALTER TABLE [fact].[FactOrder]  WITH CHECK ADD  CONSTRAINT [FK_Time] FOREIGN KEY([FK_Time])
REFERENCES [dim].[DimTime] ([PK_Time])
GO

ALTER TABLE [fact].[FactOrder] CHECK CONSTRAINT [FK_Time]
GO

ALTER TABLE [dim].[Location]  WITH CHECK ADD  CONSTRAINT [FK_Location] FOREIGN KEY([FK_Location])
REFERENCES [dim].[DimLocation] ([PK_Location])
GO

ALTER TABLE [fact].[FactOrder] CHECK CONSTRAINT [FK_Location]
GO


ALTER TABLE [fact].[FactOrder] CHECK CONSTRAINT [FK_Location]
GO