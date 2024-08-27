resource "aws_internet_gateway" "prod-igw" {
  vpc_id = aws_vpc.prod.id
  tags = {
      Name = "prod-igw"
  }
}

resource "aws_route_table" "prod-public-crt" {
  vpc_id = aws_vpc.prod.id

  route {
    //associated subnet can reach everywhere
    cidr_block = "0.0.0.0/0"
    //CRT uses this IGW to reach internet
    gateway_id = aws_internet_gateway.prod-igw.id
  }

  tags = {
      Name = "prod-public-2-igw"
  }
}

# resource "aws_route_table" "prod-private-crt" {
#   vpc_id = aws_vpc.bu1.id
  

# #   route {
# #     //associated subnet can reach everywhere
# #     cidr_block = "0.0.0.0/0"
# #     //CRT uses this IGW to reach internet
# #     gateway_id = aws_internet_gateway.bu1-igw.id
# #   }
# #   route = {
# #     cidr_block = "10.100.0.0/16"
# #     gateway_id = "local"
# #   }

#   tags = {
#       Name = "bu1-main-rt"
#   }
# }

resource "aws_route_table_association" "prod-public-sub" {
  subnet_id      = aws_subnet.public-vpc-prod.id
  route_table_id = aws_route_table.prod-public-crt.id
}

# resource "aws_main_route_table_association" "main_rt" {
#   vpc_id = aws_vpc.bu1.id
#   route_table_id = aws_route_table.prod-public-crt.id
# }

# resource "aws_main_route_table_association" "main_rt" {
#   vpc_id = aws_vpc.bu1.id
#   route_table_id = aws_route_table.prod-private-crt.id
# }