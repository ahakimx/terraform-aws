#################################
######## EC2 Instance ###########
#################################
resource "aws_instance" "ecs-protect" {
  ami           = var.ami
  instance_type = var.instance_type
  count         = var.instance_count

  tags = {
    Name = "ec2-protect-${count.index}"
  }
}
