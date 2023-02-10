-- github token :  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
-- AWS CLI commands
aws cloudformation delete-stack --stack-name myexprole  
aws cloudformation create-stack --stack-name myexprole --template-body ./ExpPolicyRole --capabilities CAPABILITY_NAMED_IAM

aws cloudformation delete-stack --stack-name mytestdynamo  
aws cloudformation create-stack --stack-name mytestdynamo --template-body ./ExpDynamoScript  

aws cloudformation delete-stack --stack-name myexps3NS  
aws cloudformation create-stack --stack-name myexps3NS --template-body ./ExpS3Script   --parameters ParameterKey=BUCKETNAME,ParameterValue=expjan2023store
aws dynamodb put-item --table-name RESTABLE --item "{\"RESKEY\" : { \"S\":\"S3BUCKET\"}, \"RESNAME\" : {\"S\" : \"expjan2023store2\"}, \"RESTYPE\" : {\"S\" : \"S3\"}}"

aws cloudformation create-stack --stack-name myexplambdaCustomFnSNS --template-body ./ExpLambdaCustomFnSNS   
aws cloudformation create-stack --stack-name myexpcodebuild --template-body ./ExpCodeBuild    

aws codebuild start-build --project-name CB-LAMBDALAYERS
aws codebuild start-build --project-name CB-UPDATEFNLAYERS
aws codebuild start-build --project-name CB-CUSTOMFNSNS

aws lambda invoke --function-name updateFnLayers fn.log

aws s3 cp stacks s3://expjan2023store2/stacks --recursive



---------------------------------

aws cloudformation delete-stack --stack-name myexplambda  
aws cloudformation create-stack --stack-name myexplambda --template-body ./ExpLambdasWithNS   

aws cloudformation delete-stack --stack-name myexpcodebuildNS  
aws cloudformation create-stack --stack-name myexpcodebuildNS --template-body ./ExpCodeBuildWithNS    

aws codebuild start-build --project-name CB-PROCESSSHOPFILE
aws codebuild start-build --project-name CB-REGISTERSHOPFILE
aws codebuild start-build --project-name CB-PROCESSONEFILE
aws codebuild start-build --project-name CB-PROCESSTRNQ

aws cloudformation update-stack --stack-name myexps3NS --template-body ./ExpS3Script-2   --parameters ParameterKey=BUCKETNAME,ParameterValue=expjan2023store2
aws cloudformation update-stack --stack-name myexps3NS --template-body ./ExpS3Script-3   --parameters ParameterKey=BUCKETNAME,ParameterValue=expjan2023store2

aws cloudformation delete-stack --stack-name myexpqueue  
aws cloudformation create-stack --stack-name myexpqueue --template-body ./ExpQueueNS    

aws cloudformation delete-stack --stack-name myexpscheduler  
aws cloudformation create-stack --stack-name myexpscheduler --template-body ./ExpSchedulerWithNS    


aws cloudformation delete-stack --stack-name myexpsns  
aws cloudformation create-stack --stack-name myexpsns --template-body ./ExpSNS    

aws cloudformation delete-stack --stack-name myexprds  
aws cloudformation create-stack --stack-name myexprds --template-body ./ExpRDS    


aws cloudformation delete-stack --stack-name myexpapi  
aws cloudformation create-stack --stack-name myexpapi --template-body ./ExpApi    
aws cloudformation update-stack --stack-name myexpapi --template-body ./ExpApi    

aws cloudformation delete-stack --stack-name myexpapifnp  
aws cloudformation create-stack --stack-name myexpapifnp --template-body ./ExpApiFnPermission    









--------------Obsolete
aws cloudformation delete-stack --stack-name myexplambdarole  
aws cloudformation create-stack --stack-name myexplambdarole --template-body ./ExpLambdaRoleScript   --capabilities CAPABILITY_NAMED_IAM

aws cloudformation delete-stack --stack-name myexpec2  
aws cloudformation create-stack --stack-name myexpec2 --template-body ./ExpEC2   
