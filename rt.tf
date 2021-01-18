resource "aws_route_table" "david-rt" {
  vpc_id = aws_vpc.david-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.david-igw.id
  }

  tags = {
    Name = "david-rt"
  }
}

resource "aws_route_table_association" "public_2a" {
  subnet_id      = aws_subnet.public_2a.id
  route_table_id = aws_route_table.david-rt.id
}

resource "aws_route_table_association" "public_2b" {
  subnet_id      = aws_subnet.public_2b.id
  route_table_id = aws_route_table.david-rt.id
}
