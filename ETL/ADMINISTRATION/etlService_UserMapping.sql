USE [Brazilian_Ecommerce]
GO
ALTER USER [etl_service] WITH DEFAULT_SCHEMA=[dbo]
GO
USE [Brazilian_Ecommerce_DW]
GO
CREATE USER [etl_service] FOR LOGIN [etl_service]
GO
USE [Brazilian_Ecommerce_DW]
GO
ALTER USER [etl_service] WITH DEFAULT_SCHEMA=[dbo]
GO
USE [Credit]
GO
ALTER USER [etl_service] WITH DEFAULT_SCHEMA=[dbo]
GO


USE [master]
GO
CREATE LOGIN [etl_service] WITH PASSWORD=N'######', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER SERVER ROLE [bulkadmin] ADD MEMBER [etl_service]



USE [Brazilian_Ecommerce_DW]
EXEC sp_change_users_login 'Report'


USE [Brazilian_Ecommerce_DW]
EXEC sp_change_users_login 'Auto_Fix', 'etl_service' 
GO

/*
The row for user 'etl_service' will be fixed by updating its login link to a login already in existence.
The number of orphaned users fixed by updating users was 1.
The number of orphaned users fixed by adding new logins and then updating users was 0.

Completion time: 2022-09-22T01:12:51.2634504-03:00
*/

USE [Credit]
EXEC sp_change_users_login 'Report'

USE [Credit]
EXEC sp_change_users_login 'Auto_Fix', 'etl_service' 
GO

/*
The row for user 'etl_service' will be fixed by updating its login link to a login already in existence.
The number of orphaned users fixed by updating users was 1.
The number of orphaned users fixed by adding new logins and then updating users was 0.

Completion time: 2022-09-22T01:13:37.7977547-03:00
*/



USE [Brazilian_Ecommerce]
EXEC sp_change_users_login 'Report'


USE [Brazilian_Ecommerce]
EXEC sp_change_users_login 'Auto_Fix', 'etl_service' 
GO

/*
The row for user 'etl_service' will be fixed by updating its login link to a login already in existence.
The number of orphaned users fixed by updating users was 1.
The number of orphaned users fixed by adding new logins and then updating users was 0.

Completion time: 2022-09-22T01:14:38.4475778-03:00
*/