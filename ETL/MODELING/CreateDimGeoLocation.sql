USE [Brazilian_Ecommerce]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dim].[Geolocation](
  [geolocation_zip_code_prefix] VARCHAR (60)
, [geolocation_lat] DECIMAL (16,14)
, [geolocation_lng] DECIMAL (16,14)
, [geolocation_city] VARCHAR (100)
, [geolocation_state] VARCHAR (100)
, [PK_Geolocation] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_Geolocation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


