sleep 10s

#run the setup script to create th db and the schema
#hardcoded
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P P@ssw0rd -d master -i i2b2_init.sql
