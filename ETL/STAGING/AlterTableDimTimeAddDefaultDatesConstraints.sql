
USE [Brazilian_Ecommerce];
GO

--TRUNCATE TABLE [dim].[DimTime]

--ALTER TABLE [dim].[DimTime] DROP CONSTRAINT Default_shipping_limit_date
--ALTER TABLE [dim].[DimTime] ADD CONSTRAINT Default_shipping_limit_date DEFAULT '2017-01-01 00:00:00.000' FOR [shipping_limit_date]
ALTER TABLE [dim].[DimTime] ADD CONSTRAINT Default_order_purchase_timestamp DEFAULT '2017-01-01 00:00:00.000' FOR  [order_purchase_timestamp]
ALTER TABLE [dim].[DimTime] ADD CONSTRAINT Default_order_approved_at DEFAULT '2017-01-01 00:00:00.000' FOR  [order_approved_at]
ALTER TABLE [dim].[DimTime] ADD CONSTRAINT Default_order_delivered_carrier_date DEFAULT '2017-01-01 00:00:00.000' FOR  [order_delivered_carrier_date]
ALTER TABLE [dim].[DimTime] ADD CONSTRAINT Default_order_delivered_customer_date DEFAULT '2017-01-01 00:00:00.000' FOR  [order_delivered_customer_date]
ALTER TABLE [dim].[DimTime] ADD CONSTRAINT Default_order_estimated_delivery_date DEFAULT '2017-01-01 00:00:00.000' FOR  [order_estimated_delivery_date]