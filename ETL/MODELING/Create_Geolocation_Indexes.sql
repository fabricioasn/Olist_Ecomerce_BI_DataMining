USE [Brazilian_Ecommerce];
GO

CREATE NONCLUSTERED INDEX SK01_lat_lng
ON [DIM].[Geolocation] (geolocation_lat asc,geolocation_lng asc )
WITH (DATA_COMPRESSION=PAGE, FILLFACTOR=90)
ON [INDEXES]

CREATE NONCLUSTERED INDEX SK02_geolocation_city_state
ON [dim].[Geolocation] (geolocation_city asc)
INCLUDE(geolocation_state)
WITH (DATA_COMPRESSION=PAGE, FILLFACTOR=90)
ON [INDEXES]

CREATE NONCLUSTERED INDEX SK03_geolocation_zip_code
ON [dim].[Geolocation] ([geolocation_zip_code_prefix])
INCLUDE(geolocation_city,geolocation_lng,geolocation_lat)
WITH (DATA_COMPRESSION=PAGE, FILLFACTOR=90)
ON [INDEXES]


CREATE NONCLUSTERED INDEX SK03_geolocation_zip_code
ON [dim].[Geolocation] ([geolocation_zip_code_prefix])
INCLUDE(geolocation_city,geolocation_lng,geolocation_lat,geolocation_state)
WITH (DROP_EXISTING=ON, DATA_COMPRESSION=PAGE, FILLFACTOR=90)
ON [INDEXES]


