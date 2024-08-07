#Run this batch from EC2
if [ "$1" == "" ]; then
  echo "NO BUCKET NAME SPECIFIED"
  exit
fi

source checkaws
result=$?
echo "Result -> "$result
if [ $result -ne 0 ]; then
  exit
fi

aws cloudformation create-stack --stack-name myexpdynamo --template-body file://./ExpDynamoScript  --capabilities CAPABILITY_AUTO_EXPAND 
aws cloudformation wait stack-create-complete --stack-name myexpdynamo

aws cloudformation create-stack --stack-name myexpdynamo2 --template-body file://./ExpDynamoScript2  --capabilities CAPABILITY_AUTO_EXPAND 

python C:\Applications\PythonApps\awstest\venv\processDynamoDBConfig.py


aws cloudformation create-stack --stack-name myexps3NS --template-body file://./ExpS3Script   --parameters ParameterKey=BUCKETNAME,ParameterValue=$1 --capabilities CAPABILITY_AUTO_EXPAND
aws cloudformation wait stack-create-complete --stack-name myexps3NS

aws dynamodb put-item --table-name RESTABLE --item "{\"RESKEY\" : { \"S\":\"S3BUCKET\"}, \"RESNAME\" : {\"S\" : \"$1\"}, \"RESTYPE\" : {\"S\" : \"S3\"}}"

aws cloudformation create-stack --stack-name myexplambdaCustomFnSNS --template-body file://./ExpLambdaCustomFnSNS --capabilities CAPABILITY_AUTO_EXPAND    
aws cloudformation wait stack-create-complete --stack-name myexplambdaCustomFnSNS

aws cloudformation create-stack --stack-name myexpcodebuild --template-body file://./ExpCodeBuild    
aws cloudformation wait stack-create-complete --stack-name myexpcodebuild

aws s3 cp stacks s3://$1/stacks --recursive
aws s3 cp docker s3://$1/docker --recursive
aws s3 cp rdsimport s3://$1/rdsimport --recursive


python -c "import processDynamoDBConfig ; processDynamoDBConfig.startCodeBuild('CB-LAMBDALAYERS')"
python -c "import processDynamoDBConfig ; processDynamoDBConfig.startCodeBuild('CB-UPDATEFNLAYERS')"
python -c "import processDynamoDBConfig ; processDynamoDBConfig.startCodeBuild('CB-CUSTOMFNSNS')"
python -c "import processDynamoDBConfig ; processDynamoDBConfig.startCodeBuild('CB-FNMACRO2')"
python -c "import processDynamoDBConfig ; processDynamoDBConfig.startCodeBuild('CB-FNMACROS3')"
aws lambda invoke --function-name updateFnLayers fn.log

#aws s3 cp stacks s3://$1/stacks --recursive

echo "Run the next batch after codebuilds are completed"
