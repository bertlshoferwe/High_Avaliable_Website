module "waf" {
  source  = "terraform-aws-modules/waf/aws"
  version = "~> 2.0"

  name_prefix = "westonb-waf"
  
  rules = [
    {
      name        = "RateLimitRule"
      priority    = 1
      action      = "block"
      rate_limit  = 2000
      type        = "rate-based"
    }
  ]

  cloudwatch_metrics_enabled = true
}