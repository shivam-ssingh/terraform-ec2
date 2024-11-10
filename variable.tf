variable "vpc_cider" {
  description = "value"
  type = string
  default = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "value"
  type = string
  default = "ProjectVPC"
}

variable "subnet_cidr" {
  description = "value"
  type = string
  default = "10.0.1.0/24"
}

variable "subnet_name" {
  description = "value"
  type = string
  default = "ProjectSubnet"
}

variable "igw_name" {
  description = "value"
  type = string
  default = "ProjectIGW"
}

variable "ec2_ami" {
  description = "value"
  type = string
  default ="ami-02db68a01488594c5"
}

variable "ec2_name" {
  description = "value"
  type = string
  default = "ProjectEC2"
}