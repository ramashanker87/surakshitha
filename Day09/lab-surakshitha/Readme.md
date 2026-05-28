## Command to create cloudformation

    aws cloudformation create-stack \
    --stack-name surakshitha-ec2-stack \
    --template-body file://surakshitha-ec2-template.yaml \
    --capabilities CAPABILITY_NAMED_IAM \
    --profile devops

## Delete cloudformation command

    aws cloudformation delete-stack \
    --stack-name surakshitha-ec2-stack \
    --profile devops