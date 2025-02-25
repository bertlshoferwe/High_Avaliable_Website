# Secure Static Website Deployment on AWS

## Overview
This project sets up a secure, high-performance static website using AWS services, deployed with Terraform. The website displays the IP address and location of the server serving the request, allowing verification of access from different locations.

## Architecture
The deployment consists of:
- **Amazon S3**: Hosts the static website content.
- **Amazon CloudFront**: Serves content with global caching and HTTPS support.
- **AWS Certificate Manager (ACM)**: Manages SSL certificates for secure access.
- **AWS WAF**: Protects against common web threats.
- **Amazon Route 53**: Configures DNS for (your custom domain).
- **AWS CloudWatch**: Monitors logs and triggers alarms.
- **AWS Lambda**: Handles auto-remediation of security threats.
- **AWS SNS**: Sends notifications for security events.

## Deployment Steps
```
# 1. Clone the Repository
git clone https://github.com/westonb/terraform-secure-static-site.git
cd terraform-secure-static-site

# 2. Configure AWS Credentials
aws configure

# 3. Initialize Terraform
terraform init

# 4. Review Terraform Plan
terraform plan

# 5. Deploy Infrastructure
terraform apply -auto-approve

# 6. Verify Deployment
# Visit (Your Custom Domain) to confirm the site is live.
# Check CloudFront caching by accessing from different locations.
# Monitor logs and alarms in CloudWatch.
```

## Security Features
- **WAF Rules**: Protect against SQL injection, XSS, and rate-limiting attacks.
- **IAM Policies**: Restrict access to only required services.
- **CloudWatch Alarms**: Monitor and trigger alerts for suspicious activity.
- **Lambda Auto-Remediation**: Automatically blocks malicious IPs based on CloudWatch alarms.

## Monitoring and Logging
- **S3 Access Logs**: Store logs for security analysis.
- **CloudFront Logging**: Monitors content distribution.
- **CloudWatch Metrics**: Tracks website health and security events.
