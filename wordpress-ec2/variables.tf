variable "cidr_block" {
  default = "10.16.0.0/16"

}

variable "az_a" {
  default = "us-east-1a"
}

variable "az_b" {
  default = "us-east-1b"
}

variable "az_c" {
  default = "us-east-1c"
}

variable "sn_reserved_a" {
  default = "10.16.0.0/20"
}

variable "sn_db_a" {
  default = "10.16.16.0/20"
}

variable "sn_app_a" {
  default = "10.16.32.0/20"
}

variable "sn_web_a" {
  default = "10.16.48.0/20"
}

variable "sn_reserved_b" {
  default = "10.16.64.0/20"
}

variable "sn_db_b" {
  default = "10.16.80.0/20"
}

variable "sn_app_b" {
  default = "10.16.96.0/20"
}

variable "sn_web_b" {
  default = "10.16.112.0/20"
}

variable "sn_reserved_c" {
  default = "10.16.128.0/20"
}

variable "sn_db_c" {
  default = "10.16.144.0/20"
}

variable "sn_app_c" {
  default = "10.16.160.0/20"
}

variable "sn_web_c" {
  default = "10.16.176.0/20"
}

variable "ami" {
  default = "ami-0b0dcb5067f052a63"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_pair" {
  default = "aha-key-pair"
}