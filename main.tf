terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0.0"
    }
  }
}

module "my_module" {
  source = "./modules"
}

provider "aws" {
  # other AWS provider configuration...

  default_tags {
    tags = module.my_module.exported_tags
  }
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}
