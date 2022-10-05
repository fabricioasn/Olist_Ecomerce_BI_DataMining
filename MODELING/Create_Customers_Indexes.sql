USE [Brazilian_Ecommerce];
GO

CREATE NONCLUSTERED INDEX SK01_Customers_unique_id 
ON [DIM].[Customers] (customer_unique_id)
WITH (DATA_COMPRESSION=PAGE, FILLFACTOR=90)
ON [INDEXES]

CREATE NONCLUSTERED INDEX SK02_customer_zip_code_prefix
ON [DIM].[Customers] (customer_zip_code_prefix)
INCLUDE([customer_city],[customer_state])
WITH (DATA_COMPRESSION=PAGE, FILLFACTOR=90)
ON [INDEXES]
