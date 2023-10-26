#Run this batch from EC2

aws cloudformation create-stack --stack-name myexpqueue --template-body file://./ExpQueueNS  --capabilities CAPABILITY_AUTO_EXPAND  
aws cloudformation wait stack-create-complete --stack-name myexpqueue

aws cloudformation create-stack --stack-name myexplambda --template-body file://./ExpLambdasWithNS  --capabilities CAPABILITY_AUTO_EXPAND  
aws cloudformation wait stack-create-complete --stack-name myexplambda

aws cloudformation create-stack --stack-name myexpcodebuildNS --template-body file://./ExpCodeBuildWithNS --capabilities CAPABILITY_AUTO_EXPAND      
aws cloudformation wait stack-create-complete --stack-name myexpcodebuildNS

aws cloudformation update-stack --stack-name myexps3NS --template-body file://./ExpS3Script-1   --capabilities CAPABILITY_AUTO_EXPAND
aws cloudformation wait stack-create-complete --stack-name myexps3NS1


aws cloudformation create-stack --stack-name myexpsns --template-body file://./ExpSNS --capabilities CAPABILITY_AUTO_EXPAND    
aws cloudformation wait stack-create-complete --stack-name myexpsns

aws cloudformation create-stack --stack-name myexpsnspolicy --template-body file://./ExpSNSPolicy  --capabilities CAPABILITY_AUTO_EXPAND      
aws cloudformation wait stack-create-complete --stack-name myexpsnspolicy

aws cloudformation create-stack --stack-name myexpscheduler --template-body file://./ExpSchedulerWithNS   --capabilities CAPABILITY_AUTO_EXPAND        
aws cloudformation wait stack-create-complete --stack-name myexpscheduler

aws cloudformation create-stack --stack-name myexprds --template-body file://./ExpRDS    
aws cloudformation wait stack-create-complete --stack-name myexprds

python3.8 -c "import processDynamoDBConfig ; processDynamoDBConfig.updateDBEndpoint()"

aws cloudformation create-stack --stack-name myexpapi --template-body file://./ExpApi-CORS   --capabilities CAPABILITY_AUTO_EXPAND           
aws cloudformation wait stack-create-complete --stack-name myexpapi

aws cloudformation create-stack --stack-name myexpapifnp --template-body file://./ExpApiFnPermission   --capabilities CAPABILITY_AUTO_EXPAND             
aws cloudformation wait stack-create-complete --stack-name myexpapifnp

aws lambda invoke --function-name updateFnLayers fn.log

python3.8 -c "import processDynamoDBConfig ; processDynamoDBConfig.startCodeBuild('CB-LAMBDALAYERS')"


python3.8 -c "import processDynamoDBConfig ; processDynamoDBConfig.startCodeBuild('CB-PROCESSSHOPFILE')"
python3.8 -c "import processDynamoDBConfig ; processDynamoDBConfig.startCodeBuild('CB-REGISTERSHOPFILE')"
python3.8 -c "import processDynamoDBConfig ; processDynamoDBConfig.startCodeBuild('CB-PROCESSONEFILE')"
python3.8 -c "import processDynamoDBConfig ; processDynamoDBConfig.startCodeBuild('CB-PROCESSTRNQ')"
python3.8 -c "import processDynamoDBConfig ; processDynamoDBConfig.startCodeBuild('CB-GETLOCATIONSMOBILE')"
python3.8 -c "import processDynamoDBConfig ; processDynamoDBConfig.startCodeBuild('CB-GETFILTERS')"
python3.8 -c "import processDynamoDBConfig ; processDynamoDBConfig.startCodeBuild('CB-GETITEM')"
python3.8 -c "import processDynamoDBConfig ; processDynamoDBConfig.startCodeBuild('CB-UPDATEITEM')"
python3.8 -c "import processDynamoDBConfig ; processDynamoDBConfig.startCodeBuild('CB-GETITEMSHOPRATES')"
python3.8 -c "import processDynamoDBConfig ; processDynamoDBConfig.startCodeBuild('CB-PROCESSCODEBUILD')"
python3.8 -c "import processDynamoDBConfig ; processDynamoDBConfig.startCodeBuild('CB-GETCATEGORIES')"
python3.8 -c "import processDynamoDBConfig ; processDynamoDBConfig.startCodeBuild('CB-GETCOSTCENTRES')"
python3.8 -c "import processDynamoDBConfig ; processDynamoDBConfig.startCodeBuild('CB-GETSUBITEMS')"
python3.8 -c "import processDynamoDBConfig ; processDynamoDBConfig.startCodeBuild('CB-GETITEM')"
python3.8 -c "import processDynamoDBConfig ; processDynamoDBConfig.startCodeBuild('CB-GETLOCATIONSMOBILE')"
python3.8 -c "import processDynamoDBConfig ; processDynamoDBConfig.startCodeBuild('CB-GETITEMSHOPRATES')"
python3.8 -c "import processDynamoDBConfig ; processDynamoDBConfig.startCodeBuild('CB-GETFILTERS')"
python3.8 -c "import processDynamoDBConfig ; processDynamoDBConfig.startCodeBuild('CB-UPDATEITEM')"
python3.8 -c "import processDynamoDBConfig ; processDynamoDBConfig.startCodeBuild('CB-CATEGORIES')"
python3.8 -c "import processDynamoDBConfig ; processDynamoDBConfig.startCodeBuild('CB-COSTCENTRES')"
python3.8 -c "import processDynamoDBConfig ; processDynamoDBConfig.startCodeBuild('CB-SUBITEMS')"
python3.8 -c "import processDynamoDBConfig ; processDynamoDBConfig.startCodeBuild('CB-GETMTRANS')"
python3.8 -c "import processDynamoDBConfig ; processDynamoDBConfig.startCodeBuild('CB-UPDATEMTRANS')"
python3.8 -c "import processDynamoDBConfig ; processDynamoDBConfig.startCodeBuild('CB-GETITEMSBYCATEGORY')"

echo "Run the next steps after codebuilds are completed"