USE [Brazilian_Ecommerce]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dim].[DimPayment](
   [PK_Payment] INT
  ,[payment_sequential] TINYINT
  ,[payment_type] VARCHAR (50)
  ,[payment_installments] SMALLINT
  ,[payment_value] DECIMAL (4,2)
  

PRIMARY KEY CLUSTERED 
(
	[PK_Payment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = on) ON [PRIMARY]
) ON [PRIMARY]
GO

/*
Commands completed successfully.

Completion time: 2022-09-13T02:11:55.1897278-03:00

*/