######## Create vpcbu1 ########

resource "aws_vpc" "prod" {
  cidr_block           = "10.1.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "vpc-prod"
  }
}



######## public subnet bu1 #######
resource "aws_subnet" "public-vpc-prod" {
  vpc_id                  = aws_vpc.prod.id
  cidr_block              = "10.1.10.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ca-central-1a"
}

# resource "aws_subnet" "private-vpc-prod" {
#   vpc_id                  = aws_vpc.prod.id
#   cidr_block              = "10.100.1.0/24"
#   map_public_ip_on_launch = false
#   availability_zone       = "ca-central-1a"
# }

