aws cloudformation delete-stack --stack-name expec2  
aws cloudformation wait stack-delete-complete --stack-name expec2

aws cloudformation delete-stack --stack-name myexprole  
aws cloudformation wait stack-delete-complete --stack-name myexprole
