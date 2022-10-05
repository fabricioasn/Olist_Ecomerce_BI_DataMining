USE [Brazilian_Ecommerce]
GO


ALTER TABLE [dim].[Customers] DROP CONSTRAINT [PK__Customer__CD65CB855B7BD665] WITH ( ONLINE = OFF )
GO

DROP INDEX [SK01_Customers_unique_id] ON [dim].[Customers]
GO

DROP INDEX [SK02_customer_zip_code_prefix] ON [dim].[Customers]
GO

ALTER TABLE [DIM].[CUSTOMERS] ALTER COLUMN [customer_id] VARCHAR(100) NOT NULL
ALTER TABLE [DIM].[CUSTOMERS] ALTER COLUMN [customer_unique_id] VARCHAR(100) NOT NULL
ALTER TABLE [DIM].[CUSTOMERS] ADD [PK_Customer] INT IDENTITY NOT NULL

ALTER TABLE [dim].[Customers] ADD PRIMARY KEY CLUSTERED 
([PK_Customer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO

