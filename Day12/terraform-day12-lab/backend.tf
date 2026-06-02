terraform {
  backend "s3" {
    bucket         = "surakshitha-day12-tf-state-20260602"
    key            = "day12/dev/terraform.tfstate"
    region         = "us-east-1"
    profile        = "devops"
    dynamodb_table = "surakshitha-day12-terraform-locks"
    encrypt        = true
  }
}