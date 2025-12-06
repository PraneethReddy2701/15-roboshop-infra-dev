module "frontend-alb" {
  source = "terraform-aws-modules/alb/aws"

  name    = "${var.project}-${var.environment}-frontend-alb"
  vpc_id  = local.vpc_id
  subnets = local.public_subnet_ids

  create_security_group = false
  security_groups = [local.frontend-alb_sg_id]
  internal = false
  version = "9.16.0"
  enable_deletion_protection = false

  tags = merge(
    local.common_tags,
    {
        Name = "${var.project}-${var.environment}-frontend-alb"
    }
  )
}


resource "aws_lb_listener" "frontend-alb" {
  load_balancer_arn = module.frontend-alb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = local.acm_certificate_arn

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/html"
      message_body = "<h1> Hi I am from frontend-alb using https<h1>"
      status_code  = "200"
    }
  }
}

resource "aws_route53_record" "frontend-alb" {
  zone_id = var.zone_id
  name    = "*.${var.zone_name}"  # *.bittu27.site
  type    = "A"

  alias {
    name                   = module.frontend-alb.dns_name
    zone_id                = module.frontend-alb.zone_id  # this is the Zone ID of ALB
    evaluate_target_health = true
  }
}