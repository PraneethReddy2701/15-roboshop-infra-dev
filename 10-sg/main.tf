module "frontend" {
# source = "../../16-terraform-aws-security-group-module"
  source = "git::https://github.com/PraneethReddy2701/16-terraform-aws-security-group-module.git?ref=main"

  project = var.project
  environment = var.environment

  sg_name        = var.frontend_sg_name
  sg_description = var.frontend_sg_description

# vpc_id = data.aws_ssm_parameter.vpc_id.
  vpc_id = local.vpc_id
}