USE [Brazilian_Ecommerce_DW]
GO

SELECT DATEDIFF(DAY,[order_purchase_timestamp],[order_delivered_carrier_date]) AS TIME_TO_CARRY
      ,DATEDIFF(DAY,[order_purchase_timestamp],[order_delivered_customer_date]) AS TIME_TO_DELIVER_ORDER
	  ,DATEDIFF(DAY,[order_delivered_customer_date],[order_estimated_delivery_date]) AS COMPARE_ESTIMATED_TO_DELIVERED_TIME
	  ,DATEDIFF(DAY,[order_purchase_timestamp],[order_estimated_delivery_date]) AS ESTIMATED_TIME_TO_DELIVERY
      ,DATEPART(YEAR,[order_purchase_timestamp]) AS ORDER_PURCHASE_YEAR
	,DATEPART(MONTH, [order_purchase_timestamp]) AS ORDER_PURCHASE_MONTH
	,DATEPART(DD, [order_purchase_timestamp]) AS ORDER_PURCHASE_DAY
	,(
		CASE DATEPART(DW, [order_purchase_timestamp])
			WHEN 1
				THEN 'Sunday'
			WHEN 2
				THEN 'Monday'
			WHEN 3
				THEN 'Tuesday'
			WHEN 4
				THEN 'Wednseday'
			WHEN 5
				THEN 'Thursday'
			WHEN 6
				THEN 'Friday'
			WHEN 7
				THEN 'Saturday'
			END
		) AS ORDER_PURCHASE_WEEKDAY
  FROM [dim].[DimTime] 
  WHERE  [order_purchase_timestamp] != '2017-01-01 00:00:00.000'
     AND [order_delivered_carrier_date] != '2017-01-01 00:00:00.000'
     AND [order_delivered_customer_date] != '2017-01-01 00:00:00.000'
     AND [order_estimated_delivery_date] != '2017-01-01 00:00:00.000'

GO


