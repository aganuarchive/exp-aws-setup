-- github token :  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
-- AWS CLI commands
aws cloudformation delete-stack --stack-name myexprole  
aws cloudformation create-stack --stack-name myexprole --template-body file://./ExpPolicyRole --capabilities CAPABILITY_NAMED_IAM

aws cloudformation delete-stack --stack-name mytestdynamo  
aws cloudformation create-stack --stack-name mytestdynamo --template-body file://./ExpDynamoScript  

python processDynamoDBConfig.py


aws cloudformation delete-stack --stack-name myexpec2  
aws cloudformation create-stack --stack-name myexpec2 --template-body file://./ExpEC2-2   

aws cloudformation delete-stack --stack-name myexps3NS  
aws cloudformation create-stack --stack-name myexps3NS --template-body file://./ExpS3Script   --parameters ParameterKey=BUCKETNAME,ParameterValue=expmar2023store --capabilities CAPABILITY_AUTO_EXPAND
aws dynamodb put-item --table-name RESTABLE --item "{\"RESKEY\" : { \"S\":\"S3BUCKET\"}, \"RESNAME\" : {\"S\" : \"expmar2023store\"}, \"RESTYPE\" : {\"S\" : \"S3\"}}"

aws cloudformation create-stack --stack-name myexplambdaCustomFnSNS --template-body file://./ExpLambdaCustomFnSNS --capabilities CAPABILITY_AUTO_EXPAND  
aws cloudformation create-stack --stack-name myexpcodebuild --template-body file://./ExpCodeBuild    

aws codebuild start-build --project-name CB-LAMBDALAYERS
aws codebuild start-build --project-name CB-UPDATEFNLAYERS
aws codebuild start-build --project-name CB-CUSTOMFNSNS
aws codebuild start-build --project-name CB-FNMACROS3

aws lambda invoke --function-name updateFnLayers fn.log

aws s3 cp stacks s3://expmar2023store/stacks --recursive

---------------------------------

aws cloudformation delete-stack --stack-name myexpqueue  
aws cloudformation create-stack --stack-name myexpqueue --template-body file://./ExpQueueNS  --capabilities CAPABILITY_AUTO_EXPAND  

aws cloudformation delete-stack --stack-name myexplambda  
aws cloudformation create-stack --stack-name myexplambda --template-body file://./ExpLambdasWithNS  --capabilities CAPABILITY_AUTO_EXPAND  

aws cloudformation delete-stack --stack-name myexpcodebuildNS  
aws cloudformation create-stack --stack-name myexpcodebuildNS --template-body file://./ExpCodeBuildWithNS --capabilities CAPABILITY_AUTO_EXPAND      

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

#aws cloudformation update-stack --stack-name myexps3NS --template-body file://./ExpS3Script-2   --parameters ParameterKey=BUCKETNAME,ParameterValue=expfeb2023store
#aws cloudformation update-stack --stack-name myexps3NS --template-body file://./ExpS3Script-3   --parameters ParameterKey=BUCKETNAME,ParameterValue=expfeb2023store
aws cloudformation create-stack --stack-name myexps3NS1 --template-body file://./ExpS3Script-1   --capabilities CAPABILITY_AUTO_EXPAND


aws cloudformation delete-stack --stack-name myexpsns  
aws cloudformation create-stack --stack-name myexpsns --template-body file://./ExpSNS --capabilities CAPABILITY_AUTO_EXPAND    
aws cloudformation create-stack --stack-name myexpsnspolicy --template-body file://./ExpSNSPolicy  --capabilities CAPABILITY_AUTO_EXPAND      

aws cloudformation delete-stack --stack-name myexpscheduler  
aws cloudformation create-stack --stack-name myexpscheduler --template-body file://./ExpSchedulerWithNS   --capabilities CAPABILITY_AUTO_EXPAND        



aws cloudformation delete-stack --stack-name myexprds  
aws cloudformation create-stack --stack-name myexprds --template-body file://./ExpRDS    
aws cloudformation update-stack --stack-name myexprds --template-body file://./ExpRDS    
python -c "import processDynamoDBConfig ; processDynamoDBConfig.updateDBEndpoint()"

aws cloudformation delete-stack --stack-name myexpapi  
aws cloudformation create-stack --stack-name myexpapi --template-body file://./ExpApi-CORS   --capabilities CAPABILITY_AUTO_EXPAND           
aws cloudformation update-stack --stack-name myexpapi --template-body file://./ExpApi    

aws cloudformation delete-stack --stack-name myexpapifnp  
aws cloudformation create-stack --stack-name myexpapifnp --template-body file://./ExpApiFnPermission   --capabilities CAPABILITY_AUTO_EXPAND             


aws codebuild start-build --project-name CB-GETITEM
aws codebuild start-build --project-name CB-GETLOCATIONSMOBILE
aws codebuild start-build --project-name CB-GETITEMSHOPRATES
aws codebuild start-build --project-name CB-GETFILTERS
aws codebuild start-build --project-name CB-UPDATEITEM
aws codebuild start-build --project-name CB-CATEGORIES
aws codebuild start-build --project-name CB-COSTCENTRES
aws codebuild start-build --project-name CB-SUBITEMS


aws lambda invoke --function-name updateFnLayers fn.log








--------------Obsolete

#aws cloudformation delete-stack --stack-name myexplambdarole  
#aws cloudformation create-stack --stack-name myexplambdarole --template-body file://./ExpLambdaRoleScript   --capabilities CAPABILITY_NAMED_IAM

#aws cloudformation create-stack --stack-name myexpmacro --template-body file://./Macro   --capabilities CAPABILITY_AUTO_EXPAND CAPABILITY_NAMED_IAM CAPABILITY_IAM
#aws cloudformation create-stack --stack-name myexplambda2 --template-body file://./ExpLambda2   --capabilities CAPABILITY_AUTO_EXPAND


