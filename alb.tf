resource "aws_alb" "david-alb" {
    name = "david-alb"
    internal = false
    security_groups = [aws_security_group.alb-sg.id]
    subnets = [
        aws_subnet.public_2a.id,
        aws_subnet.public_2b.id
    ]
    access_logs {
        bucket = aws_s3_bucket.david-alb.id
        prefix = "frontend-alb"
        enabled = true
    }
    tags = {
        Name = "david-alb"
    }
    lifecycle { create_before_destroy = true }
}

#alb target group
resource "aws_alb_target_group" "david-frontend" {
    name = "david-frontend-target-group"
    port = 80
    protocol = "HTTP"
    vpc_id = aws_vpc.david-vpc.id
    health_check {
        interval = 30
        path = "/"
        healthy_threshold = 3
        unhealthy_threshold = 3
    }
    tags = { Name = "david-Frontend Target Group" }
}

## 오토스케일링에서 ALB 사용하는 경우 아래 주석처리
## 개별 인스턴스에 연결하는 경우 아래 부분 추가

resource "aws_alb_target_group_attachment" "frontend" {
    target_group_arn = aws_alb_target_group.david-frontend.arn
    target_id = aws_instance.david_2a.id
    port = 80
}
resource "aws_alb_target_group_attachment" "frontend_1c" {
    target_group_arn = aws_alb_target_group.david-frontend.arn
    target_id = aws_instance.david_2b.id
    port = 80
}

resource "aws_alb_listener" "http" {
    load_balancer_arn = aws_alb.david-alb.arn
    port = "80"
    protocol = "HTTP"
    default_action {
        target_group_arn = aws_alb_target_group.david-frontend.arn
        type = "forward"
    }
}
