# billing.tf

resource "aws_ce_cost_category" "environment" {
  name         = "Environment"
  rule_version = "CostCategoryExpression.v1"
  rule {
    value = "Prod"
    rule {
      tags {
        key    = var.environment_tag_key
        match_options = ["EQUALS"]
        values = ["Production"]
      }
    }
  }
  rule {
    value = "stage"
    rule {
      tags {
        key    = var.environment_tag_key
        match_options = ["EQUALS"]
        values = ["Staging"]
      }
    }
  }
  rule {
    value = "dev"
    rule {
      tags {
        key    = var.environment_tag_key
        match_options = ["EQUALS"]
        values = ["Development"]
      }
    }
  }
  rule {
    value = "Other"
    rule {
      tags {
        key    = var.environment_tag_key
        match_options = ["ABSENT"]
      }
    }
  }
}

# resource "aws_ce_tags" "environment_tag" {
#   tag_key = var.environment_tag_key
# }