#Create bucket for static website files
module "s3_website" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "~> 3.0"

  bucket = "westonb-static-site"
  acl    = "private"

  website {
    index_document = "index.html"
    error_document = "index.html"
  }

  logging {
    target_bucket = "westonb-logs"
    target_prefix = "s3/"
  }

  force_destroy = true
}