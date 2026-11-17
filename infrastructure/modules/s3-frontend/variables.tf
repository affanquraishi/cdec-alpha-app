variable "application" {
  description = "Application identifier used in naming and tags."
  type        = string
}

variable "environment" {
  description = "Environment name used in naming and tags."
  type        = string
}

variable "bucket_name" {
  description = "S3 bucket name. Defaults to {application}-{environment}-frontend."
  type        = string
  default     = null
}

variable "force_destroy" {
  description = "Allow Terraform to delete the bucket even when it contains objects."
  type        = bool
  default     = false
}

variable "enable_versioning" {
  description = "Enable S3 object versioning."
  type        = bool
  default     = false
}

variable "tags" {
  description = "Additional tags."
  type        = map(string)
  default     = {}
}
