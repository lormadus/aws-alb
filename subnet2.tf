resource "aws_subnet" "public_2b" {
	vpc_id 			= aws_vpc.david-vpc.id
	availability_zone 	= "ap-northeast-2b"
	cidr_block		= "10.0.2.0/24"

	tags = {
		Name = "public_2b"
	}
}
	
