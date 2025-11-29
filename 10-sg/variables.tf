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

variable "frontend_sg_name" {
  default = "frontend"
}

variable "frontend_sg_description" {
    default = "this security group is created for frontend"  
}


variable "bastion_sg_name" {
  default = "bastion"
}

variable "bastion_sg_description" {
    default = "this security group is created for bastion"  
}