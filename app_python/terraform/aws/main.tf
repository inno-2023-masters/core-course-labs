terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "app_python" {
  ami           = "ami-03a6eaae9938c858c"
  instance_type = "t2.micro"

  tags = {
    Name = "app_python"
  }
}
