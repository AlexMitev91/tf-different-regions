terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  alias  = "east"
}

provider "aws" {
  region = "us-west-2"
  alias  = "west"
}

resource "aws_instance" "east" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"
  provider      = aws.east
}

resource "aws_instance" "west" {
  ami           = "ami-03f65b8614a860c29"
  instance_type = "t2.micro"
  provider      = aws.west
}
