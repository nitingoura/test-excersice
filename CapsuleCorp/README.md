# Test assignment

### Test 1 - (Pre-Request)

Path - CapsuleCorp/Test 1/apachelogs.py
Example to execute:
```
python3 apachelogs.py puppet_access_ssl.log
```

### Test 2 & 3

Path - CapsuleCorp/Test 2 3/

Folder Descriptions
1. documentation - contains high level architecture diagrams
2. terraform - contains terraform scripts to create infra
3. terraform/files/ansible - ansible playbooks to configure nginx and umami

Notes:
1. I am using Azutoscaling group for HA setup
2. I am using lauch configuration user data to configure nginx and umami

Cost:
Path - CapsuleCorp/Test 2 3/documentation/AWS Pricing Calculator.pdf


### Test 4
For monitoring mostly I used datadog monitoring, here are the few example how i am planing monitoring
1. Resources monitoring with alerting (I will conigure datadog with pagerduty software for on-call rotation)
https://docs.datadoghq.com/monitors/

2. SSL certificate
https://www.datadoghq.com/ssl-monitoring/

3. DB monitoring
https://docs.datadoghq.com/integrations/amazon_rds/?tab=standard

4. End Point monitoring app
https://docs.datadoghq.com/synthetics/

5. Security Monitroing
https://aws.amazon.com/financial-services/partner-solutions/datadog-on-aws/