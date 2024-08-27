######## Create vpcdev ########

resource "aws_vpc" "shared" {
  cidr_block           = "10.3.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "vpc-shared"
  }
}



######## public subnet dev #######
resource "aws_subnet" "public-vpc-shared" {
  vpc_id                  = aws_vpc.shared.id
  cidr_block              = "10.3.10.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ca-central-1a"
}

# resource "aws_subnet" "private-vpc-dev" {
#   vpc_id                  = aws_vpc.dev.id
#   cidr_block              = "10.100.1.0/24"
#   map_public_ip_on_launch = false
#   availability_zone       = "ca-central-1a"
# }

