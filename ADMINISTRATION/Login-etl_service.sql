USE [master]
GO
CREATE LOGIN [etl_service] WITH PASSWORD=N'>%Nu/B4SF&:Q', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER SERVER ROLE [bulkadmin] ADD MEMBER [etl_service]
GO
use [master];
GO
USE [Brazilian_Ecommerce]
GO
CREATE USER [etl_service] FOR LOGIN [etl_service]
GO
USE [Brazilian_Ecommerce]
GO
ALTER USER [etl_service] WITH DEFAULT_SCHEMA=[etl_service]
GO
USE [Brazilian_Ecommerce]
GO
CREATE SCHEMA [etl_service] AUTHORIZATION [etl_service]
GO
USE [Brazilian_Ecommerce]
GO
ALTER ROLE [db_datareader] ADD MEMBER [etl_service]
GO
USE [Brazilian_Ecommerce]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [etl_service]
GO
USE [Brazilian_Ecommerce]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [etl_service]
GO
use [Brazilian_Ecommerce];
GO
USE [Credit]
GO
CREATE USER [etl_service] FOR LOGIN [etl_service]
GO
USE [Credit]
GO
ALTER USER [etl_service] WITH DEFAULT_SCHEMA=[etl_service]
GO
USE [Credit]
GO
CREATE SCHEMA [etl_service] AUTHORIZATION [etl_service]
GO
USE [Credit]
GO
ALTER ROLE [db_datareader] ADD MEMBER [etl_service]
GO
USE [Credit]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [etl_service]
GO
USE [Credit]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [etl_service]
GO
use [master]
GO
GRANT ADMINISTER BULK OPERATIONS TO [etl_service]
GO
use [master]
GO
GRANT CONNECT ANY DATABASE TO [etl_service]
GO
use [master]
GO
GRANT CONNECT SQL TO [etl_service]
GO
use [master]
GO
GRANT IMPERSONATE ANY LOGIN TO [etl_service]
GO
use [master]
GO
GRANT VIEW ANY DATABASE TO [etl_service]
GO
use [master]
GO
GRANT VIEW ANY DEFINITION TO [etl_service]
GO
use [master]
GO
GRANT VIEW SERVER STATE TO [etl_service]
GO
