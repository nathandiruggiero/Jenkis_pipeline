terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Région aws

provider "aws" {
  region     = var.region
}

# VPC utilisé

resource "aws_default_vpc" "default" {
  tags = {
    Name = var.instance_name
  }
}

# Création instance

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  count         = var.create_instance ? var.instance_number : 0
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name      = var.ssh_key
  tags = {
    Name = var.instance_name
  }
}


# Sécurity group 

resource "aws_security_group" "security_group_DI_RUGGIERO" {
   name        = "security_group_DI_RUGGIERO"
   description = "security_group_DI_RUGGIERO"

   ingress {
      description = "Autorisation SSH Port"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
   }

   ingress {
      description = "Autorisation Web Port"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
   }

   egress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
   }
}
