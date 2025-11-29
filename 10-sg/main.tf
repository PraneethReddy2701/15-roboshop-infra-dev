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


# security group for bastion host
module "bastion" {
  source = "git::https://github.com/PraneethReddy2701/16-terraform-aws-security-group-module.git?ref=main"
  project = var.project
  environment = var.environment

  sg_name        = var.bastion_sg_name
  sg_description = var.bastion_sg_description
  vpc_id = local.vpc_id
}

# bastion accepting connections from laptop
resource "aws_security_group_rule" "bastion_laptop" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.bastion.sg_id
}


# security group for backend-alb
module "backend-alb" {
  source = "git::https://github.com/PraneethReddy2701/16-terraform-aws-security-group-module.git?ref=main"
  project = var.project
  environment = var.environment

  sg_name        = var.backend-alb_sg_name
  sg_description = var.backend-alb_sg_description
  vpc_id = local.vpc_id
}

# backend-alb accepting connections from bastion host on port 80
resource "aws_security_group_rule" "backend-alb_bastion" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id = module.bastion.sg_id
  security_group_id = module.backend-alb.sg_id
}