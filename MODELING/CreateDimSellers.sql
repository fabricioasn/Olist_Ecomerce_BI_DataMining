USE [Brazilian_Ecommerce]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dim].[DimSellers](
   [PK_Seller] INT
  ,[seller_id] VARCHAR (100)
  ,[seller_zip_code_prefix] VARCHAR (10) NOT NULL 
  ,[seller_city] VARCHAR (100)
  ,[seller_state] VARCHAR (100)
  

PRIMARY KEY CLUSTERED 
(
	[PK_Seller] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = on) ON [PRIMARY]
) ON [PRIMARY]
GO

/*

Commands completed successfully.

Completion time: 2022-09-13T02:39:17.9749153-03:00

seller_id,"seller_zip_code_prefix","seller_city","seller_state"

*/


USE [Brazilian_Ecommerce]; 
GO 

ALTER TABLE  [dim].[DimSellers]
ADD [PK_Seller] INT IDENTITY (1,1) PRIMARY KEY CLUSTERED 
GO