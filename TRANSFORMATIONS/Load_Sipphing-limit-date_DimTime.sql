-- SELECT DOS CAMPOS NAS DIMENSÕES TIME E ORDERITEMS

USE [Brazilian_Ecommerce];
GO

SELECT 
 DT.[shipping_limit_date] AS [DimTime_shipping_limit_date]
,OI.[shipping_limit_date] AS [DimOrderItems_shipping_limit_date]
FROM [dim].[DimOrderItems] AS OI
FULL OUTER JOIN [dim].[FactOrder] FO 
on OI.PK_DimOrderItems = FO.FK_DimOrderItems
FULL OUTER JOIN [dim].[DimTime] DT 
on DT.PK_Time = FO.[FK_Time]
WHERE DT.[shipping_limit_date]  IS NULL
AND OI.[shipping_limit_date] IS NOT NULL


-- UPDATE INICIAL 

USE [Brazilian_Ecommerce];
GO

UPDATE DT
SET DT.[shipping_limit_date] = OI.[shipping_limit_date]
FROM [dim].[DimOrderItems] AS OI
FULL OUTER JOIN [dim].[FactOrder] FO 
on OI.PK_DimOrderItems = FO.FK_DimOrderItems
FULL OUTER JOIN [dim].[DimTime] DT 
on DT.PK_Time = FO.[FK_Time]
WHERE DT.[shipping_limit_date]  IS NULL

/*

(99441 rows affected)

Completion time: 2022-09-21T12:52:46.1660901-03:00

*/

-- UPDATE MODIFICADO 

USE [Brazilian_Ecommerce];
GO

UPDATE DT
SET DT.[shipping_limit_date] = OI.[shipping_limit_date]
FROM [dim].[DimOrderItems] AS OI
FULL OUTER JOIN [dim].[FactOrder] FO 
on OI.PK_DimOrderItems = FO.FK_DimOrderItems
FULL OUTER JOIN [dim].[DimTime] DT 
on DT.PK_Time = FO.[FK_Time]
WHERE DT.[shipping_limit_date]  IS NULL
AND OI.[shipping_limit_date] IS NOT NULL

/*

(0 rows affected)

Completion time: 2022-09-21T13:05:01.0596389-03:00

*/ 

USE [Brazilian_Ecommerce];
GO

UPDATE DT
SET DT.[shipping_limit_date] = 
    CASE 
        WHEN DT.[shipping_limit_date] IS NULL THEN OI.[shipping_limit_date]
        ELSE DT.[shipping_limit_date]
	END
FROM [dim].[DimOrderItems] AS OI
FULL OUTER JOIN [dim].[FactOrder] FO 
on OI.PK_DimOrderItems = FO.FK_DimOrderItems
FULL OUTER JOIN [dim].[DimTime] DT 
on DT.PK_Time = FO.[FK_Time]
WHERE DT.[shipping_limit_date]  IS NULL
AND OI.[shipping_limit_date] IS NOT NULL

/* 

(0 rows affected)

Completion time: 2022-09-21T13:07:47.5176698-03:00

*/ 


USE [Brazilian_Ecommerce]; 
GO 

ALTER TABLE  [dim].[DimTime]
ADD FK_DimOrderItems INT
ALTER TABLE  [dim].[DimTime]
ADD CONSTRAINT  FK_DimOrderItemsTime
FOREIGN KEY (FK_DimOrderItems) REFERENCES [dim].[DimOrderItems](PK_DimOrderItems);

/*
Commands completed successfully.

Completion time: 2022-09-21T13:11:27.5611541-03:00
*/


-- NOVO SELECT 

SELECT 
 DT.[shipping_limit_date] AS [DimTime_shipping_limit_date]
,OI.[shipping_limit_date] AS [DimOrderItems_shipping_limit_date]
FROM [dim].[DimTime] DT   
FULL OUTER JOIN [dim].[DimOrderItems] AS OI
on DT.FK_DimOrderItems = OI.PK_DimOrderItems
WHERE DT.[shipping_limit_date]  IS NULL
AND OI.[shipping_limit_date] IS NOT NULL

-- UPDATE 

USE [Brazilian_Ecommerce];
GO

UPDATE DT
SET DT.[shipping_limit_date] = 
    CASE 
        WHEN DT.[shipping_limit_date] IS NULL THEN OI.[shipping_limit_date]
        ELSE DT.[shipping_limit_date]
	END
FROM [dim].[DimTime] DT   
FULL OUTER JOIN [dim].[DimOrderItems] AS OI
on DT.FK_DimOrderItems = OI.PK_DimOrderItems
WHERE DT.[shipping_limit_date]  IS NULL
AND OI.[shipping_limit_date] IS NOT NULL

/*

(0 rows affected)

Completion time: 2022-09-21T13:14:21.6810907-03:00
*/ 

-- TENTATIVA COM MERGE

USE [Brazilian_Ecommerce];
GO

MERGE INTO [dim].[DimTime]
USING [dim].[DimOrderItems]
ON [dim].[DimTime].FK_DimOrderItems = [DimOrderItems].PK_DimOrderItems
WHEN MATCHED THEN
  UPDATE SET [dim].[DimTime].[shipping_limit_date] =  [DimOrderItems].[shipping_limit_date];

/*

(0 rows affected)

Completion time: 2022-09-21T13:14:21.6810907-03:00
*/ 


-- AJUSTADO COM INSERT 

USE [Brazilian_Ecommerce];
GO

MERGE INTO [DIM].[DimTime]
USING [DIM].[DimOrderItems]
ON [DimTime].FK_DimOrderItems = [DimOrderItems].PK_DimOrderItems
WHEN MATCHED THEN
  UPDATE SET [DimTime].[shipping_limit_date] =  [DimOrderItems].[shipping_limit_date]
  WHERE [DimTime].[shipping_limit_date]  IS NULL
WHEN NOT MATCHED THEN
  INSERT
    (shipping_limit_date)
  VALUES
    ([DimOrderItems].shipping_limit_date)
	;


-- Linhas inseridas em insert, em novos campos. Delete efetuado 

USE [Brazilian_Ecommerce];
GO

DELETE FROM [dim].[DimTime]
WHERE [shipping_limit_date] IS NOT NULL
AND [order_purchase_timestamp] = '2017-01-01 00:00:00.000'
AND [order_approved_at] = '2017-01-01 00:00:00.000'
AND [order_delivered_carrier_date] = '2017-01-01 00:00:00.000'
AND [order_estimated_delivery_date] = '2017-01-01 00:00:00.000'

-- Novo Merge 

USE [Brazilian_Ecommerce];
GO

MERGE INTO [DIM].[DimTime]
USING [DIM].[DimOrderItems]
ON [DimTime].FK_DimOrderItems = [DimOrderItems].PK_DimOrderItems
WHEN MATCHED AND [DimTime].[shipping_limit_date] IS NULL THEN
  UPDATE SET [DimTime].[shipping_limit_date] =  [DimOrderItems].[shipping_limit_date]
WHEN NOT MATCHED BY TARGET AND [shipping_limit_date] IS NULL THEN
  INSERT 
    (shipping_limit_date)
  VALUES
    ([DimOrderItems].shipping_limit_date)
	;

/*
(0 rows affected)

Completion time: 2022-09-21T23:46:12.4364456-03:00
*/

-- UPDATE WITH CORRELATED QUERY ON SET

USE [Brazilian_Ecommerce];
GO

UPDATE [DIM].[DimTime]
SET shipping_limit_date = (
    SELECT shipping_limit_date
    FROM [DIM].[DimOrderItems]
    WHERE [DIM].[DimOrderItems].shipping_limit_date = [DIM].[DimTime].shipping_limit_date
)
WHERE shipping_limit_date IS NULL

/*

(99441 rows affected)

Completion time: 2022-09-21T23:51:15.8165602-03:00

*/

-- SELECT COM LEFT JOIN 

  SELECT [DIM].[DimOrderItems].shipping_limit_date
    FROM [DIM].[DimOrderItems] 
	LEFT JOIN [DIM].[DimTime]
    ON [DIM].[DimOrderItems].PK_DimOrderItems = [DIM].[DimTime].FK_DimOrderItems

/* 


(112650 rows affected)

Completion time: 2022-09-21T23:59:05.1458605-03:00


*/ 

UPDATE [DIM].[DimTime]
SET shipping_limit_date = (
    SELECT [DIM].[DimOrderItems].shipping_limit_date
    FROM [DIM].[DimOrderItems] 
	LEFT JOIN [DIM].[DimTime]
    ON [DIM].[DimOrderItems].PK_DimOrderItems = [DIM].[DimTime].FK_DimOrderItems
)
WHERE shipping_limit_date IS NULL

/*

Msg 512, Level 16, State 1, Line 4
Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.
The statement has been terminated.

Completion time: 2022-09-22T00:00:04.6855709-03:00


*/

-- Updatable CTE 

USE [Brazilian_Ecommerce];
GO

WITH CTE_SLD AS ( 
    SELECT [DIM].[DimOrderItems].shipping_limit_date AS [OI_shipping_limit_date], [DIM].[DimTime].shipping_limit_date AS [DT_shipping_limit_date]
    FROM [DIM].[DimOrderItems] 
	LEFT JOIN [DIM].[DimTime]
    ON [DIM].[DimOrderItems].PK_DimOrderItems = [DIM].[DimTime].FK_DimOrderItems
)

UPDATE CTE_SLD
SET [OI_shipping_limit_date] = [DT_shipping_limit_date]
WHERE [DT_shipping_limit_date] IS NULL

-- Update FK_DimOrderItems 

USE [Brazilian_Ecommerce];
GO

UPDATE [DIM].[DimTime]
SET FK_DimOrderItems = PK_Time
WHERE FK_DimOrderItems IS NULL

/*

(99441 rows affected)

Completion time: 2022-09-22T00:12:28.7900363-03:00

*/

-- UPDATE COM CORRELATED QUERY E JOIN IMPLÍCITO NO SET 

USE [Brazilian_Ecommerce];
GO

UPDATE [DIM].[DimTime]
SET shipping_limit_date = (
    SELECT shipping_limit_date
    FROM [DIM].[DimOrderItems]
    WHERE [DIM].[DimOrderItems].[PK_DimOrderItems] = [DIM].[DimTime].[FK_DimOrderItems]
)
WHERE shipping_limit_date IS NULL

/* 

(99441 rows affected)

Completion time: 2022-09-22T00:15:26.4217353-03:00

*/ 

