## Command to create cloudformation for EC2

    aws cloudformation create-stack \
    --stack-name surakshitha-ec2-stack \
    --template-body file://surakshitha-ec2-template.yaml \
    --capabilities CAPABILITY_NAMED_IAM \
    --profile devops

## Delete cloudformation command

    aws cloudformation delete-stack \
    --stack-name surakshitha-ec2-stack \
    --profile devops

## Command to create cloudformation for EC2 Web Server

    aws cloudformation create-stack \
    --stack-name surakshitha-ec2-web-stack \
    --template-body file://surakshitha-ec2-web-server-template.yaml \
    --parameters \
      ParameterKey=KeyName,ParameterValue=surakshitha-keypair \
    --capabilities CAPABILITY_NAMED_IAM \
    --profile devops

    Delete

    aws cloudformation delete-stack \
    --stack-name surakshitha-ec2-web-stack \
    --profile devops


## Command to create cloudformation for S3 Bucket

    aws cloudformation create-stack \
    --stack-name surakshitha-s3-stack \
    --template-body file://surakshitha-s3-template.yaml \
    --capabilities CAPABILITY_NAMED_IAM \
    --profile devops

    Delete

    aws cloudformation delete-stack \
    --stack-name surakshitha-s3-stack \
    --profile devops