resource "aws_security_group" "alb-sg" {
  name        = "alb-sg"
  description = "open HTTP port for ALB"

  vpc_id = aws_vpc.david-vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ALB"
  }
}
