aws s3 cp s3://expjune2022store/expbackup/exprdsbackup.sql /home/ubuntu/expbackup/exprdsbackup.sql --acl bucket-owner-full-control
sudo sed -i 's/SET @MYSQLDUMP_TEMP_/-- SET @MYSQLDUMP_TEMP_/g' /home/ubuntu/expbackup/exprdsbackup.sql
sudo sed -i 's/SET @@SESSION.SQL_/-- SET @@SESSION.SQL_/g' /home/ubuntu/expbackup/exprdsbackup.sql
sudo sed -i 's/SET @@GLOBAL.GTID_/-- SET @@GLOBAL.GTID_/g' /home/ubuntu/expbackup/exprdsbackup.sql
sudo sed -i 's/SET @@SESSION.SQL_LOG/-- SET @@SESSION.SQL_LOG/g' /home/ubuntu/expbackup/exprdsbackup.sql
sudo sed -i "s/DEFINER='admin'@'%'/ /g" /home/ubuntu/expbackup/exprdsbackup.sql
export DBURL=`python3.8 -c "import processDynamoDBConfig ; processDynamoDBConfig.getDBEndpoint()"`
mysql -h $DBURL -u admin -pramrao11 < /home/ubuntu/expbackup/exprdsbackup.sql
