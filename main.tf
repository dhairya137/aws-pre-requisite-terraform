# 1. Delete default VPC and create a custom one
resource "aws_default_vpc" "default" {
  force_destroy = true
}

# 1. Custom VPC creation - vpc.tf 

# 2. Set up budget alerts - budget.tf

# 3. Enable CloudTrail logs - cloudtrail.tf


# 4. Configure strong password policy
resource "aws_iam_account_password_policy" "strict" {
  minimum_password_length        = 14
  require_lowercase_characters   = true
  require_numbers                = true
  require_uppercase_characters   = true
  require_symbols                = true
  allow_users_to_change_password = true
  password_reuse_prevention      = 24
  max_password_age               = 90
}

# # 5. Enforce MFA for all users (this is a policy, actual enforcement requires additional steps)
# resource "aws_iam_policy" "require_mfa" {
#   name        = "RequireMFA"
#   path        = "/"
#   description = "Policy that enforces MFA"

#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Effect = "Deny"
#         Action = "*"
#         Resource = "*"
#         Condition = {
#           BoolIfExists = {
#             "aws:MultiFactorAuthPresent" = "false"
#           }
#         }
#       }
#     ]
#   })
# }

# 6. Enable AWS Resource Explorer (This feature might not be available via Terraform yet)

# # 7. Set up IAM roles and least privilege access (example)
# resource "aws_iam_role" "example_role" {
#   name = "ExampleRole"

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Action = "sts:AssumeRole"
#         Effect = "Allow"
#         Principal = {
#           Service = "ec2.amazonaws.com"
#         }
#       }
#     ]
#   })
# }

# 8. Enable AWS Security Hub
resource "aws_securityhub_account" "main" {}

# 9. Implement tagging strategy - billing.tf

# 10. Enable AWS Organizations (This typically requires manual setup or separate account)

# Additional security measures

# Enable GuardDuty
resource "aws_guardduty_detector" "main" {
  enable = true
}

# Enable AWS Config
resource "aws_config_configuration_recorder" "main" {
  name     = "main-recorder"
  role_arn = aws_iam_role.config_role.arn

  recording_group {
    all_supported = true
    include_global_resource_types = true
  }
}

resource "aws_iam_role" "config_role" {
  name = "aws-config-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "config.amazonaws.com"
        }
      }
    ]
  })
}

# Attach necessary policies to the Config role
resource "aws_iam_role_policy_attachment" "config_policy_attachment" {
  role       = aws_iam_role.config_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWS_ConfigRole"
}