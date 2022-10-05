SELECT  order_status
        ,payment_value
		,payment_installments
		,payment_sequential
		,payment_type
FROM [Brazilian_Ecommerce_DW].[dim].[DimOrder]
INNER JOIN [Brazilian_Ecommerce_DW].[dim].[DimPayments] ON [PK_Order] = [PK_Payment]
