variable "availability_zone" {
  type = map(string)
  default = {
    az_a = "us-east-1a"
    az_b = "us-east-1b"
  }
}

variable "subnet" {
  type = map(string)
  default = {
    sn-web-A = "subnet-0cb37cbbb41ee9aae"
    sn-web-B = "subnet-0fbe646eedf530a8b"
  }
}

variable "ami" {
  default = "ami-0b0dcb5067f052a63"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "region" {
  default = "us-east-1"
}

variable "instance_count" {
  default = "2"
}

resource "aws_instance" "ebs-instance-test" {
  count             = var.instance_count
  ami               = var.ami
  instance_type     = var.instance_type
  availability_zone = var.availability_zone["az_a"]
  subnet_id         = var.subnet["sn-web-A"]
  tags = {
    Name = "ebs-instance-test-${count.index}"
  }
}

resource "aws_instance" "ebs-instance-test-2" {
  count             = 1
  ami               = var.ami
  instance_type     = var.instance_type
  availability_zone = var.availability_zone["az_b"]
  subnet_id         = var.subnet["sn-web-B"]
  tags = {
    Name = "ebs-instance-test-${count.index}"
  }
}