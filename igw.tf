#Provisioning Internet Gateway

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "roboshop-${var.ENV}-igw"
  }
}