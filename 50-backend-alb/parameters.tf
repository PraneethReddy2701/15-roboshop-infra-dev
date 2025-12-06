resource "aws_ssm_parameter" "backend-alb_listener_arn" {
  name  = "/${var.project}/${var.environment}/backend-alb_listener_arn"
  type  = "String"
  value = aws_lb_listener.backend-alb.arn
}