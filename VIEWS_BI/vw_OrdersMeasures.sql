SELECT MAX([freight_value]) AS MAX_FREIGHT
	,MAX([price]) AS MAX_PRICE
	,MAX([payment_value]) AS MAX_PAYMENT
	,MIN([freight_value]) AS MIN_FREIGHT
	,MIN([price]) AS MIN_PRICE
	,MIN([payment_value]) AS MIN_PAYMENT
	,(MIN([price]) + MAX([price])) / 2 AS MEDIAN_PRICE
	,(MIN([freight_value]) + MAX([freight_value])) / 2 AS MEDIAN_FREIGHT
	,(MIN([payment_value]) + MAX([payment_value])) / 2 AS MEDIAN_PAYMENT
	,AVG([freight_value]) AS AVG_FREIGHT
	,AVG([price]) AS AVG_PRICE
	,AVG([payment_value]) AS AVG_PAYMENT
	,DATEPART(YEAR, DT.[order_purchase_timestamp]) AS ORDER_PURCHASE_YEAR
	,DATEPART(MONTH, DT.[order_purchase_timestamp]) AS ORDER_PURCHASE_MONTH
	,DATEPART(DD, DT.[order_purchase_timestamp]) AS ORDER_PURCHASE_DAY
	,(
		CASE DATEPART(DW, DT.[order_purchase_timestamp])
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
	,DATEPART(HH, DT.[order_purchase_timestamp]) AS ORDER_PURCHASE_HOUR
FROM [Brazilian_Ecommerce_DW].[dim].[DimOrder]
LEFT JOIN [Brazilian_Ecommerce_DW].[dim].[DimOrderItems] ON [PK_DimOrderItems] = [PK_Order]
JOIN [Brazilian_Ecommerce_DW].[dim].[DimPayments] ON [PK_Order] = [PK_Payment]
JOIN [Brazilian_Ecommerce_DW].[dim].[DimTime] DT ON [PK_Order] = [PK_Time]
GROUP BY DATEPART(MONTH, DT.[order_purchase_timestamp])
	,DATEPART(YEAR, DT.[order_purchase_timestamp])
	,DATEPART(DD, DT.[order_purchase_timestamp])
	,DATEPART(DW, DT.[order_purchase_timestamp])
	,DATEPART(HH, DT.[order_purchase_timestamp])