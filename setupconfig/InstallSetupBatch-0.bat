#Run this batch from windows prompt
aws cloudformation create-stack --stack-name myexprole --template-body file://./ExpPolicyRole --capabilities CAPABILITY_NAMED_IAM
aws cloudformation wait stack-create-complete --stack-name myexprole

aws cloudformation create-stack --stack-name myexpec2 --template-body file://./ExpEC2-2   
aws cloudformation wait stack-create-complete --stack-name myexpec2

