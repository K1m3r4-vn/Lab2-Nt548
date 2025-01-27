resource "aws_route_table" "public_rt" {
    vpc_id = var.vpc_id

route {
        cidr_block = "0.0.0.0/0"
        gateway_id = var.internet_gateway_id
    }

tags = {
        Name = "Public Subnet Route Table"
    }
}

resource "aws_route_table_association" "rt_associate_public_subnet" {
    subnet_id = var.public_subnet_id
    route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table" "private_rt" {
    vpc_id = var.vpc_id

      route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = var.nat_gateway_id
  }

tags = {
        Name = "Private Subnet Route Table"
    }
}

resource "aws_route_table_association" "rt_associate_private_subnet" {
    subnet_id = var.private_subnet_id
    route_table_id = aws_route_table.private_rt.id
}
