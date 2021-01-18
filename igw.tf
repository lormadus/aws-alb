resource "aws_internet_gateway" "david-igw" {
  vpc_id = aws_vpc.david-vpc.id

  tags = {
    Name = "david-igw"
  }
}
