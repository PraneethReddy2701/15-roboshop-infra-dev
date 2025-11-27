variable "project" {
    default = "roboshop"  
}

variable "environment" {
    default = "dev" 
}

variable "frontend_sg_name" {
  default = "frontend"

}

variable "frontend_sg_description" {
    default = "this security group is created for frontend"
  
}

variable "sg_tags"{
    type = map(string)
    default = {}
}

