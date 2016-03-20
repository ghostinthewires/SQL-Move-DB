# Use ALTER DATABASE to Move Databases #

You can use the ALTER DATABASE statement to move any system or user-defined database files except for Resource database files.To move files, you specify the current logical name of the file and the new file path, which includes the new file name.You can move only one file at a time in this manner. 

## Get the logical name of the data and log files associated with the database ##

Use **MoveDBScript.sql** to find these. I have split this script into two sections:

* **SELECT name, physical_name FROM sys.master_files**
 
 * This retrieves a list of all your database logical names
 
* **SELECT name, physical_name AS CurrentLocation, state_desc
FROM sys.master_files
WHERE database_id = DB_ID(N'MYDATABASE');**

 * This concentrates on one specific database
 

## Taking the DB offline and moving the files ##
 
Use **MoveDBScript.sql** to take the DB offline, point to the new location and bring the DB back online.

* **ALTER DATABASE MYDATABASE SET SINGLE_USER WITH ROLLBACK IMMEDIATE;**

 * This sets the database to SINGLE_USER mode to obtain exclusive access
 
* **ALTER DATABASE MYDATABASE SET OFFLINE;**

 * This sets the database to be offline
 
* **USE master; 
ALTER DATABASE MYDATABASE
MODIFY FILE (name='MYDATABASELOGICAL'
             ,filename='P:\MYDATABASE.mdf');**

 * This modifies where SQL will look for the database data (The script also includes the script for the log file)
 

## IMPORTANT - MOVING THE FILES ## 
 
Now here you must manually move the files from their current location to the new location (and remember to rename them manually if you changed them in the MODIFY FILE command)


## Bringing the DB back online ## 

* **ALTER DATABASE MYDATABASE SET ONLINE;**

 * This sets the database to be online
 
* **ALTER DATABASE MYDATABASE SET MULTI_USER;**

 * This sets the database to MULTI_USER mode
