USE [Brazilian_Ecommerce_DW]
GO

SELECT [order_status]     
	  ,[price]			  
	  ,[freight_value]	  
	  ,[payment_value]	  
	  ,[PK_Payment]	  
	  ,[PK_Order]		  
	  ,[PK_Customer]	  
	  ,[PK_Product]	  
	  ,[PK_Seller]		  
	  ,[PK_DimOrderItems]
	  ,[PK_Time]		    
FROM [Brazilian_Ecommerce_DW].[dim].[DimOrder] AS DO
LEFT JOIN [Brazilian_Ecommerce_DW].[dim].[DimOrderItems] AS OI ON [PK_Order] = [PK_DimOrderItems]
JOIN [Brazilian_Ecommerce_DW].[dim].[DimPayments] AS PM ON [PK_DimOrderItems] = [PK_Payment]
JOIN [Brazilian_Ecommerce_DW].[dim].[DimTime] AS DT ON [PK_DimOrderItems] = [PK_Time]
JOIN [Brazilian_Ecommerce_DW].[dim].[DimCustomers] AS CS ON [PK_Order] = [PK_Customer]
JOIN [Brazilian_Ecommerce_DW].[dim].[DimProducts] AS PD ON [PK_Order] = [PK_Product]
JOIN [Brazilian_Ecommerce_DW].[dim].[DimSellers] AS SL ON [PK_Order] = [PK_Seller]
WHERE EXISTS (SELECT order_id FROM [dim].[DimOrder])


--INSERT INTO [Brazilian_Ecommerce_DW].[fact].[FactOrder]
--           ([order_status]
--           ,[price]
--           ,[freight_value]
--           ,[payment_value]
--           ,[FK_Payment]
--           ,[FK_Order]
--           ,[FK_Customer]
--           ,[FK_Product]
--           ,[FK_Seller]
--           ,[FK_DimOrderItems]
--           ,[FK_Time]
--		   )
--SELECT [order_status]     
--	  ,[price]			  
--	  ,[freight_value]	  
--	  ,[payment_value]	  
--	  ,[PK_Payment]	  
--	  ,[PK_Order]		  
--	  ,[PK_Customer]	  
--	  ,[PK_Product]	  
--	  ,[PK_Seller]		  
--	  ,[PK_DimOrderItems]
--	  ,[PK_Time]		    
--FROM [Brazilian_Ecommerce_DW].[dim].[DimOrder] AS DO
--JOIN [Brazilian_Ecommerce_DW].[dim].[DimOrderItems] AS OI ON [PK_Order] = [PK_DimOrderItems]
--JOIN [Brazilian_Ecommerce_DW].[dim].[DimPayments] AS PM ON [PK_DimOrderItems] = [PK_Payment]
--JOIN [Brazilian_Ecommerce_DW].[dim].[DimTime] AS DT ON [PK_DimOrderItems] = [PK_Time]
--JOIN [Brazilian_Ecommerce_DW].[dim].[DimCustomers] AS CS ON [PK_Order] = [PK_Customer]
--JOIN [Brazilian_Ecommerce_DW].[dim].[DimProducts] AS PD ON [PK_Order] = [PK_Product]
--JOIN [Brazilian_Ecommerce_DW].[dim].[DimSellers] AS SL ON [PK_Order] = [PK_Seller]
--WHERE EXISTS (SELECT order_id FROM [Brazilian_Ecommerce_DW].[dim].[DimOrder])

/*
(3095 rows affected)

Completion time: 2022-09-22T11:11:03.3299202-03:00
*/

-- ALTER TABLE [Brazilian_Ecommerce_DW].[dim].[DimOrder] ADD customer_id VARCHAR(100)


USE [Brazilian_Ecommerce_DW]
GO

ALTER TABLE [fact].[FactOrder] DROP CONSTRAINT [PK_FactOrders] WITH ( ONLINE = OFF )
GO

ALTER TABLE [fact].[FactOrder] ADD  CONSTRAINT [PK_FactOrders] PRIMARY KEY CLUSTERED 
(
	[PK_FactOrder] ASC,
	[FK_Product] ASC,
	[FK_Payment] ASC,
	[FK_Order] ASC,
	[FK_DimOrderItems] ASC,
	[FK_Customer] ASC,
	[FK_Time] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO

ALTER TABLE [fact].[FactOrder] DROP CONSTRAINT [FK_Seller]
GO

ALTER TABLE  [fact].[FactOrder]
DROP COLUMN FK_Seller

ALTER TABLE  [fact].[FactOrder]
ADD FK_Seller INT


ALTER TABLE [fact].[FactOrder]  WITH CHECK ADD  CONSTRAINT [FK_Seller] FOREIGN KEY([FK_Seller])
REFERENCES [dim].[DimSellers] ([PK_Seller])
GO

ALTER TABLE [fact].[FactOrder] CHECK CONSTRAINT [FK_Seller]
GO



TRUNCATE TABLE [fact].[FactOrder]

INSERT INTO [Brazilian_Ecommerce_DW].[fact].[FactOrder]
           ([order_status]
           ,[price]
           ,[freight_value]
           ,[payment_value]
           ,[FK_Payment]
           ,[FK_Order]
           ,[FK_Customer]
           ,[FK_Product]
--         ,[FK_Seller]
           ,[FK_DimOrderItems]
           ,[FK_Time]
		   )
SELECT [order_status]     
	  ,[price]			  
	  ,[freight_value]	  
	  ,[payment_value]	  
	  ,[PK_Payment]	  
	  ,[PK_Order]		  
	  ,[PK_Customer]	  
	  ,[PK_Product]	  
--	  ,[PK_Seller]		  
	  ,[PK_DimOrderItems]
	  ,[PK_Time]		    
FROM [Brazilian_Ecommerce_DW].[dim].[DimOrder] AS DO
LEFT JOIN [Brazilian_Ecommerce_DW].[dim].[DimOrderItems] AS OI ON [PK_Order] = [PK_DimOrderItems]
JOIN [Brazilian_Ecommerce_DW].[dim].[DimPayments] AS PM ON [PK_DimOrderItems] = [PK_Payment]
JOIN [Brazilian_Ecommerce_DW].[dim].[DimTime] AS DT ON [PK_DimOrderItems] = [PK_Time]
JOIN [Brazilian_Ecommerce_DW].[dim].[DimCustomers] AS CS ON [PK_Order] = [PK_Customer]
JOIN [Brazilian_Ecommerce_DW].[dim].[DimProducts] AS PD ON [PK_Order] = [PK_Product]
--JOIN [Brazilian_Ecommerce_DW].[dim].[DimSellers] AS SL ON [PK_Order] = [PK_Seller]
WHERE EXISTS (SELECT order_id FROM [Brazilian_Ecommerce_DW].[dim].[DimOrder])


/*

(32951 rows affected)

Completion time: 2022-09-22T19:11:32.6954501-03:00

*/