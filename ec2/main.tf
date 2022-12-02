variable "availability_zone" {
    default = "us-east-1a"
}

variable "subnet" {
    default = "subnet-0cb37cbbb41ee9aae"
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
    availability_zone = var.availability_zone
    subnet_id         = var.subnet

    tags = {
        Name = "ebs-instance-test-${count.index}"
    }
}