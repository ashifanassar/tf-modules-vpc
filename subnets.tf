resource "aws_subnet" "public_subnet" {
    count                      = length(var.PUBLIC_SUBNET_CIDR)
    vpc_id                     = aws_vpc.main.id
    cidr_block                 = element(var.PUBLIC_SUBNET_CIDR, count.index)
    map_public_ip_on_launch    = true 
    availability_zone        = element(var.AZ, count.index+1) 


  tags = {
    Name                       = "roboshop-${var.ENV}-public-subnet-${count.index+1}"
  }
}



resource "aws_route_table_association" "public_subnet_rt_association" {
  count = length(aws_subnet.public_subnet.*.id)
  subnet_id      = element(aws_subnet.public_subnet.*.id, count.index)
  route_table_id = aws_route_table.public_rt.id
}






resource "aws_subnet" "private_subnet" {
    count                   = length(var.PRIVATE_SUBNET_CIDR)
    vpc_id                  = aws_vpc.main.id
    cidr_block              = element(var.PRIVATE_SUBNET_CIDR, count.index)
    availability_zone       = element(var.AZ, count.index+1) 


  tags = {
    Name                    = "roboshop-${var.ENV}-private-subnet-${count.index+1}"
  }
}



resource "aws_route_table_association" "private_subnet_rt_association" {
  count = length(aws_subnet.private_subnet.*.id)
  subnet_id      = element(aws_subnet.private_subnet.*.id, count.index)
  route_table_id = aws_route_table.private_rt.id
}