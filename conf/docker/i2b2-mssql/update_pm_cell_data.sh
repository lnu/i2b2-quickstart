#!/bin/sh
echo ">>>Running postscript ($(pwd))"
/opt/mssql-tools/bin/sqlcmd  -U i2b2pm -P demouser1! -Q "delete from i2b2pm.dbo.pm_cell_data;"
cat pm_access_insert_data.sql| sed "s/localhost:9090/$PUBLIC_IP/" > pm_access_insert_data_sed.sql
/opt/mssql-tools/bin/sqlcmd  -U i2b2pm -P demouser1! -i pm_access_insert_data_sed.sql
