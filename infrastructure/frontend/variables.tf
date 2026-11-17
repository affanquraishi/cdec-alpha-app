variable "aws_region" {
  description = "AWS region for S3 and regional resources."
  type        = string
  default     = "eu-west-1"
}

variable "environment" {
  description = "Environment name used in tags and naming."
  type        = string
  default     = "dev"
}

variable "application" {
  description = "Application identifier for default tags."
  type        = string
  default     = "cdec-frontend"
}

variable "bucket_name" {
  description = "Globally unique S3 bucket name. Leave null to use {application}-{environment}-frontend."
  type        = string
  default     = null
}

variable "force_destroy" {
  description = "Allow Terraform to delete the frontend bucket when it contains objects."
  type        = bool
  default     = false
}

variable "enable_versioning" {
  description = "Enable S3 versioning on the frontend bucket."
  type        = bool
  default     = false
}

variable "dns_zone_name" {
  description = "Route 53 zone name to create (e.g. example.com). Required unless route53_zone_id is set."
  type        = string
}

variable "route53_zone_id" {
  description = "Existing hosted zone ID. When set, the module does not create a zone."
  type        = string
  default     = null
}

variable "dns_zone_force_destroy" {
  description = "Allow Terraform to delete the hosted zone when it contains records."
  type        = bool
  default     = false
}
