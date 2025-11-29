module "backend-alb" {
  source = "terraform-aws-modules/alb/aws"

  name    = "${var.project}-${var.environment}-backend-alb"
  vpc_id  = local.vpc_id
  subnets = local.private_subnet_ids

  create_security_group = false
  security_groups = [local.backend-alb_sg_id]
  internal = true

 

  tags = merge(
    local.common_tags,
    {
        Name = "${var.project}-${var.environment}-backend-alb"
    }
  )
}