#Run this batch from EC2

aws cloudformation create-stack --stack-name myexpqueue --template-body file://./ExpQueueNS  --capabilities CAPABILITY_AUTO_EXPAND  
aws cloudformation wait stack-create-complete --stack-name myexpqueue

aws cloudformation create-stack --stack-name myexplambda --template-body file://./ExpLambdasWithNS-VPCConnect --capabilities CAPABILITY_AUTO_EXPAND  
aws cloudformation wait stack-create-complete --stack-name myexplambda

aws cloudformation create-stack --stack-name myexpcodebuildNS --template-body file://./ExpCodeBuildWithNS --capabilities CAPABILITY_AUTO_EXPAND      
aws cloudformation wait stack-create-complete --stack-name myexpcodebuildNS

aws cloudformation create-stack --stack-name myexps3NS2 --template-body file://./ExpS3Script2   --capabilities CAPABILITY_AUTO_EXPAND
aws cloudformation wait stack-create-complete --stack-name myexps3NS2

aws cloudformation create-stack --stack-name myexps3NS3 --template-body file://./ExpS3Script3   --capabilities CAPABILITY_AUTO_EXPAND
aws cloudformation wait stack-create-complete --stack-name myexps3NS3

aws cloudformation update-stack --stack-name myexps3NS --template-body file://./ExpS3Script4   --capabilities CAPABILITY_AUTO_EXPAND
aws cloudformation wait stack-create-complete --stack-name myexps3NS4

aws cloudformation create-stack --stack-name myexpsns --template-body file://./ExpSNS --capabilities CAPABILITY_AUTO_EXPAND    
aws cloudformation wait stack-create-complete --stack-name myexpsns

aws cloudformation create-stack --stack-name myexpsnspolicy --template-body file://./ExpSNSPolicy  --capabilities CAPABILITY_AUTO_EXPAND      
aws cloudformation wait stack-create-complete --stack-name myexpsnspolicy

aws cloudformation create-stack --stack-name queueevent --template-body file://./ExpQueueEvent --capabilities CAPABILITY_AUTO_EXPAND
aws cloudformation wait stack-create-complete --stack-name queueevent

aws cloudformation create-stack --stack-name myexpscheduler --template-body file://./ExpSchedulerWithNS   --capabilities CAPABILITY_AUTO_EXPAND        
aws cloudformation wait stack-create-complete --stack-name myexpscheduler

aws cloudformation create-stack --stack-name ExpSM --template-body file://./ExpSM   --capabilities CAPABILITY_AUTO_EXPAND    

aws cloudformation create-stack --stack-name ExpEBAccount --template-body file://./ExpEBAccount   --capabilities CAPABILITY_AUTO_EXPAND    

aws cloudformation create-stack --stack-name ExpAccountEBScheduler --template-body file://./ExpAccountEBScheduler   --capabilities CAPABILITY_AUTO_EXPAND    


aws cloudformation create-stack --stack-name myexprds --template-body file://./ExpRDSPrivate    
aws cloudformation wait stack-create-complete --stack-name myexprds

python -c "import processDynamoDBConfig ; processDynamoDBConfig.updateDBEndpoint()"

aws cloudformation create-stack --stack-name myexpapi --template-body file://./ExpApi-CORS   --capabilities CAPABILITY_AUTO_EXPAND           
aws cloudformation wait stack-create-complete --stack-name myexpapi

aws cloudformation create-stack --stack-name myexpapi2 --template-body file://./ExpApi-CORS2  --capabilities CAPABILITY_AUTO_EXPAND           
aws cloudformation wait stack-create-complete --stack-name myexpapi2

aws cloudformation create-stack --stack-name myexpapifnp --template-body file://./ExpApiFnPermission   --capabilities CAPABILITY_AUTO_EXPAND             
aws cloudformation wait stack-create-complete --stack-name myexpapifnp

aws cloudformation create-stack --stack-name ExpLambdasNodeJS --template-body file://./ExpLambdasNodeJS   --capabilities CAPABILITY_AUTO_EXPAND    

aws cloudformation create-stack --stack-name ExpCodeBuildNodeJS --template-body file://./ExpCodeBuildNodeJS   --capabilities CAPABILITY_AUTO_EXPAND    

aws cloudformation create-stack --stack-name ExpFnPermission2 --template-body file://./ExpFnPermission2  --capabilities CAPABILITY_AUTO_EXPAND             

aws cloudformation create-stack --stack-name ExpLambdas2 --template-body file://./ExpLambdas2  --capabilities CAPABILITY_AUTO_EXPAND             
aws cloudformation create-stack --stack-name ExpLambdas3 --template-body file://./ExpLambdas3  --capabilities CAPABILITY_AUTO_EXPAND             
aws cloudformation create-stack --stack-name ExpCodeBuild2 --template-body file://./ExpCodeBuild2   --capabilities CAPABILITY_AUTO_EXPAND    

aws cloudformation create-stack --stack-name expapi3 --template-body file://./ExpApi-CORS3  --capabilities CAPABILITY_AUTO_EXPAND           
aws cloudformation wait stack-create-complete --stack-name expapi3

aws cloudformation create-stack --stack-name ExpApiFnPermission2 --template-body file://./ExpApiFnPermission2   --capabilities CAPABILITY_AUTO_EXPAND    

aws lambda invoke --function-name updateFnLayers fn.log

python -c "import processDynamoDBConfig ; processDynamoDBConfig.startCodeBuild('CB-LAMBDALAYERS')"


python -c "import processDynamoDBConfig ; processDynamoDBConfig.startCodeBuild('CB-PROCESSSHOPFILE')"
python -c "import processDynamoDBConfig ; processDynamoDBConfig.startCodeBuild('CB-REGISTERSHOPFILE')"
python -c "import processDynamoDBConfig ; processDynamoDBConfig.startCodeBuild('CB-PROCESSONEFILE')"
python -c "import processDynamoDBConfig ; processDynamoDBConfig.startCodeBuild('CB-PROCESSTRNQ')"
python -c "import processDynamoDBConfig ; processDynamoDBConfig.startCodeBuild('CB-GETLOCATIONSMOBILE')"
python -c "import processDynamoDBConfig ; processDynamoDBConfig.startCodeBuild('CB-GETFILTERS')"
python -c "import processDynamoDBConfig ; processDynamoDBConfig.startCodeBuild('CB-GETITEM')"
python -c "import processDynamoDBConfig ; processDynamoDBConfig.startCodeBuild('CB-UPDATEITEM')"
python -c "import processDynamoDBConfig ; processDynamoDBConfig.startCodeBuild('CB-GETITEMSHOPRATES')"
python -c "import processDynamoDBConfig ; processDynamoDBConfig.startCodeBuild('CB-PROCESSCODEBUILD')"
python -c "import processDynamoDBConfig ; processDynamoDBConfig.startCodeBuild('CB-GETCATEGORIES')"
python -c "import processDynamoDBConfig ; processDynamoDBConfig.startCodeBuild('CB-GETCOSTCENTRES')"
python -c "import processDynamoDBConfig ; processDynamoDBConfig.startCodeBuild('CB-GETSUBITEMS')"
python -c "import processDynamoDBConfig ; processDynamoDBConfig.startCodeBuild('CB-GETITEM')"
python -c "import processDynamoDBConfig ; processDynamoDBConfig.startCodeBuild('CB-GETLOCATIONSMOBILE')"
python -c "import processDynamoDBConfig ; processDynamoDBConfig.startCodeBuild('CB-GETITEMSHOPRATES')"
python -c "import processDynamoDBConfig ; processDynamoDBConfig.startCodeBuild('CB-GETFILTERS')"
python -c "import processDynamoDBConfig ; processDynamoDBConfig.startCodeBuild('CB-UPDATEITEM')"
python -c "import processDynamoDBConfig ; processDynamoDBConfig.startCodeBuild('CB-GETMTRANS')"
python -c "import processDynamoDBConfig ; processDynamoDBConfig.startCodeBuild('CB-UPDATEMTRANS')"
python -c "import processDynamoDBConfig ; processDynamoDBConfig.startCodeBuild('CB-GETITEMSBYCATEGORY')"
python -c "import processDynamoDBConfig ; processDynamoDBConfig.startCodeBuild('CB-GETAWSRDSACCOUNTINFO')"
python -c "import processDynamoDBConfig ; processDynamoDBConfig.startCodeBuild('CB-GETAWSACCOUNTS')"
python -c "import processDynamoDBConfig ; processDynamoDBConfig.startCodeBuild('CB-SHOPRECEIPTS')"
python -c "import processDynamoDBConfig ; processDynamoDBConfig.startCodeBuild('CB-UPDATEAWSRESOURCES')"

echo "Run the next steps after codebuilds are completed"