module "component" {
  for_each = var.components
  source = "git::https://github.com/PraneethReddy2701/18-terraform-roboshop-backend-module.git?ref=main"
  component = each.key
  rule_priority = each.value.rule_priority

}