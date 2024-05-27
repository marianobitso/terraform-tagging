terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0.0"
    }
  }
}

variable "repository" {}

variable "environment" {}

variable "project_path" {}

module "my_module" {
  source       = "./modules"
  repository   = var.repository
  environment  = var.environment
  project_path = var.project_path
}

provider "aws" {
  # other AWS provider configuration...

  default_tags {
    tags = module.my_module.tags
  }
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}
