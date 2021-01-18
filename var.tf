variable "amazon_linux" {
  default = "ami-007b7745d0725de95"
}

variable "dev_keyname" {
  default = "david2-key"
}

## Region별 ALB Account ID 별도 지정
## https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/enable-access-logs.html 
variable "alb_account_id" {
  default = "600734575887"
  
}
