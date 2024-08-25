# AWS Account Setup with Terraform

This Terraform project sets up a new AWS account with best practices for security, networking, and cost management.

## Features

- Custom VPC setup with public and private subnets
- Budget alerts
- CloudTrail logs
- Strong password policy
- AWS Security Hub enablement
- Tagging strategy for cost allocation

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) (version 0.12+)
- AWS CLI configured with appropriate credentials
- An AWS account where you have administrative access

## Usage

1. Clone this repository
2. Initialize Terraform:

```bash
terraform init
```

3. Customize the variables in `terraform.tfvars` or create this file if it doesn't exist

```bash
region             = "us-west-2"
vpc_cidr           = "10.0.0.0/16"
enable_nat_gateway = false
single_nat_gateway = false
vpc_name           = "My Custom VPC"
environment_tag    = "dev"

budget_name = "my-custom-budget"
budget_limit_amount = "100"
budget_notification_threshold = 80
budget_notification_email = "your-email@example.com"
```

4. Review the execution plan:

```bash
terraform plan
```

5. Apply the Terraform configuration:

```bash
terraform apply
```

## Post-Setup Steps

1. Enable MFA for the root account and IAM users.
2. Set up AWS Organizations manually if required.
3. Review and activate cost allocation tags in the AWS Billing Console.
4. Set up additional IAM users and groups as needed.
