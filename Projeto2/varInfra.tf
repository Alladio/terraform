variable "aws_region" {
  description   = "AWS region"
  type          = string
  default       = "us-east-1"
}

variable "availability_zone_names" {
  type    = list(string)
  default = ["us-west-1a"]
}

variable "docker_ports" {
  type = list(object({
    internal = number
    external = number
    protocol = string
  }))
  default = [
    {
      internal = 8300
      external = 8300
      protocol = "tcp"
    }
  ]
}

variable "sg_cidrs"{
    type    = list(string)
    #Variáveis tipo lista
    default = ["191.177.187.214/32","191.177.187.215/32"]       
}

#Variáveis do tipo MAP
variable "amis"{
    type    = map
    default = {
        "us-east-1" = "ami-1"
        "sa-east-1" = "ami-2" 
    } 
}

variable "vpc_name" {
  description   = "Name of VPC"
  type          = string
  default       = "my-vpc"
}


variable "vpc_cidr" {
  description   = "CIDR of VPC"
  type          = string
  default       = "10.0.0.0/16"
}

variable "vpc_azs"{
  description   = "Name of VPC"
  type    = list(string)
  default = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
}

variable "private_subnets"{
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "public_subnets"{
  description   = "Name of VPC"
  type    = list(string)
  default = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

variable "enable_nat_gateway"{
  description   = "Enabled NAT Gateway for VPC"
  type    = bool
  default = true
}
variable "enable_vpn_gateway"{
  description   = "Enabled VPN Gateway for VPC"
  type    = bool
  default = true
}
variable "vpc_tags"{
  type    = map
  default = {
    Terraform = "true"
    Environment = "dev"
  }
} 