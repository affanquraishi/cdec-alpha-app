# Frontend stack — S3 bucket + Route53 zone (CloudFront is created manually for now)

module "s3" {
  source = "../modules/s3-frontend"

  application       = var.application
  environment       = var.environment
  bucket_name       = var.bucket_name
  force_destroy     = var.force_destroy
  enable_versioning = var.enable_versioning

  tags = {
    Component = "s3"
  }
}

# Keep existing state: the bucket used to live inside module.cloudfront.
# These blocks make Terraform MOVE it instead of destroy + recreate.
moved {
  from = module.cloudfront.aws_s3_bucket.this
  to   = module.s3.aws_s3_bucket.this
}

moved {
  from = module.cloudfront.aws_s3_bucket_public_access_block.this
  to   = module.s3.aws_s3_bucket_public_access_block.this
}

moved {
  from = module.cloudfront.aws_s3_bucket_versioning.this
  to   = module.s3.aws_s3_bucket_versioning.this
}

moved {
  from = module.cloudfront.aws_s3_bucket_server_side_encryption_configuration.this
  to   = module.s3.aws_s3_bucket_server_side_encryption_configuration.this
}

module "route53" {
  source = "../modules/route53"

  application = var.application
  environment = var.environment

  zone_name     = var.dns_zone_name
  zone_id       = var.route53_zone_id
  force_destroy = var.dns_zone_force_destroy

  # Add the A/AAAA alias records to CloudFront manually after it is created.
  records = []

  tags = {
    Component = "route53"
  }
}
