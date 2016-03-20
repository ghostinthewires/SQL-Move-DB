# Use ALTER DATABASE to Move Databases #

You can use the ALTER DATABASE statement to move any system or user-defined database files except for Resource database files.To move files, you specify the current logical name of the file and the new file path, which includes the new file name.You can move only one file at a time in this manner. 

## Get the logical name of the data and log files associated with the database ##

Use **GetLogicalName.sql** to find these. I have split this script into two sections:

* **SELECT name, physical_name FROM sys.master_files**
 
 * This retrieves a list of all your database logical names
 
* **SELECT name, physical_name AS CurrentLocation, state_desc
FROM sys.master_files
WHERE database_id = DB_ID(N'MYDATABASE');**

 * This concentrates on one specific database

 