resource "aws_cloudwatch_metric_alarm" "high_requests" {
  alarm_name          = "HighRequestsAlarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name        = "Requests"
  namespace          = "AWS/CloudFront"
  period            = 60
  statistic         = "Sum"
  threshold         = 5000
  alarm_description = "Triggers if requests exceed 5000 per minute"
  alarm_actions     = [aws_sns_topic.alerts.arn]
}

