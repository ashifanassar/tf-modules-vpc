resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  route {
    cidr_block = var.DEFAULT_VPC_CIDR
    vpc_peering_connection_id = aws_vpc_peering_connection.peering.id
  }

  tags = {
    Name = "roboshop-${var.ENV}-public-rt"
  }
}


# Enables Public Route Table Association
resource "aws_route_table_association" "public_subnet_rt_associate" {
  count          = length(aws_subnet.public_subnet.*.id)

  subnet_id      = element(aws_subnet.public_subnet.*.id, count.index)
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.ngw.id
  } 


  route {
    cidr_block = var.DEFAULT_VPC_CIDR
    vpc_peering_connection_id = aws_vpc_peering_connection.peering.id
  }
  tags = {
    Name = "roboshop-${var.ENV}-private-rt"
  }
}

# Enables Private Route Table Association
resource "aws_route_table_association" "private_subnet_rt_associate" {
  count          = length(aws_subnet.private_subnet.*.id)

  subnet_id      = element(aws_subnet.private_subnet.*.id, count.index)
  route_table_id = aws_route_table.private_rt.id
}


# Add's peering route in teh default VPC Route Table 
resource "aws_route" "default_vpc_route" {
  route_table_id            = var.DEFAULT_VPC_RT
  destination_cidr_block    = var.VPC_CIDR
  vpc_peering_connection_id = aws_vpc_peering_connection.peering.id 
}