resource "aws_route53_record" "www" {
  zone_id = "YOUR_ZONE_ID"
  name    = "westonb.com"
  type    = "A"

  alias {
    name                   = module.cloudfront.cloudfront_distribution_domain_name
    zone_id                = module.cloudfront.cloudfront_distribution_hosted_zone_id
    evaluate_target_health = false
  }
}