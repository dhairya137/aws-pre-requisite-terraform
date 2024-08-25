region             = "us-west-2"
vpc_cidr           = "10.0.0.0/16"
enable_nat_gateway = false
single_nat_gateway = false
vpc_name           = "My Custom VPC"
environment_tag    = "dev"

budget_name = "my-custom-budget"
budget_limit_amount = "100"
budget_notification_threshold = 80
budget_notification_email = "dhairya00798@gmail.com"