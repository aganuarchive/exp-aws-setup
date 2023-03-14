aws s3 cp s3://expjune2022store/expbackup/exprdsbackup.sql /home/ubuntu/expbackup/exprdsbackup.sql --acl bucket-owner-full-control
sudo sed -i 's/SET @MYSQLDUMP_TEMP_/-- SET @MYSQLDUMP_TEMP_/g' exprdsbackup.sql
sudo sed -i 's/SET @@SESSION.SQL_/-- SET @@SESSION.SQL_/g' exprdsbackup.sql
sudo sed -i 's/SET @@GLOBAL.GTID_/-- SET @@GLOBAL.GTID_/g' exprdsbackup.sql
sudo sed -i 's/SET @@SESSION.SQL_LOG/-- SET @@SESSION.SQL_LOG/g' exprdsbackup.sql
sudo sed -i "s/DEFINER='admin'@'%'/ /g" exprdsbackup.sql
export DBURL=`python3.8 -c "import processDynamoDBConfig ; processDynamoDBConfig.getDBEndpoint()"`
mysql -h $DBURL admin -p < /home/ubuntu/expbackup/exprdsbackup.sql
