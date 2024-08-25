resource "aws_budgets_budget" "cost" {
  name              = var.budget_name
  budget_type       = "COST"
  limit_amount      = var.budget_limit_amount
  limit_unit        = var.budget_limit_unit
  time_period_start = var.budget_time_period_start
  time_unit         = var.budget_time_unit

  notification {
    comparison_operator = var.budget_notification_operator
    threshold           = var.budget_notification_threshold
    threshold_type      = "PERCENTAGE"
    notification_type   = var.budget_notification_type
    subscriber_email_addresses = [var.budget_notification_email]
  }
}