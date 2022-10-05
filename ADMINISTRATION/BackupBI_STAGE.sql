BACKUP DATABASE [Brazilian_Ecommerce_DW] 
TO  DISK = N'D:\BACKUP\Brazilian_Ecommerce_DW.bak' 
WITH NAME = N'Brazilian_Ecommerce_DW-Full Database Backup', COMPRESSION,  STATS = 10, CHECKSUM
GO
declare @backupSetId as int
select @backupSetId = position from msdb..backupset where database_name=N'Brazilian_Ecommerce_DW' and backup_set_id=(select max(backup_set_id) from msdb..backupset where database_name=N'Brazilian_Ecommerce_DW' )
if @backupSetId is null begin raiserror(N'Verify failed. Backup information for database ''Brazilian_Ecommerce_DW'' not found.', 16, 1) end
RESTORE VERIFYONLY FROM  DISK = N'D:\BACKUP\Brazilian_Ecommerce_DW.bak' WITH  FILE = @backupSetId,  NOUNLOAD,  NOREWIND
GO

/*
100 percent processed.
Processed 7608 pages for database 'Brazilian_Ecommerce_DW', file 'Brazilian_Ecommerce_dw_data' on file 2.
Processed 48 pages for database 'Brazilian_Ecommerce_DW', file 'Brazilian_Ecommerce_dw_indexes' on file 2.
Processed 1 pages for database 'Brazilian_Ecommerce_DW', file 'Brazilian_Ecommerce_dw_log' on file 2.
BACKUP DATABASE successfully processed 7657 pages in 0.389 seconds (153.763 MB/sec).
The backup set on file 2 is valid.

Completion time: 2022-09-22T12:47:20.3753079-03:00
*/