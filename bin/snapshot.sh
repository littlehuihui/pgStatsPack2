#!/bin/bash

#db call to get database name

PSQL="psql -q"

pushd `dirname $0` > /dev/null

txt='cron based snapshot'

for dbname in `$PSQL -t -f "../sql/db_name.sql" `
do
	echo "Results for database ${dbname}"
	$PSQL -d "${dbname}" -c "select pgstatspack_snap('$txt');"
	echo ""
	echo ""
done 

popd > /dev/null
