aws cloudformation delete-stack --stack-name myexprole 
aws cloudformation wait stack-delete-complete --stack-name myexprole 
aws cloudformation create-stack --stack-name myexprole --template-body file://ExpPolicyRole --capabilities CAPABILITY_NAMED_IAM
aws cloudformation wait stack-create-complete --stack-name myexprole

aws cloudformation delete-stack --stack-name mytestdynamo 
aws cloudformation wait stack-delete-complete --stack-name mytestdynamo 
aws cloudformation create-stack --stack-name mytestdynamo --template-body file://ExpDynamoScript 
aws cloudformation wait stack-create-complete --stack-name mytestdynamo 


aws cloudformation delete-stack --stack-name myexpcodebuild 
aws cloudformation wait stack-delete-complete --stack-name myexpcodebuild 
aws cloudformation create-stack --stack-name myexpcodebuild --template-body file://ExpCodeBuild 
aws cloudformation wait stack-create-complete --stack-name myexpcodebuild 
