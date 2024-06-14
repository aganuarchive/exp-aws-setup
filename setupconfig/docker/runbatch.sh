#!/bin/bash
export SHELL=/bin/bash
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
cd /home/ubuntu
tablename="EXPFLAGS"
ls > dir.log
s3key=`aws dynamodb get-item --table-name $tablename --key '{"FLAGNAME" : {"S" : "RDSIMPORT"}}' --projection-expression "#T" --expression-attribute-names '{"#T" : "S3KEY"}' | grep '"S":'`
echo $s3key
s3key=${s3key#*:}
#s3key=`awk -F' ' '{print $2}' <<< $s3key`
echo $s3key
#s3key=`sed 's/\"/ /g' <<< $s3key`
s3key=${s3key#*\"}
#s3key=`${s3key:0:${#s3key}-1}`
echo $s3key
s3key=${s3key%\"*}
echo $s3key
result=`aws dynamodb get-item --table-name $tablename --key '{"FLAGNAME" : {"S" : "RDSIMPORT"}}' --projection-expression "#T" --expression-attribute-names '{"#T" : "STATUS"}' | grep '"S":'`
echo $result
status=${result#*:}
#status=`awk -F':' '{print $2}' <<< $result`
echo $status
if [ $status = '"DUMPREADY"' ] 
then 
   dburl=`aws dynamodb get-item --table-name RESTABLE --key '{"RESKEY" : {"S" : "DBURL"}}' --projection-expression "#T" --expression-attribute-names '{"#T" : "RESNAME"}' | grep '"S":'`
   echo $dburl
#   dburl=`sed 's/\"/ /g' <<< $dburl`
   dburl=${dburl#*:}
   dburl=${dburl#*\"}
   echo $dburl
#   dburl=`awk -F':' '{print $2}' <<< $dburl`
   dburl=${dburl%\"*}
   echo $dburl
   #dburl=`sed 's/ //g' <<< $dburl`
   #echo "$dburl"
   echo "START DB IMPORT"
   aws s3 cp $s3key ./dump.sql
   #sh modifydump.sh dump.sql
   aws dynamodb update-item --table-name $tablename --key '{"FLAGNAME" : {"S" : "RDSIMPORT"}}' --update-expression "SET #T = :t" --expression-attribute-names '{"#T" : "STATUS"}' --expression-attribute-values '{":t" : {"S" : "IMPORTSTARTED"}}'
   mysql --host=$dburl --port=3306 --user=admin --password=ramrao11 < DUMP.sql
   aws dynamodb update-item --table-name $tablename --key '{"FLAGNAME" : {"S" : "RDSIMPORT"}}' --update-expression "SET #T = :t" --expression-attribute-names '{"#T" : "STATUS"}' --expression-attribute-values '{":t" : {"S" : "IMPORTDONE"}}'
else
   echo "NO ACTION"
fi

