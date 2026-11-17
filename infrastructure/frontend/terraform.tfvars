# Copy to terraform.tfvars. Do not commit terraform.tfvars.

aws_region  = "us-east-1"
environment = "dev"
application = "cdec-alpha-cbzpb3738"

acm_certificate_arn = "arn:aws:acm:us-east-1:101267679329:certificate/e8d3c2c6-5f55-4a54-baa8-3c4b3e02e4a6"

# Use a domain you own — example.com is reserved by AWS and will fail
dns_zone_name   = "pravah.qd.je"
dns_record_name = "www.pravah.qd.je"
