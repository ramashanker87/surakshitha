locals {
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    Owner       = "training"
  }
}

module "remote_state_bucket" {
  source = "./modules/s3_bucket"

  bucket_name        = var.state_bucket_name
  versioning_enabled = true
  tags               = local.common_tags
}

module "terraform_lock_table" {
  source = "./modules/dynamodb_table"

  table_name = var.lock_table_name
  tags       = local.common_tags
}