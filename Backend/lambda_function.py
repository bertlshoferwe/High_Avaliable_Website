import json
import boto3

def lambda_handler(event, context):
    print("Received event:", json.dumps(event))
    
    # auto-remediation action: Block IP in WAF
    waf_client = boto3.client('wafv2')
    
    ip_set_id = "YOUR_IP_SET_ID"
    blocked_ip = event['detail']['sourceIPAddress']
    
    response = waf_client.update_ip_set(
        Name="BlockedIPs",
        Scope="REGIONAL",
        Id=ip_set_id,
        Addresses=[blocked_ip]
    )

    return {
        'statusCode': 200,
        'body': json.dumps('IP Blocked!')
    }