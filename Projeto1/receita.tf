
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
  access_key = var.access_key
  secret_key = var.secret_key
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "instancia01" {
    #Variável tipo map
    ami           = lookup(var.amis, var.aws_region)
    #ami           = data.aws_ami.ubuntu.id
    instance_type = "t3.micro"
    depends_on    = [aws_s3_bucket.bucket1]
}

#Dependencia implicita
resource "aws_eip" "teste"{
    instance    = aws_instance.instancia01.id
    domain      = "vpc"
}

#Dependencia explicita, ver RECURSO: resource "aws_instance" "instancia01" {...}
resource "aws_s3_bucket" "bucket1" {
  bucket = "my-tf-test-bucket-alladio"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}   

resource "aws_security_group" "security_group" {
    name        = "allow_tls"
    description = "Allow TLS inbound traffic and all outbound traffic"
    #vpc_id      = aws_vpc.main.id
    ingress{
        description = "TLS from VPC"
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        #Variavel tipo lista
        cidr_blocks = var.sg_cidrs
        #cidr_blocks = ["191.177.187.214/32"]
        #ipv6_cidr_blocks = []
    }
    
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        #ipv6_cidr_blocks = ["::/0"]
    }
  tags = {
    Name = "allow_tls"
  }
}
