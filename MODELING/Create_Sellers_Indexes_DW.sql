USE [Brazilian_Ecommerce_DW];
GO

CREATE NONCLUSTERED INDEX SK01_Sellers_ID
ON [DIM].[DimSellers] (SELLER_ID)
WITH (DATA_COMPRESSION=PAGE, FILLFACTOR=90)
ON [INDEXES]