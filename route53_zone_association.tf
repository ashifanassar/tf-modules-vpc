# This ensure VPC is enrolled on this zone, then only dns translation of this domain will work
resource "aws_route53_zone_association" "vpc" {
  zone_id = var.PRIVATE_HOSTEDZONE_ID
  vpc_id  = aws_vpc.main.id
}