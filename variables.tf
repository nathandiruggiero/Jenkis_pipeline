variable "region" {
  type    = string
  default = "eu-west-3"
}

variable "create_instance" {
  type    = bool
  default = true
}

variable "instance_number" {
  type    = number
  default = 1
}

variable "instance_name" {
    type = string
    default = "instance_DI_RUGGIERO"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}


variable "id_vpc" {
    type = string
    default = "vpc-891839e0"
}

variable "ssh_key" {
  type    = string
  default = "tp_dev_ynov"
}
