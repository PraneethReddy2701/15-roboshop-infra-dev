resource "aws_ssm_parameter" "frontend-alb_listener_arn" {
  name  = "/${var.project}/${var.environment}/frontend-alb_listener_arn"
  type  = "String"
  value = aws_lb_listener.frontend-alb.arn
}