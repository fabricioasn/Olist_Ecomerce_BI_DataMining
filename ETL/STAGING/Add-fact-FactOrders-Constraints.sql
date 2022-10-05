USE [Brazilian_Ecommerce_DW]; 
GO 

ALTER TABLE  [fact].[FactOrder]
ADD CONSTRAINT  FK_DimOrderItems
FOREIGN KEY (FK_DimOrderItems) REFERENCES [dim].[DimOrderItems](PK_DimOrderItems);

ALTER TABLE  [fact].[FactOrder]
ADD CONSTRAINT  FK_Payment
FOREIGN KEY (FK_Payment) REFERENCES [dim].[DimPayments](PK_Payment);

ALTER TABLE  [fact].[FactOrder]
ADD CONSTRAINT  FK_Order
FOREIGN KEY (FK_Order) REFERENCES [dim].[DimOrder](PK_Order);

ALTER TABLE  [fact].[FactOrder]
ADD CONSTRAINT  FK_Customer
FOREIGN KEY (FK_Customer) REFERENCES [dim].[DimCustomers](PK_Customer);

ALTER TABLE  [fact].[FactOrder]
ADD CONSTRAINT  FK_Product
FOREIGN KEY (FK_Product) REFERENCES [dim].[DimProducts]([PK_Product]);

ALTER TABLE  [fact].[FactOrder]
ADD CONSTRAINT  FK_Seller
FOREIGN KEY (FK_Seller) REFERENCES [dim].[DimSellers]([PK_Seller]);

ALTER TABLE  [fact].[FactOrder]
ADD CONSTRAINT  FK_Time
FOREIGN KEY (FK_Time) REFERENCES [dim].[DimTime](PK_Time);

ALTER TABLE  [fact].[FactOrder]
ADD CONSTRAINT  FK_Location
FOREIGN KEY (FK_Location) REFERENCES [dim].[DimLocation](PK_Location);


USE Brazilian_Ecommerce_DW;
GO

ALTER TABLE [Brazilian_Ecommerce_DW].[fact].[FactOrder] 
DROP COLUMN [order_id]

ALTER TABLE [Brazilian_Ecommerce_DW].[fact].[FactOrder] 
DROP COLUMN [time_id]

ALTER TABLE [Brazilian_Ecommerce_DW].[fact].[FactOrder] 
DROP COLUMN [order_item_id]

ALTER TABLE [Brazilian_Ecommerce_DW].[fact].[FactOrder] 
DROP COLUMN [product_id]

ALTER TABLE [Brazilian_Ecommerce_DW].[fact].[FactOrder] 
DROP COLUMN [seller_id]

ALTER TABLE [Brazilian_Ecommerce_DW].[fact].[FactOrder] 
DROP COLUMN [customer_id]

ALTER TABLE [Brazilian_Ecommerce_DW].[fact].[FactOrder] 
DROP COLUMN [payment_id]