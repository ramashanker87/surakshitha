output "state_bucket_name" {
  description = "Terraform remote state bucket name"
  value       = module.remote_state_bucket.bucket_name
}

output "state_bucket_arn" {
  description = "Terraform remote state bucket ARN"
  value       = module.remote_state_bucket.bucket_arn
}

output "lock_table_name" {
  description = "Terraform lock table name"
  value       = module.terraform_lock_table.table_name
}

output "lock_table_arn" {
  description = "Terraform lock table ARN"
  value       = module.terraform_lock_table.table_arn
}