variable "project" {
  default = "roboshop"  
}

variable "environment" {
  default = "dev" 
}

variable "sg_tags"{
  type = map(string)
  default = {}
}

variable "mongodb_sg_name" {
  default = "mongodb"
}

variable "mongodb_sg_description" {
  default = "this security group is created for mongodb"  
}

variable "mongodb_vpn_ports" {
  default = [22, 27017]  
}

variable "mongodb_bastion_ports" {
  default = [22, 27017]  
}

variable "redis_sg_name" {
  default = "redis"
}

variable "redis_sg_description" {
  default = "this security group is created for redis"  
}

variable "redis_vpn_ports" {
  default = [22, 6379]  
}

variable "redis_bastion_ports" {
  default = [22, 6379]
}

variable "mysql_sg_name" {
  default = "mysql"
}

variable "mysql_sg_description" {
  default = "this security group is created for mysql"  
}

variable "mysql_vpn_ports" {
  default = [22, 3306]  
}

variable "mysql_bastion_ports" {
  default = [22, 3306]
}

variable "rabbitmq_sg_name" {
  default = "rabbitmq"
}

variable "rabbitmq_sg_description" {
  default = "this security group is created for rabbitmq"  
}

variable "rabbitmq_vpn_ports" {
  default = [22, 5672]  
}

variable "rabbitmq_bastion_ports" {
  default = [22, 5672]  
}

variable "catalogue_sg_name" {
  default = "catalogue"
}

variable "catalogue_sg_description" {
  default = "this security group is created for catalogue"  
}

variable "user_sg_name" {
  default = "user"
}

variable "user_sg_description" {
  default = "this security group is created for user"  
}

variable "cart_sg_name" {
  default = "cart"
}

variable "cart_sg_description" {
  default = "this security group is created for cart"  
}

variable "shipping_sg_name" {
  default = "shipping"
}

variable "shipping_sg_description" {
  default = "this security group is created for shipping"  
}

variable "payment_sg_name" {
  default = "payment"
}

variable "payment_sg_description" {
  default = "this security group is created for payment"  
}

variable "backend-alb_sg_name" {
  default = "backend-alb"
}

variable "backend-alb_sg_description" {
  default = "this security group is created for backend-alb"  
}

variable "frontend_sg_name" {
  default = "frontend"
}

variable "frontend_sg_description" {
  default = "this security group is created for frontend"  
}

variable "frontend-alb_sg_name" {
  default = "frontend-alb"
}

variable "frontend-alb_sg_description" {
  default = "this security group is created for frontend-alb"  
}

variable "bastion_sg_name" {
  default = "bastion"
}

variable "bastion_sg_description" {
  default = "this security group is created for bastion"  
}

variable "vpn_sg_name" {
  default = "vpn"
}

variable "vpn_sg_description" {
  default = "this security group is created for vpn"  
}








