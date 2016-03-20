/*SELECT name, physical_name AS CurrentLocation, state_desc
FROM sys.master_files
WHERE database_id = DB_ID(N'MYDATABASE'); */

--SELECT name, physical_name FROM sys.master_files

ALTER DATABASE MYDATABASE SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

ALTER DATABASE MYDATABASE SET OFFLINE;

USE master; --do this all from the master
ALTER DATABASE MYDATABASE
MODIFY FILE (name='MYDATABASELOGICAL'
             ,filename='P:\MYDATABASE.mdf'); --Filename is new location
             
USE master; --do this all from the master
ALTER DATABASE MYDATABASE
MODIFY FILE (name='MYDATABASELOGICAL_log'
             ,filename='L:\MYDATABASE_1.log'); --Filename is new location
             

-- Now physically move database & log files

ALTER DATABASE MYDATABASE SET ONLINE;

ALTER DATABASE MYDATABASE SET MULTI_USER;