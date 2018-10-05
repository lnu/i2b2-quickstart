use master;
go
--create database i2b2;
--go
create database i2b2demodata;
go
create database i2b2hive;
go
create database i2b2imdata;
go
create database i2b2metadata;
go
create database i2b2pm;
go
create database i2b2workdata;
go

use i2b2demodata;
go
CREATE LOGIN i2b2demodata  WITH PASSWORD = 'demouser1!',DEFAULT_DATABASE=i2b2demodata;
go
CREATE USER i2b2demodata for login i2b2demodata  WITH DEFAULT_SCHEMA=[dbo];
go
EXEC sp_addrolemember N'db_owner', N'i2b2demodata';
go

use i2b2hive;
go
CREATE LOGIN i2b2hive  WITH PASSWORD = 'demouser1!',DEFAULT_DATABASE=i2b2hive;
go
CREATE USER i2b2hive for login i2b2hive  WITH DEFAULT_SCHEMA=[dbo];
go
EXEC sp_addrolemember N'db_owner', N'i2b2hive';
go

use i2b2imdata;
go
CREATE LOGIN i2b2imdata  WITH PASSWORD = 'demouser1!',DEFAULT_DATABASE=i2b2imdata;
go
CREATE USER i2b2imdata for login i2b2imdata  WITH DEFAULT_SCHEMA=[dbo];
go
EXEC sp_addrolemember N'db_owner', N'i2b2imdata';
go

use i2b2metadata;
go
CREATE LOGIN i2b2metadata  WITH PASSWORD = 'demouser1!',DEFAULT_DATABASE=i2b2metadata;
go
CREATE USER i2b2metadata for login i2b2metadata  WITH DEFAULT_SCHEMA=[dbo];
go
EXEC sp_addrolemember N'db_owner', N'i2b2metadata';
go

use i2b2pm;
go
CREATE LOGIN i2b2pm  WITH PASSWORD = 'demouser1!',DEFAULT_DATABASE=i2b2pm;
go
CREATE USER i2b2pm for login i2b2pm  WITH DEFAULT_SCHEMA=[dbo];
go
EXEC sp_addrolemember N'db_owner', N'i2b2pm';
go

use i2b2workdata;
go
CREATE LOGIN i2b2workdata  WITH PASSWORD = 'demouser1!',DEFAULT_DATABASE=i2b2workdata;
go
CREATE USER i2b2workdata for login i2b2workdata  WITH DEFAULT_SCHEMA=[dbo];
go
EXEC sp_addrolemember N'db_owner', N'i2b2workdata';
go