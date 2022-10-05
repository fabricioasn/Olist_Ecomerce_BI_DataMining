USE [Brazilian_Ecommerce]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dim].[DimProducts](
   [PK_Product] INT
  ,[product_id] VARCHAR (100)
  ,[product_name_lenght] SMALLINT
  ,[product_weight_g] DECIMAL (3,1)
  ,[product_length_cm] SMALLINT
  ,[product_height_cm] SMALLINT
  ,[product_width_cm] SMALLINT
  

PRIMARY KEY CLUSTERED 
(
	[PK_Product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = on) ON [PRIMARY]
) ON [PRIMARY]
GO


USE [Brazilian_Ecommerce];
GO

ALTER TABLE [Dim].[DimProducts] ADD product_category_name varchar(100)

ALTER TABLE [Dim].[DimProducts] DROP COLUMN [product_name_lenght]
/*
product_id,
"product_category_name",
"product_name_lenght",
"product_description_lenght",
"product_photos_qty",
"product_weight_g",
"product_length_cm",
"product_height_cm",
"product_width_cm"

Commands completed successfully.

Completion time: 2022-09-13T02:52:14.6388401-03:00


*/

USE [Brazilian_Ecommerce]; 
GO 

ALTER TABLE [dim].[DimProducts]
ADD [PK_Product] INT IDENTITY (1,1) PRIMARY KEY CLUSTERED 
GO