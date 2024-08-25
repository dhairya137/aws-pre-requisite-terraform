############################################################
######################## vpc.tf ############################
############################################################
variable "region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-west-2"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["us-west-2a", "us-west-2b", "us-west-2c"]
}

variable "enable_nat_gateway" {
  description = "Enable NAT Gateway for private subnets"
  type        = bool
  default     = false
}

variable "single_nat_gateway" {
  description = "Use a single NAT Gateway for all private subnets"
  type        = bool
  default     = false
}

variable "vpc_name" {
  description = "Name tag for the VPC"
  type        = string
  default     = "My VPC"
}

variable "environment_tag" {
  description = "Environment Tag for all resources"
  type = string
  default = "dev"
}

############################################################
###################### budget.tf ###########################
############################################################

variable "budget_name" {
  description = "Name of the budget"
  type        = string
  default     = "monthly-budget"
}

variable "budget_limit_amount" {
  description = "The amount of cost or usage being measured for a budget"
  type        = string
  default     = "100"
}

variable "budget_limit_unit" {
  description = "The unit of measurement used for the budget forecast, actual spend, or budget threshold"
  type        = string
  default     = "USD"
}

variable "budget_time_period_start" {
  description = "The start of the time period covered by the budget"
  type        = string
  default     = "2023-01-01_00:00"
}

variable "budget_time_unit" {
  description = "The length of time until a budget resets the actual and forecasted spend"
  type        = string
  default     = "MONTHLY"
}

variable "budget_notification_threshold" {
  description = "Threshold when the notification should be sent"
  type        = number
  default     = 80
}

variable "budget_notification_operator" {
  description = "Comparison operator to use to evaluate the condition"
  type        = string
  default     = "GREATER_THAN"
}

variable "budget_notification_type" {
  description = "What kind of budget value to notify on"
  type        = string
  default     = "ACTUAL"
}

variable "budget_notification_email" {
  description = "Email address for budget notifications"
  type        = string
}


############################################################
###################### billing.tf ##########################
############################################################

variable "environment_tag_key" {
  description = "The key for the environment tag"
  type        = string
  default     = "Environment"
}

