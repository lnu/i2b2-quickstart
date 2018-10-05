load_demo_data(){

	#BASE="/home/ec2-user/i2b2-install"
	BASE=$1
	DATA_BASE="$BASE/unzipped_packages/i2b2-data-sqlserver"

	PARG=$2
	IP=$3

	cd "$DATA_BASE/edu.harvard.i2b2.data/Release_1-7/NewInstall/Crcdata/"
	echo ">>>>>pwd:$PWD IP:$IP"
	#local POPTS="dbname=i2b2 options=--search_path='i2b2demodata'"
	
	for x in scripts/*sqlserver*.sql; do echo $x;/opt/mssql-tools/bin/sqlcmd  -U i2b2demodata -P demouser1! -S 0.0.0.0,5433 -i $x ;done;

    for x in scripts/procedures/sqlserver/*.sql; do echo $x;/opt/mssql-tools/bin/sqlcmd -U i2b2demodata -P demouser1! -S 0.0.0.0,5433 -i $x ;done;
	for x in scripts/sqlserver/*.sql; do echo $x;/opt/mssql-tools/bin/sqlcmd -U i2b2demodata -P demouser1! -S 0.0.0.0,5433 -i $x ;done;

	#HIVEDATA
	cd "$DATA_BASE/edu.harvard.i2b2.data/Release_1-7/NewInstall/Hivedata/"
	for x in "create_sqlserver_i2b2hive_tables.sql" "work_db_lookup_sqlserver_insert_data.sql" "ont_db_lookup_sqlserver_insert_data.sql" "im_db_lookup_sqlserver_insert_data.sql" "crc_db_lookup_sqlserver_insert_data.sql"
	do
	echo $x;
	/opt/mssql-tools/bin/sqlcmd  -U i2b2hive -P demouser1! -S 0.0.0.0,5433 -i scripts/$x;
	done;

	#PMDATA
	cd ../Pmdata/
	for x in "create_sqlserver_i2b2pm_tables.sql" "create_sqlserver_triggers.sql"
	do 
	echo $x;
	/opt/mssql-tools/bin/sqlcmd -U i2b2pm -P demouser1! -S 0.0.0.0,5433 -i scripts/$x ;
	done;
	cat scripts/pm_access_insert_data.sql| sed "s/localhost:9090/$IP/" > scripts/pm_access_insert_data.sql.tmp
	/opt/mssql-tools/bin/sqlcmd -U i2b2pm -P demouser1! -S 0.0.0.0,5433 -i scripts/pm_access_insert_data.sql.tmp;

	#METADATA
	cd "$DATA_BASE/edu.harvard.i2b2.data/Release_1-7/NewInstall/Metadata/"
	for x in scripts/*sqlserver*; do echo $x; /opt/mssql-tools/bin/sqlcmd  -U i2b2metadata -P demouser1! -S 0.0.0.0,5433 -i $x;done;
	for x in demo/scripts/*.sql; do echo $x; /opt/mssql-tools/bin/sqlcmd  -U i2b2metadata -P demouser1! -S 0.0.0.0,5433 -i $x;done;
	for x in demo/scripts/sqlserver/*; do echo $x; /opt/mssql-tools/bin/sqlcmd  -U i2b2metadata -P demouser1! -S 0.0.0.0,5433 -i $x;done;

	#WORKDATA
	cd "$DATA_BASE/edu.harvard.i2b2.data/Release_1-7/NewInstall/Workdata/";
	echo 'create_sqlserver_i2b2workdata_tables.sql'
	/opt/mssql-tools/bin/sqlcmd  -U i2b2workdata -P demouser1! -S 0.0.0.0,5433 -i scripts/create_sqlserver_i2b2workdata_tables.sql;
	echo 'workplace_access_demo_insert_data.sql'
	/opt/mssql-tools/bin/sqlcmd  -U i2b2workdata -P demouser1! -S 0.0.0.0,5433 -i scripts/workplace_access_demo_insert_data.sql;

	#IMDATA
	cd "$DATA_BASE/edu.harvard.i2b2.data/Release_1-7/NewInstall/Imdata/";
	echo 'im_create_tables_sqlserver.sql'
	/opt/mssql-tools/bin/sqlcmd  -U i2b2imdata -P demouser1! -S 0.0.0.0,5433 -i scripts/im_create_tables_sqlserver.sql;
	echo 'workplace_access_demo_insert_data.sql'
	for x in scripts/sqlserver/*; do echo $x; /opt/mssql-tools/bin/sqlcmd  -U i2b2imdata -P demouser1! -S 0.0.0.0,5433 -i $x;done;

	# echo 'updating lookup'
	# /opt/mssql-tools/bin/sqlcmd  -U i2b2hive -P demouser1! -S 0.0.0.0,5433 -Q "update crc_db_lookup set c_db_fullschema = 'i2b2demodata';\
	# update work_db_lookup set c_db_fullschema = 'i2b2workdata';\
	# update ont_db_lookup set c_db_fullschema = 'i2b2metadata';
	# ";
}

create_db_schema(){
	PARG=$2
	echo "$PARG"
	#/opt/mssql-tools/bin/sqlcmd $PARG -Q "drop database i2b2"
	/opt/mssql-tools/bin/sqlcmd $PARG -i $1/scripts/sqlserver/create_schemas.sql
}
