USE [AdventureWorksDW2019]
GO
ALTER USER [bi_reader] WITH DEFAULT_SCHEMA=[dbo]
GO
USE [AdventureWorksDW2019]
GO
ALTER ROLE [db_datareader] ADD MEMBER [bi_reader]
GO
USE [AdventureWorksDW2019]
GO
ALTER ROLE [db_owner] DROP MEMBER [bi_reader]
GO
USE [Auxilio_Emergencial]
GO
ALTER ROLE [db_datawriter] DROP MEMBER [bi_reader]
GO
USE [Auxilio_Emergencial]
GO
ALTER ROLE [db_ddladmin] DROP MEMBER [bi_reader]
GO
USE [Brazilian_Ecommerce]
GO
CREATE USER [bi_reader] FOR LOGIN [bi_reader]
GO
USE [Brazilian_Ecommerce]
GO
ALTER USER [bi_reader] WITH DEFAULT_SCHEMA=[dbo]
GO
USE [Brazilian_Ecommerce]
GO
ALTER ROLE [db_datareader] ADD MEMBER [bi_reader]
GO
USE [Brazilian_Ecommerce_DW]
GO
CREATE USER [bi_reader] FOR LOGIN [bi_reader]
GO
USE [Brazilian_Ecommerce_DW]
GO
ALTER USER [bi_reader] WITH DEFAULT_SCHEMA=[dbo]
GO
USE [Brazilian_Ecommerce_DW]
GO
ALTER ROLE [db_datareader] ADD MEMBER [bi_reader]
GO
USE [Credit]
GO
ALTER USER [bi_reader] WITH DEFAULT_SCHEMA=[dbo]
GO
USE [WideWorldImportersDW]
GO
ALTER USER [bi_reader] WITH DEFAULT_SCHEMA=[dbo]
GO
USE [WideWorldImportersDW]
GO
ALTER ROLE [db_datareader] ADD MEMBER [bi_reader]
GO
