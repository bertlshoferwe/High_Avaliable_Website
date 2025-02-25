module "cloudfront" {
  source  = "terraform-aws-modules/cloudfront/aws"
  version = "~> 3.0"

  aliases             = ["westonb.com", "www.westonb.com"]
  comment             = "CloudFront for WestonB Static Site"
  default_root_object = "index.html"
  
  origin {
    domain_name = module.s3_website.s3_bucket_website_endpoint
    origin_id   = "S3Origin"
  }

  default_cache_behavior {
    target_origin_id       = "S3Origin"
    viewer_protocol_policy = "redirect-to-https"
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    compress               = true
  }

  logging {
    bucket = "westonb-logs.s3.amazonaws.com"
    prefix = "cloudfront/"
  }
}