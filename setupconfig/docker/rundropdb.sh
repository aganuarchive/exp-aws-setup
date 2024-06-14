echo $1
mysql --host=$1 --port=3306 --user=admin --password=ramrao11 < /tmp/dropdb.sql


