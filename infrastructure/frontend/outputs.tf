output "s3_bucket_name" {
  description = "S3 bucket for frontend build artifacts (sync dist/ here)."
  value       = module.s3.bucket_id
}

output "s3_bucket_arn" {
  description = "S3 bucket ARN."
  value       = module.s3.bucket_arn
}

output "route53_zone_id" {
  description = "Route 53 hosted zone ID."
  value       = module.route53.zone_id
}

output "route53_name_servers" {
  description = "Name servers when this stack created a new zone."
  value       = module.route53.name_servers
}
