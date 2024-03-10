data "aws_ami" "amazon_linux" {
  #executable_users = ["self"]
  most_recent      = true
  #name_regex       = "^myami-\\d{3}"
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = [
        "amzn-ami-hvm-*-x86_64-gp2"
    ]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}