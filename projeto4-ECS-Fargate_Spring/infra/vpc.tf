provider "aws"{
    region = var.region
}

terraform {
    backend "s3" {
      name = "value"
    }
}

resource "aws_vpc" "production-vpc" {
    cird_block = var.vpc_cidr
    enable_dns_hostnames = true

    tags{
        Names ="Production-VPC"
    }
}

resource "aws_subnet" "public-subnet-1"{
    cidr_block = var.public_subnet_1_cird
    vpc_id = aws_vpc.production-vpc.id
    availability_zone = "sa-east-1a"
    
    tags {
        name = "Public-Subnet-1"
    }
}

resource "aws_subnet" "public-subnet-2"{
    cidr_block = var.public_subnet_2_cird
    vpc_id = aws_vpc.production-vpc.id
    availability_zone = "sa-east-1b"
    
    tags {
        name = "Public-Subnet-2"
    }
}

resource "aws_subnet" "public-subnet-3"{
    cidr_block = var.public_subnet_3_cird
    vpc_id = aws_vpc.production-vpc.id
    availability_zone = "sa-east-1c"
    
    tags {
        name = "Public-Subnet-3"
    }
}