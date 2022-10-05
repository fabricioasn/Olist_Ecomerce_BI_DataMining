BACKUP DATABASE [Brazilian_Ecommerce_DW] TO  DISK = N'D:\BACKUP\Brazilian_Ecommerce_DW.bak' WITH NAME = N'Brazilian_Ecommerce_DW-Full Database Backup', SKIP, COMPRESSION,  STATS = 10, CHECKSUM
GO
declare @backupSetId as int
select @backupSetId = position from msdb..backupset where database_name=N'Brazilian_Ecommerce_DW' and backup_set_id=(select max(backup_set_id) from msdb..backupset where database_name=N'Brazilian_Ecommerce_DW' )
if @backupSetId is null begin raiserror(N'Verify failed. Backup information for database ''Brazilian_Ecommerce_DW'' not found.', 16, 1) end
RESTORE VERIFYONLY FROM  DISK = N'D:\BACKUP\Brazilian_Ecommerce_DW.bak' WITH  FILE = @backupSetId
GO

/*
10 percent processed.
20 percent processed.
30 percent processed.
40 percent processed.
50 percent processed.
60 percent processed.
71 percent processed.
81 percent processed.
91 percent processed.
100 percent processed.
Processed 7560 pages for database 'Brazilian_Ecommerce_DW', file 'Brazilian_Ecommerce_dw_data' on file 1.
Processed 48 pages for database 'Brazilian_Ecommerce_DW', file 'Brazilian_Ecommerce_dw_indexes' on file 1.
Processed 1 pages for database 'Brazilian_Ecommerce_DW', file 'Brazilian_Ecommerce_dw_log' on file 1.
BACKUP DATABASE successfully processed 7609 pages in 0.384 seconds (154.788 MB/sec).
The backup set on file 1 is valid.

Completion time: 2022-09-22T02:43:15.5589461-03:00
*/