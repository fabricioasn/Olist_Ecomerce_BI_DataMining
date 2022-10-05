USE [Brazilian_Ecommerce]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dim].[FactOrder](
   [PK_FactOrder] INT
  ,[order_id] VARCHAR (100)
  ,[time_id] VARCHAR (100)
  ,[order_item_id] VARCHAR (100)
  ,[product_id] VARCHAR (100)
  ,[seller_id] VARCHAR (100)
  ,[customer_id] VARCHAR (100)
  ,[payment_id] VARCHAR (100)
  ,[order_status] VARCHAR (20)
  ,[price] DECIMAL (4,2)
  ,[freight_value] DECIMAL (4,2)
  ,[payment_value] DECIMAL (4,2)
  

PRIMARY KEY CLUSTERED 
(
	[PK_FactOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = on) ON [PRIMARY]
) ON [PRIMARY]
GO


USE [Brazilian_Ecommerce]
GO
  
ALTER TABLE [dim].[FactOrder] ALTER COLUMN [price] DECIMAL(10,2)
ALTER TABLE [dim].[FactOrder] ALTER COLUMN [freight_value] DECIMAL(10,2)
ALTER TABLE [dim].[FactOrder] ALTER COLUMN [payment_value] DECIMAL(10,2)


/*

Commands completed successfully.

Completion time: 2022-09-13T01:39:55.0190437-03:00


***** Order Payment Columns *****

  ,[payment_sequential] TINYINT
  ,[payment_type] VARCHAR (50)
  ,[payment_installments] SMALLINT
  ,[payment_value] DECIMAL (4,2)
  ,[shipping_limit_date] DATETIME
[order_id],[order_item_id],[product_id],[seller_id],[shipping_limit_date],[price],[freight_value]
[payment_sequential],[payment_type],[payment_installments],[payment_value]
[customer_id],[order_status],[order_purchase_timestamp],[order_approved_at],[order_delivered_carrier_date],[order_delivered_customer_date],[order_estimated_delivery_date]
*/

-- Carga da Fato 

USE [Brazilian_Ecommerce];
GO

INSERT INTO [dim].[FactOrder] (
      ,[order_status]
      ,[price]
      ,[freight_value]
      ,[payment_value])
	 
SELECT [order_status] FROM [dim].[DimOrder]
SELECT [price] FROM [dim].[DimOrderItems]
SELECT [freight_value] FROM [dim].[DimOrderItems]
SELECT [payment_value] FROM [dim].[DimPayments]



----------------------------- ADD FOREGIN KEYES ON STAGING AREA ------------------------------------------

USE [Brazilian_Ecommerce]; 
GO 

ALTER TABLE  [dim].[FactOrder]
ADD FK_DimOrderItems INT IDENTITY (1,1)
ALTER TABLE  [dim].[FactOrder]
ADD CONSTRAINT  FK_DimOrderItems
FOREIGN KEY (FK_DimOrderItems) REFERENCES [dim].[DimOrderItems](PK_DimOrderItems);


USE [Brazilian_Ecommerce]; 
GO 

ALTER TABLE  [dim].[FactOrder]
ALTER COLUMN FK_DimOrderItems INT


USE [Brazilian_Ecommerce]; 
GO 

ALTER TABLE  [dim].[FactOrder]
ADD FK_Payment INT
ALTER TABLE  [dim].[FactOrder]
ADD CONSTRAINT  FK_Payment
FOREIGN KEY (FK_Payment) REFERENCES [dim].[DimPayments](PK_Payment);


USE [Brazilian_Ecommerce]; 
GO 

ALTER TABLE  [dim].[FactOrder]
ADD FK_Order INT
ALTER TABLE  [dim].[FactOrder]
ADD CONSTRAINT  FK_Order
FOREIGN KEY (FK_Order) REFERENCES [dim].[DimOrder](PK_Order);


USE [Brazilian_Ecommerce]; 
GO 

ALTER TABLE  [dim].[FactOrder]
ADD FK_Customer INT
ALTER TABLE  [dim].[FactOrder]
ADD CONSTRAINT  FK_Customer
FOREIGN KEY (FK_Customer) REFERENCES [dim].[DimCustomers](PK_Customer);


USE [Brazilian_Ecommerce]; 
GO 

ALTER TABLE  [dim].[FactOrder]
ADD FK_Product INT
ALTER TABLE  [dim].[FactOrder]
ADD CONSTRAINT  FK_Product
FOREIGN KEY (FK_Product) REFERENCES [dim].[DimProducts]([PK_Product]);


USE [Brazilian_Ecommerce]; 
GO 

ALTER TABLE  [dim].[FactOrder]
ADD FK_Seller INT
ALTER TABLE  [dim].[FactOrder]
ADD CONSTRAINT  FK_Seller
FOREIGN KEY (FK_Seller) REFERENCES [dim].[DimSellers]([PK_Seller]);


USE [Brazilian_Ecommerce]; 
GO 

ALTER TABLE  [dim].[FactOrder]
ADD FK_Time INT
ALTER TABLE  [dim].[FactOrder]
ADD CONSTRAINT  FK_Time
FOREIGN KEY (FK_Time) REFERENCES [dim].[DimTime](PK_Time);

USE [Brazilian_Ecommerce]; 
GO 


ALTER TABLE  [dim].[FactOrder]
ADD FK_Location INT
ALTER TABLE  [dim].[FactOrder]
ADD CONSTRAINT  FK_Location
FOREIGN KEY (FK_Location) REFERENCES [dim].[DimLocation](PK_Location);


-- Drop IDENTITY and recreate 

USE [Brazilian_Ecommerce]
GO

ALTER TABLE [dim].[FactOrder] DROP CONSTRAINT [FK_DimOrderItems]
GO

ALTER TABLE [dim].[FactOrder] DROP COLUMN [FK_DimOrderItems]
GO

ALTER TABLE [dim].[FactOrder] ADD [FK_DimOrderItems] INT
GO

ALTER TABLE [dim].[FactOrder]  WITH CHECK ADD  CONSTRAINT [FK_DimOrderItems] FOREIGN KEY([FK_DimOrderItems])
REFERENCES [dim].[DimOrderItems] ([PK_DimOrderItems])
GO

ALTER TABLE [dim].[FactOrder] CHECK CONSTRAINT [FK_DimOrderItems]
GO







-- ADD PRIMARY KEY

USE [Brazilian_Ecommerce];
GO

ALTER TABLE [dim].[FactOrder] ADD [PK_FactOrder]  INT IDENTITY (1,1)


USE [Brazilian_Ecommerce]
GO

ALTER TABLE [dim].[FactOrder] ALTER COLUMN [FK_DimOrderItems] INT NOT NULL
GO
ALTER TABLE [dim].[FactOrder] ALTER COLUMN FK_Seller INT NOT NULL
GO
ALTER TABLE [dim].[FactOrder] ALTER COLUMN FK_Product INT NOT NULL
GO
ALTER TABLE [dim].[FactOrder] ALTER COLUMN FK_Payment INT NOT NULL
GO
ALTER TABLE [dim].[FactOrder] ALTER COLUMN FK_Order INT NOT NULL
GO
ALTER TABLE [dim].[FactOrder] ALTER COLUMN FK_DimOrderItems INT NOT NULL
GO
ALTER TABLE [dim].[FactOrder] ALTER COLUMN FK_Customer INT NOT NULL
GO
ALTER TABLE [dim].[FactOrder] ALTER COLUMN FK_Time INT NOT NULL
Go


ALTER TABLE [dim].[FactOrder] ADD CONSTRAINT PK_FactOrders PRIMARY KEY (
	 PK_FactOrder
	,FK_Product
	,FK_Payment
	,FK_Order
	,FK_DimOrderItems
	,FK_Customer
	,FK_Time 
	)

/*
Commands completed successfully.

Completion time: 2022-09-21T12:24:13.8976815-03:00

*/