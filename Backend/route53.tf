resource "aws_route53_zone" "primary" {
  name = "westonb.com"
}

resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "westonb.com"
  type    = "A"

  alias {
    name                   = module.cloudfront.cloudfront_distribution_domain_name
    zone_id                = module.cloudfront.cloudfront_distribution_hosted_zone_id
    evaluate_target_health = false
  }
}