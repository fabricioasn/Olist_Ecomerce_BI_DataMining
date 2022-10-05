USE [Brazilian_Ecommerce]
GO


CREATE TABLE [dim].[DimLocation](
	[geolocation_city] [varchar](100) NULL,
	[geolocation_state] [varchar](100) NULL,
	[PK_Location] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_Location] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



INSERT INTO [dim].[DimLocation] ([geolocation_city],[geolocation_state])
SELECT [geolocation_city],[geolocation_state]
FROM [dim].[DimGeolocation]