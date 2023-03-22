if [ "$1" == "" ]; then
  echo "NO BUCKET NAME SPECIFIED"
  exit
fi
aws cloudformation delete-stack --stack-name myexpapifnp  
aws cloudformation wait stack-delete-complete --stack-name myexpapifnp 

aws cloudformation delete-stack --stack-name myexpapi  
aws cloudformation wait stack-delete-complete --stack-name myexpapi

#aws cloudformation delete-stack --stack-name myexprds  
#aws cloudformation wait stack-delete-complete --stack-name myexprds

aws cloudformation delete-stack --stack-name myexpsnspolicy  
aws cloudformation wait stack-delete-complete --stack-name myexpsnspolicy

aws cloudformation delete-stack --stack-name myexpscheduler  
aws cloudformation wait stack-delete-complete --stack-name myexpscheduler

aws cloudformation delete-stack --stack-name myexpsns  
aws cloudformation wait stack-delete-complete --stack-name myexpsns

aws cloudformation delete-stack --stack-name myexpqueue  
aws cloudformation wait stack-delete-complete --stack-name myexpqueue

aws cloudformation delete-stack --stack-name myexpcodebuildNS  
aws cloudformation wait stack-delete-complete --stack-name myexpcodebuildNS

aws cloudformation delete-stack --stack-name myexplambda  
aws cloudformation wait stack-delete-complete --stack-name myexplambda

aws cloudformation delete-stack --stack-name myexpcodebuild 
aws cloudformation wait stack-delete-complete --stack-name myexpcodebuild

aws cloudformation delete-stack --stack-name myexplambdaCustomFnSNS 
aws cloudformation wait stack-delete-complete --stack-name myexplambdaCustomFnSNS

#aws cloudformation delete-stack --stack-name myexps3NS1  
#aws cloudformation wait stack-delete-complete --stack-name myexps3NS1

aws s3 rm s3://$1 --recursive

aws cloudformation delete-stack --stack-name myexps3NS  
aws cloudformation wait stack-delete-complete --stack-name myexps3NS

aws cloudformation delete-stack --stack-name myexpdynamo  
aws cloudformation wait stack-delete-complete --stack-name myexpdynamo

aws cloudformation delete-stack --stack-name myexprds  
aws cloudformation wait stack-delete-complete --stack-name myexprds

