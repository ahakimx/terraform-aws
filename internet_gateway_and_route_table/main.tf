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
  vpc_id                          = aws_vpc.aha_vpc1.id
  cidr_block                      = var.sn_reserved_a
  availability_zone               = var.az_a
  ipv6_cidr_block                 = cidrsubnet(aws_vpc.aha_vpc1.ipv6_cidr_block, 8, 00)
  assign_ipv6_address_on_creation = true

  tags = {
    "Name" = "sn-reserved-A"
  }
}

resource "aws_subnet" "sn_db_a" {
  vpc_id                          = aws_vpc.aha_vpc1.id
  cidr_block                      = var.sn_db_a
  availability_zone               = var.az_a
  ipv6_cidr_block                 = cidrsubnet(aws_vpc.aha_vpc1.ipv6_cidr_block, 8, 01)
  assign_ipv6_address_on_creation = true

  tags = {
    "Name" = "sn-db-A"
  }
}

resource "aws_subnet" "sn_app_a" {
  vpc_id                          = aws_vpc.aha_vpc1.id
  cidr_block                      = var.sn_app_a
  availability_zone               = var.az_a
  ipv6_cidr_block                 = cidrsubnet(aws_vpc.aha_vpc1.ipv6_cidr_block, 8, 02)
  assign_ipv6_address_on_creation = true

  tags = {
    "Name" = "sn-app-A"
  }
}

resource "aws_subnet" "sn_web_a" {
  vpc_id                          = aws_vpc.aha_vpc1.id
  cidr_block                      = var.sn_web_a
  availability_zone               = var.az_a
  ipv6_cidr_block                 = cidrsubnet(aws_vpc.aha_vpc1.ipv6_cidr_block, 8, 03)
  assign_ipv6_address_on_creation = true
  map_public_ip_on_launch         = true

  tags = {
    "Name" = "sn-web-A"
  }
}

##############################
######## Subnet AZ-B #########
##############################
resource "aws_subnet" "sn_reserved_b" {
  vpc_id                          = aws_vpc.aha_vpc1.id
  cidr_block                      = var.sn_reserved_b
  availability_zone               = var.az_b
  ipv6_cidr_block                 = cidrsubnet(aws_vpc.aha_vpc1.ipv6_cidr_block, 8, 04)
  assign_ipv6_address_on_creation = true

  tags = {
    "Name" = "sn-reserved-B"
  }
}

resource "aws_subnet" "sn_db_b" {
  vpc_id                          = aws_vpc.aha_vpc1.id
  cidr_block                      = var.sn_db_b
  availability_zone               = var.az_b
  ipv6_cidr_block                 = cidrsubnet(aws_vpc.aha_vpc1.ipv6_cidr_block, 8, 05)
  assign_ipv6_address_on_creation = true

  tags = {
    "Name" = "sn-db-B"
  }
}

resource "aws_subnet" "sn_app_b" {
  vpc_id                          = aws_vpc.aha_vpc1.id
  cidr_block                      = var.sn_app_b
  availability_zone               = var.az_b
  ipv6_cidr_block                 = cidrsubnet(aws_vpc.aha_vpc1.ipv6_cidr_block, 8, 06)
  assign_ipv6_address_on_creation = true

  tags = {
    "Name" = "sn-app-B"
  }
}

resource "aws_subnet" "sn_web_b" {
  vpc_id                          = aws_vpc.aha_vpc1.id
  cidr_block                      = var.sn_web_b
  availability_zone               = var.az_b
  ipv6_cidr_block                 = cidrsubnet(aws_vpc.aha_vpc1.ipv6_cidr_block, 8, 07)
  assign_ipv6_address_on_creation = true
  map_public_ip_on_launch         = true

  tags = {
    "Name" = "sn-web-B"
  }
}

##############################
######## Subnet AZ-C #########
##############################
resource "aws_subnet" "sn_reserved_c" {
  vpc_id                          = aws_vpc.aha_vpc1.id
  cidr_block                      = var.sn_reserved_c
  availability_zone               = var.az_c
  ipv6_cidr_block                 = cidrsubnet(aws_vpc.aha_vpc1.ipv6_cidr_block, 8, 08)
  assign_ipv6_address_on_creation = true

  tags = {
    "Name" = "sn-reserved-C"
  }
}

resource "aws_subnet" "sn_db_c" {
  vpc_id                          = aws_vpc.aha_vpc1.id
  cidr_block                      = var.sn_db_c
  availability_zone               = var.az_c
  ipv6_cidr_block                 = cidrsubnet(aws_vpc.aha_vpc1.ipv6_cidr_block, 8, 09)
  assign_ipv6_address_on_creation = true

  tags = {
    "Name" = "sn-db-C"
  }
}

resource "aws_subnet" "sn_app_c" {
  vpc_id                          = aws_vpc.aha_vpc1.id
  cidr_block                      = var.sn_app_c
  availability_zone               = var.az_c
  ipv6_cidr_block                 = cidrsubnet(aws_vpc.aha_vpc1.ipv6_cidr_block, 8, 10)
  assign_ipv6_address_on_creation = true

  tags = {
    "Name" = "sn-app-C"
  }
}

resource "aws_subnet" "sn_web_c" {
  vpc_id                          = aws_vpc.aha_vpc1.id
  cidr_block                      = var.sn_web_c
  availability_zone               = var.az_c
  ipv6_cidr_block                 = cidrsubnet(aws_vpc.aha_vpc1.ipv6_cidr_block, 8, 11)
  assign_ipv6_address_on_creation = true
  map_public_ip_on_launch         = true

  tags = {
    "Name" = "sn-web-C"
  }
}

###################################
######## Internet Gateway #########
###################################

resource "aws_internet_gateway" "aha_vpc1_igw" {
  vpc_id = aws_vpc.aha_vpc1.id

  tags = {
    Name = "aha-vpc1-igw"
  }
}

################################
######## Route Table ###########
################################
resource "aws_route_table" "aha_vpc1_rt_table" {
  vpc_id = aws_vpc.aha_vpc1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.aha_vpc1_igw.id
  }

  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = aws_internet_gateway.aha_vpc1_igw.id
  }
  tags = {
    Name = "aha-vpc1-rt-web"
  }
}

############################################
######## Route Table Association ###########
############################################
resource "aws_route_table_association" "rta_web_a" {
  subnet_id      = aws_subnet.sn_web_a.id
  route_table_id = aws_route_table.aha_vpc1_rt_table.id
}

resource "aws_route_table_association" "rta_web_b" {
  subnet_id      = aws_subnet.sn_web_b.id
  route_table_id = aws_route_table.aha_vpc1_rt_table.id
}

resource "aws_route_table_association" "rta_web_c" {
  subnet_id      = aws_subnet.sn_web_c.id
  route_table_id = aws_route_table.aha_vpc1_rt_table.id
}

##################################
######## EC2 Instance ############
##################################
resource "aws_instance" "aha_bastion" {
  ami               = var.ami
  instance_type     = var.instance_type
  availability_zone = var.az_a
  subnet_id         = aws_subnet.sn_web_a.id
  key_name          = var.bastion_key_name

  vpc_security_group_ids = [
    aws_security_group.aha_sg.id
  ]

  tags = {
    Name = "aha-bastion"
  }
}
####################################
######## Security Group ############
####################################
resource "aws_security_group" "aha_sg" {
  name   = "aha-bastion-sg"
  vpc_id = aws_vpc.aha_vpc1.id

  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
  protocol = "-1"
  from_port = 0
  to_port = 0
  cidr_blocks = ["0.0.0.0/0"]
  }
}