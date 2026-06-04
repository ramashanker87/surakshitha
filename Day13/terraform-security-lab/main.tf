resource "aws_s3_bucket" "insecure_bucket" {
  bucket = "surakshitha-insecure-demo-bucket-20260603"

  tags = {
    Name = "InsecureBucket"
  }
}

resource "aws_security_group" "insecure_sg" {
  name        = "insecure-sg"
  description = "Open SSH access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}