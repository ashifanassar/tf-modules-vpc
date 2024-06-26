output "VPC_ID" {
    value = aws_vpc.main.id 
}

output "VPC_CIDR" {
    value = aws_vpc.main.cidr_block
}

output "PRIVATE_SUBNET_IDS" {
    value =  aws_subnet.private_subnet.*.id
}

output "PUBLIC_SUBNET_IDS" {
    value = aws_subnet.public_subnet.*.id
}

output "PRIVATE_SUBNET_CIDR" {
    value = aws_subnet.private_subnet.*.cidr_block
}

output "PUBLIC_SUBNET_CIDR" {
    value = aws_subnet.public_subnet.*.cidr_block
}

output "DEFAULT_VPC_ID" {
    value = var.DEFAULT_VPC_ID
}   

output "DEFAULT_VPC_CIDR" {
    value = var.DEFAULT_VPC_CIDR
}




output "PUBLIC_HOSTEDZONE_ID" {
    value = var.PUBLIC_HOSTEDZONE_ID
}

output "PUBLIC_HOSTEDZONE_NAME" {
    value = var.PUBLIC_HOSTEDZONE_NAME
}

output "PRIVATE_HOSTEDZONE_ID" {
    value = var.PRIVATE_HOSTEDZONE_ID
}

output "PRIVATE_HOSTEDZONE_NAME" {
    value = var.PRIVATE_HOSTEDZONE_NAME
}