aws cloudformation create-stack --stack-name expebcentral --template-body file://./ExpEBCentral   --capabilities CAPABILITY_AUTO_EXPAND        
aws cloudformation create-stack --stack-name expebcentralpolicy --template-body file://./ExpEBCentralPolicy   --capabilities CAPABILITY_AUTO_EXPAND        
aws cloudformation create-stack --stack-name myexpscheduler2 --template-body file://./ExpCentralScheduler   --capabilities CAPABILITY_AUTO_EXPAND        
