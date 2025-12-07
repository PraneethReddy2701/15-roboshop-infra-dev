module "user" {
  source = "git::https://github.com/PraneethReddy2701/18-terraform-roboshop-backend-module.git?ref=main"
  component = "user"
  rule_priority = 20 # as we gave 10 to catalogue

}