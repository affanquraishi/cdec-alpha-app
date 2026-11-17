# S3 bucket for the built frontend (Vite/React dist/). No CloudFront here.

locals {
  name_prefix = "${var.application}-${var.environment}"
  bucket_name = coalesce(var.bucket_name, "${local.name_prefix}-frontend")
  tags = merge(
    {
      Environment = var.environment
      Application = var.application
      ManagedBy   = "terraform"
      Module      = "s3-frontend"
    },
    var.tags
  )
}

resource "aws_s3_bucket" "this" {
  bucket        = local.bucket_name
  force_destroy = var.force_destroy

  tags = merge(local.tags, {
    Name = local.bucket_name
  })
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id

  versioning_configuration {
    status = var.enable_versioning ? "Enabled" : "Suspended"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
