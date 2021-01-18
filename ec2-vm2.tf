resource "aws_instance" "david_2b" {
  ami               = var.amazon_linux
  availability_zone = "ap-northeast-2b"
  instance_type     = "t3.nano"
  key_name          = var.dev_keyname
  vpc_security_group_ids = [
    aws_security_group.ec2-sg.id,
    aws_default_security_group.default-sg.id,
  ]

  subnet_id                   = aws_subnet.public_2b.id
  associate_public_ip_address = true

  user_data = <<USER_DATA
#!/bin/bash
apt-get update -y

#### ALB만 설정하는 경우 아래 사용
apt-get install apache2 -y
echo "<html>" > /var/www/html/index.html
echo "Hello" >> /var/www/html/index.html
echo "</html>" >> /var/www/html/index.html

USER_DATA


  tags = {
    Name = "david-linux-2b"
  }
}
