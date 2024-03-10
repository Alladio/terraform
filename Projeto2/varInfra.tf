variable "aws_region" {
  description   = "AWS region"
  default       = "us-east-1"
  type          = string
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