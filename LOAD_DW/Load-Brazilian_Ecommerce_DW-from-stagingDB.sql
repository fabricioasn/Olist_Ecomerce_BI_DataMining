USE [Brazilian_Ecommerce_DW]
GO

-------------------------------- DIM LOCATION ---------------------------------------------
INSERT INTO [Brazilian_Ecommerce_DW].[dim].[DimLocation] ([geolocation_state])
SELECT DISTINCT([geolocation_state])
FROM [Brazilian_Ecommerce].[dim].[DimGeolocation]
WHERE [geolocation_state] != ' rio de janeiro, brasil",RJ'
ORDER BY [geolocation_state] ASC

INSERT INTO [dim].[DimLocation] ([geolocation_state])
VALUES
 ('AL')
,('AP')
,('AM')
,('BA')
,('CE')
,('DF')
,('GO')
,('MA')
,('MS')
,('MT')
,('MG')
,('PA')
,('PB')
,('PR')
,('PE')
,('PI')
,('RS')
,('RO')
,('RR')
,('SC')
,('SE')
,('TO');

-------------------------------- DIM CUSTOMERS ---------------------------------------------

INSERT INTO [Brazilian_Ecommerce_DW].[dim].[DimCustomers]
           ([customer_id]
           ,[customer_zip_code_prefix]
           ,[customer_city]
           ,[customer_state]
           ,[customer_unique_id])
SELECT [customer_id]
      ,[customer_zip_code_prefix]
      ,[customer_city]
      ,[customer_state]
      ,[customer_unique_id]
  FROM [Brazilian_Ecommerce].[dim].[DimCustomers]

GO

/* 
(198601 rows affected)

Completion time: 2022-09-22T01:45:29.6443488-03:00
*/


-------------------------------- DIM ORDER ---------------------------------------------

INSERT INTO [Brazilian_Ecommerce_DW].[dim].[DimOrder]
           ([order_id]
           ,[order_status])
SELECT [order_id]
      ,[order_status]
  FROM [Brazilian_Ecommerce].[dim].[DimOrder]

GO

/* 
(99441 rows affected)

Completion time: 2022-09-22T01:50:48.5561384-03:00
*/


-------------------------------- DIM ORDER ITEMS ---------------------------------------------

UPDATE [Brazilian_Ecommerce_DW].[dim].[DimOrderItems]
SET [seller_id] = (
		SELECT [seller_id]
		FROM [Brazilian_Ecommerce].[dim].[DimOrderItems]
		)
	,[product_id] = (
		SELECT [product_id]
		FROM [Brazilian_Ecommerce].[dim].[DimOrderItems]
		)
WHERE [product_id] IS NULL
	AND [seller_id] IS NULL


WHERE shipping_limit_date IS NULL

INSERT INTO [Brazilian_Ecommerce_DW].[dim].[DimOrderItems]
           ([seller_id]
           ,[product_id])
SELECT [seller_id]
      ,[product_id]
  FROM [Brazilian_Ecommerce].[dim].[DimOrderItems]

/*
(112650 rows affected)

Completion time: 2022-09-22T01:55:23.3411707-03:00
*/

WITH CTE_SL_CS AS ( 
    SELECT DI.[seller_id] AS [DI_seller_id]
          ,DI.[product_id] AS [DI_product_id]
		  ,DIDW.[seller_id] AS [DIDW_seller_id]
		  ,DIDW.[product_id] AS [DIDW_product_id]
  FROM [Brazilian_Ecommerce].[dim].[DimOrderItems] DI
  JOIN [Brazilian_Ecommerce_DW].[dim].[DimOrderItems] DIDW
  ON DI.[PK_DimOrderItems] = DIDW.PK_DimOrderItems
)
UPDATE CTE_SL_CS
SET [DIDW_seller_id] = [DI_seller_id]
, [DIDW_product_id] = [DI_product_id]
WHERE [DIDW_seller_id] IS NULL
AND [DIDW_product_id] IS NULL

/*
(112650 rows affected)

Completion time: 2022-09-23T02:58:55.9747238-03:00
*/


--UPDATE [Brazilian_Ecommerce_DW].[dim].[DimOrderItems]
--SET [seller_id] = (
--SELECT [seller_id]
--  FROM [Brazilian_Ecommerce].[dim].[DimOrderItems]
--)
--, [product_id] = (
--SELECT [product_id]
--  FROM [Brazilian_Ecommerce].[dim].[DimOrderItems]
--)
--WHERE [product_id] IS NULL
--AND [seller_id] IS NULL


-------------------------------- DIM PAYMENTS ---------------------------------------------

INSERT INTO [Brazilian_Ecommerce_DW].[dim].[DimPayments]
           ([payment_sequential]
           ,[payment_type]
           ,[payment_installments]
           ,[payment_value])
SELECT [payment_sequential]
      ,[payment_type]
      ,[payment_installments]
      ,[payment_value]
  FROM [Brazilian_Ecommerce].[dim].[DimPayments]

GO

/*
(103886 rows affected)

Completion time: 2022-09-22T01:57:58.0782435-03:00
*/


-------------------------------- DIM PRODUCTS ---------------------------------------------

INSERT INTO [Brazilian_Ecommerce_DW].[dim].[DimProducts]
           ([product_id]
           ,[product_weight_g]
           ,[product_length_cm]
           ,[product_height_cm]
           ,[product_width_cm]
           ,[product_category_name])
SELECT [product_id]
      ,[product_weight_g]
      ,[product_length_cm]
      ,[product_height_cm]
      ,[product_width_cm]
      ,[product_category_name]
  FROM [Brazilian_Ecommerce].[dim].[DimProducts]

/*
(32951 rows affected)

Completion time: 2022-09-22T02:04:24.6598407-03:00
*/

ALTER TABLE [Brazilian_Ecommerce_DW].[dim].[DimProducts]
ADD product_volume_cm AS ([product_length_cm]*[product_height_cm]*[product_width_cm])


ALTER TABLE [Brazilian_Ecommerce_DW].[dim].[DimProducts]
DROP COLUMN [product_volume_cm]

ALTER TABLE [Brazilian_Ecommerce_DW].[dim].[DimProducts]
ALTER COLUMN [product_length_cm] INT

ALTER TABLE [Brazilian_Ecommerce_DW].[dim].[DimProducts]
ALTER COLUMN [product_height_cm] INT

ALTER TABLE [Brazilian_Ecommerce_DW].[dim].[DimProducts]
ALTER COLUMN [product_width_cm] INT

ALTER TABLE [Brazilian_Ecommerce_DW].[dim].[DimProducts]
ADD product_volume_cm AS ([product_length_cm]*[product_height_cm]*[product_width_cm]) PERSISTED

UPDATE [Brazilian_Ecommerce_DW].[dim].[DimProducts]
SET [product_category_name] = 'sem_categoria'
WHERE [product_category_name] IS NULL 

/*
(610 rows affected)

Completion time: 2022-09-23T03:17:54.4563738-03:00
*/

-------------------------------- DIM SELLERS ---------------------------------------------

INSERT INTO [Brazilian_Ecommerce_DW].[dim].[DimSellers]
           ([seller_id]
           ,[seller_zip_code_prefix]
           ,[seller_city]
           ,[seller_state])
SELECT [seller_id]
      ,[seller_zip_code_prefix]
      ,[seller_city]
      ,[seller_state]
  FROM [Brazilian_Ecommerce].[dim].[DimSellers]

/*
(3095 rows affected)

Completion time: 2022-09-22T02:20:43.2576569-03:00
*/

-------------------------------- DIM TIME  ---------------------------------------------

INSERT INTO [Brazilian_Ecommerce_DW].[dim].[DimTime]
           ([shipping_limit_date]
           ,[order_purchase_timestamp]
           ,[order_approved_at]
           ,[order_delivered_carrier_date]
           ,[order_delivered_customer_date]
           ,[order_estimated_delivery_date]
           ,[FK_DimOrderItems])

SELECT [shipping_limit_date]
      ,[order_purchase_timestamp]
      ,[order_approved_at]
      ,[order_delivered_carrier_date]
      ,[order_delivered_customer_date]
      ,[order_estimated_delivery_date]
      ,[FK_DimOrderItems]
  FROM [Brazilian_Ecommerce_DW].[dim].[DimTime]

/*
(99441 rows affected)

Completion time: 2022-09-22T02:24:07.9499720-03:00
*/


-------------------------------- FACT FACTORDER  ---------------------------------------------

USE [Brazilian_Ecommerce_DW]
GO



INSERT INTO [fact].[FactOrder] 
   ( [FK_Payment]
   ,[FK_Order]
   ,[FK_Customer]
   ,[FK_Product]
   ,[FK_Seller]
   ,[FK_DimOrderItems]
   ,[FK_Time]
   ,[FK_Location]
   )
   SELECT [PK_Payment] FROM [dim].[DimPayments]
   UNION 
   SELECT [PK_Order] FROM [dim].[DimOrder]
   UNION 
   SELECT [PK_Customer] FROM [dim].[DimCustomers]




INSERT INTO [fact].[FactOrder]
           ([order_status]
           ,[price]
           ,[freight_value]
           ,[payment_value]
)

SELECT 
            OD.[order_status]
           ,OI.[price]
           ,OI.[freight_value]
           ,PM.[payment_value]
FROM [Brazilian_Ecommerce].[dim].[DimOrder] OD
LEFT JOIN [Brazilian_Ecommerce].[dim].[DimOrderItems] OI
ON OD.[PK_Order] = OI.[PK_DimOrderItems]
LEFT JOIN [Brazilian_Ecommerce].[dim].[DimPayments] PM
ON OD.[PK_Order] = PM.[PK_Payment]


