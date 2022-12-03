#######################
####### VPC ###########
#######################

resource "aws_vpc" "aha_vpc1" {
  cidr_block                       = var.cidr_block
  enable_dns_hostnames             = true
  enable_dns_support               = true
  assign_generated_ipv6_cidr_block = true

  tags = {
    Name = "aha-vpc1"
  }
}

##############################
######## Subnet AZ-A #########
##############################
resource "aws_subnet" "sn_reserved_a" {
  vpc_id                          = aws_vpc.aha_vpc2.id
  cidr_block                      = var.sn_reserved_a
  availability_zone               = var.az_a
  ipv6_cidr_block                 = cidrsubnet(aws_vpc.aha_vpc2.ipv6_cidr_block, 8, 00)
  assign_ipv6_address_on_creation = true

  tags = {
    "Name" = "sn-reserved-A"
  }
}

resource "aws_subnet" "sn_db_a" {
  vpc_id                          = aws_vpc.aha_vpc2.id
  cidr_block                      = var.sn_db_a
  availability_zone               = var.az_a
  ipv6_cidr_block                 = cidrsubnet(aws_vpc.aha_vpc2.ipv6_cidr_block, 8, 01)
  assign_ipv6_address_on_creation = true

  tags = {
    "Name" = "sn-db-A"
  }
}

resource "aws_subnet" "sn_app_a" {
  vpc_id                          = aws_vpc.aha_vpc2.id
  cidr_block                      = var.sn_app_a
  availability_zone               = var.az_a
  ipv6_cidr_block                 = cidrsubnet(aws_vpc.aha_vpc2.ipv6_cidr_block, 8, 02)
  assign_ipv6_address_on_creation = true

  tags = {
    "Name" = "sn-app-A"
  }
}

resource "aws_subnet" "sn_web_a" {
  vpc_id                          = aws_vpc.aha_vpc2.id
  cidr_block                      = var.sn_web_a
  availability_zone               = var.az_a
  ipv6_cidr_block                 = cidrsubnet(aws_vpc.aha_vpc2.ipv6_cidr_block, 8, 03)
  assign_ipv6_address_on_creation = true

  tags = {
    "Name" = "sn-web-A"
  }
}

##############################
######## Subnet AZ-B #########
##############################
resource "aws_subnet" "sn_reserved_b" {
  vpc_id                          = aws_vpc.aha_vpc2.id
  cidr_block                      = var.sn_reserved_b
  availability_zone               = var.az_b
  ipv6_cidr_block                 = cidrsubnet(aws_vpc.aha_vpc2.ipv6_cidr_block, 8, 04)
  assign_ipv6_address_on_creation = true

  tags = {
    "Name" = "sn-reserved-B"
  }
}

resource "aws_subnet" "sn_db_b" {
  vpc_id                          = aws_vpc.aha_vpc2.id
  cidr_block                      = var.sn_db_b
  availability_zone               = var.az_b
  ipv6_cidr_block                 = cidrsubnet(aws_vpc.aha_vpc2.ipv6_cidr_block, 8, 05)
  assign_ipv6_address_on_creation = true

  tags = {
    "Name" = "sn-db-B"
  }
}

resource "aws_subnet" "sn_app_b" {
  vpc_id                          = aws_vpc.aha_vpc2.id
  cidr_block                      = var.sn_app_b
  availability_zone               = var.az_b
  ipv6_cidr_block                 = cidrsubnet(aws_vpc.aha_vpc2.ipv6_cidr_block, 8, 06)
  assign_ipv6_address_on_creation = true

  tags = {
    "Name" = "sn-app-B"
  }
}

resource "aws_subnet" "sn_web_b" {
  vpc_id                          = aws_vpc.aha_vpc2.id
  cidr_block                      = var.sn_web_b
  availability_zone               = var.az_b
  ipv6_cidr_block                 = cidrsubnet(aws_vpc.aha_vpc2.ipv6_cidr_block, 8, 07)
  assign_ipv6_address_on_creation = true

  tags = {
    "Name" = "sn-web-B"
  }
}

##############################
######## Subnet AZ-C #########
##############################
resource "aws_subnet" "sn_reserved_c" {
  vpc_id                          = aws_vpc.aha_vpc2.id
  cidr_block                      = var.sn_reserved_c
  availability_zone               = var.az_c
  ipv6_cidr_block                 = cidrsubnet(aws_vpc.aha_vpc2.ipv6_cidr_block, 8, 08)
  assign_ipv6_address_on_creation = true

  tags = {
    "Name" = "sn-reserved-C"
  }
}

resource "aws_subnet" "sn_db_c" {
  vpc_id                          = aws_vpc.aha_vpc2.id
  cidr_block                      = var.sn_db_c
  availability_zone               = var.az_c
  ipv6_cidr_block                 = cidrsubnet(aws_vpc.aha_vpc2.ipv6_cidr_block, 8, 09)
  assign_ipv6_address_on_creation = true

  tags = {
    "Name" = "sn-db-C"
  }
}

resource "aws_subnet" "sn_app_c" {
  vpc_id                          = aws_vpc.aha_vpc2.id
  cidr_block                      = var.sn_app_c
  availability_zone               = var.az_c
  ipv6_cidr_block                 = cidrsubnet(aws_vpc.aha_vpc2.ipv6_cidr_block, 8, 10)
  assign_ipv6_address_on_creation = true

  tags = {
    "Name" = "sn-app-C"
  }
}

resource "aws_subnet" "sn_web_c" {
  vpc_id                          = aws_vpc.aha_vpc2.id
  cidr_block                      = var.sn_web_c
  availability_zone               = var.az_c
  ipv6_cidr_block                 = cidrsubnet(aws_vpc.aha_vpc2.ipv6_cidr_block, 8, 11)
  assign_ipv6_address_on_creation = true

  tags = {
    "Name" = "sn-web-C"
  }
}