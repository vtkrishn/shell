#!/bin/sh
#execute SQL command
sql_query=$1
ade sqlplus << EOF
connect username/password@hostname:port/sid
SET SERVEROUTPUT ON
SET LINESIZE 30
spool /tmp/spool.csv
$sql_query
spool off
exit;
EOF
