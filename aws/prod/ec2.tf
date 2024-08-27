resource "aws_instance" "prod-vm-1" {
  ami           = var.ami
  instance_type = "t2.micro"
  # VPC
  subnet_id = aws_subnet.public-vpc-prod.id

  vpc_security_group_ids = [aws_security_group.allow_all.id]

  key_name  = var.ec2_key

  tags = {
    Name  = "prod-vm-1"
    Owner = "s.iannetta@f5.com"
  }

}
