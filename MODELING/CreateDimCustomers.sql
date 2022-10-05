Use [Brazilian_Ecommerce]
GO

CREATE SCHEMA [dim] AUTHORIZATION [dbo]
GO
CREATE SCHEMA [fact] AUTHORIZATION [dbo]
GO


CREATE TABLE [DIM].[Customers]
(
 [customer_id] INT NOT NULL PRIMARY KEY CLUSTERED
,[customer_unique_id] INT NOT NULL IDENTITY
,[customer_zip_code_prefix] VARCHAR (10) NOT NULL 
,[customer_city] VARCHAR (100)
,[customer_state] VARCHAR (100)
)

SET IDENTITY_INSERT [DIM].[Customers] ON

ALTER TABLE [DIM].[Customers] DROP COLUMN [customer_unique_id]

ALTER TABLE [DIM].[Customers] ADD [customer_unique_id] INT NOT NULL 