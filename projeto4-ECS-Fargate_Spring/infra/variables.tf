variable region {
  type        = string
  default     = "sa-east-1"
  description = "AWS Region"
}

variable "vpc_cidr"{
    default = "10.0.0.0/16"
    description = "VPC CIRD  Block"
}

variable "public_subnet_1_cird"{
    description = "Public Subnet 1 CIDR"
}

variable "public_subnet_2_cird"{
    description = "Public Subnet 2 CIDR"
}

variable "public_subnet_3_cird"{
    description = "Public Subnet 3 CIDR"
}

variable "private_subnet_1_cird"{
    description = "Private Subnet 3 CIDR"
}

variable "private_subnet_2_cird"{
    description = "Private Subnet 2 CIDR"
}

variable "private_subnet_2_cird"{
    description = "Private Subnet 2 CIDR"
}