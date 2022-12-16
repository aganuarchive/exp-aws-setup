aws cloudformation wait stack-delete-complete --stack-name myexprole 
aws cloudformation wait stack-create-complete --stack-name myexprole --template-body ExpPolicyRole --capabilities CAPABILITY_NAMED_IAM

aws cloudformation wait stack-delete-complete --stack-name myexpcodebuild 
aws cloudformation wait stack-create-complete --stack-name myexpcodebuild --template-body expcodebuild 
