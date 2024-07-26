aws cloudformation create-stack --stack-name CentralLambdas --template-body file://./CentralLambdas   --capabilities CAPABILITY_AUTO_EXPAND 
aws cloudformation create-stack --stack-name CentralCodeBuild --template-body file://./CentralCodeBuild   --capabilities CAPABILITY_AUTO_EXPAND 
aws cloudformation create-stack --stack-name CentralDynamoScript --template-body file://./CentralDynamoScript   --capabilities CAPABILITY_AUTO_EXPAND 
aws cloudformation create-stack --stack-name CentralApi --template-body file://./CentralApi   --capabilities CAPABILITY_AUTO_EXPAND 
aws cloudformation create-stack --stack-name CentralApiResources --template-body file://./CentralApiResources   --capabilities CAPABILITY_AUTO_EXPAND 
aws cloudformation create-stack --stack-name CentralFnPermission --template-body file://./CentralFnPermission  --capabilities CAPABILITY_AUTO_EXPAND 
