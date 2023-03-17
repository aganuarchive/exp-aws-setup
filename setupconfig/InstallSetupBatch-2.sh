#Run this batch from EC2
aws lambda invoke --function-name updateFnLayers fn.log

aws s3 cp stacks s3://expfeb2023store/stacks --recursive

aws cloudformation create-stack --stack-name myexpqueue --template-body file://./ExpQueueNS  --capabilities CAPABILITY_AUTO_EXPAND  
aws cloudformation wait stack-create-complete --stack-name myexpqueue

aws cloudformation create-stack --stack-name myexplambda --template-body file://./ExpLambdasWithNS  --capabilities CAPABILITY_AUTO_EXPAND  
aws cloudformation wait stack-create-complete --stack-name myexplambda

aws cloudformation create-stack --stack-name myexpcodebuildNS --template-body file://./ExpCodeBuildWithNS --capabilities CAPABILITY_AUTO_EXPAND      
aws cloudformation wait stack-create-complete --stack-name myexpcodebuildNS

aws cloudformation create-stack --stack-name myexps3NS1 --template-body file://./ExpS3Script-1   --capabilities CAPABILITY_AUTO_EXPAND
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

aws codebuild start-build --project-name CB-PROCESSSHOPFILE
aws codebuild start-build --project-name CB-REGISTERSHOPFILE
aws codebuild start-build --project-name CB-PROCESSONEFILE
aws codebuild start-build --project-name CB-PROCESSTRNQ
aws codebuild start-build --project-name CB-GETLOCATIONSMOBILE
aws codebuild start-build --project-name CB-GETFILTERS
aws codebuild start-build --project-name CB-GETITEM
aws codebuild start-build --project-name CB-UPDATEITEM
aws codebuild start-build --project-name CB-GETITEMSHOPRATES
aws codebuild start-build --project-name CB-PROCESSCODEBUILD
aws codebuild start-build --project-name CB-GETCATEGORIES
aws codebuild start-build --project-name CB-GETCOSTCENTRES
aws codebuild start-build --project-name CB-GETSUBITEMS
aws codebuild start-build --project-name CB-GETITEM
aws codebuild start-build --project-name CB-GETLOCATIONSMOBILE
aws codebuild start-build --project-name CB-GETITEMSHOPRATES
aws codebuild start-build --project-name CB-GETFILTERS
aws codebuild start-build --project-name CB-UPDATEITEM
aws codebuild start-build --project-name CB-CATEGORIES
aws codebuild start-build --project-name CB-COSTCENTRES
aws codebuild start-build --project-name CB-SUBITEMS

echo "Run the next steps after codebuilds are completed"