-- use master;
-- go
-- create database $(I2B2_DB);
-- go
-- use $(I2B2_DB);
-- go
-- CREATE LOGIN $(I2B2_DB_USER) WITH PASSWORD = '$(I2B2_DB_PWD)',DEFAULT_DATABASE=$(I2B2_DB);  
-- GO  
-- CREATE USER $(I2B2_DB_USER) for login $(I2B2_DB_USER)  WITH DEFAULT_SCHEMA=[dbo];
-- go
-- EXEC sp_addrolemember N'db_owner', N'$(I2B2_DB_USER)';
-- go