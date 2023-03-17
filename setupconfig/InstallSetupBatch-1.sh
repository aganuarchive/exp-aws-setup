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

aws cloudformation create-stack --stack-name mytestdynamo --template-body file://./ExpDynamoScript  
aws cloudformation wait stack-create-complete --stack-name mytestdynamo

python3.8 processDynamoDBConfig.py


aws cloudformation create-stack --stack-name myexps3NS --template-body file://./ExpS3Script   --parameters ParameterKey=BUCKETNAME,ParameterValue=$1 --capabilities CAPABILITY_AUTO_EXPAND
aws cloudformation wait stack-create-complete --stack-name myexps3NS

aws dynamodb put-item --table-name RESTABLE --item "{\"RESKEY\" : { \"S\":\"S3BUCKET\"}, \"RESNAME\" : {\"S\" : \"$1\"}, \"RESTYPE\" : {\"S\" : \"S3\"}}"

aws cloudformation create-stack --stack-name myexplambdaCustomFnSNS --template-body file://./ExpLambdaCustomFnSNS --capabilities CAPABILITY_AUTO_EXPAND    
aws cloudformation wait stack-create-complete --stack-name myexplambdaCustomFnSNS

aws cloudformation create-stack --stack-name myexpcodebuild --template-body file://./ExpCodeBuild    
aws cloudformation wait stack-create-complete --stack-name myexpcodebuild

aws s3 cp stacks s3://$1/stacks --recursive

aws codebuild start-build --project-name CB-LAMBDALAYERS
aws codebuild start-build --project-name CB-UPDATEFNLAYERS
aws codebuild start-build --project-name CB-CUSTOMFNSNS

echo "Run the next batch after codebuilds are completed"
