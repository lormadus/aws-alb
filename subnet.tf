resource "aws_subnet" "public_2a" {
	vpc_id 			= aws_vpc.david-vpc.id
	availability_zone 	= "ap-northeast-2a"
	cidr_block		= "10.0.1.0/24"

	tags = {
		Name = "public_2a"
	}
}
	
