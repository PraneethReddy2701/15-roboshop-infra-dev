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


# security group for vpn
module "vpn" {
  source = "git::https://github.com/PraneethReddy2701/16-terraform-aws-security-group-module.git?ref=main"
  project = var.project
  environment = var.environment

  sg_name        = var.vpn_sg_name
  sg_description = var.vpn_sg_description
  vpc_id = local.vpc_id
}

# vpn server accepting connections from laptop (vpn client) on ports 22, 443, 1194, 943
# vpn ssh 22
resource "aws_security_group_rule" "vpn_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.vpn.sg_id
}

# vpn https 443
resource "aws_security_group_rule" "vpn_https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.vpn.sg_id
}

# vpn internal port 1194
resource "aws_security_group_rule" "vpn_1194" {
  type              = "ingress"
  from_port         = 1194
  to_port           = 1194
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.vpn.sg_id
}

# vpn internal port 943
resource "aws_security_group_rule" "vpn_943" {
  type              = "ingress"
  from_port         = 943
  to_port           = 943
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.vpn.sg_id
}

# backend-alb allowing traffic from vpn
resource "aws_security_group_rule" "backend-alb_vpn" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id = module.vpn.sg_id
  security_group_id = module.backend-alb.sg_id
}