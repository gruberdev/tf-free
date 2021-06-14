resource "aws_security_group" "security_group" {
  name        = var.security_group_name
  description = var.security_group_description

  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
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
    Name = var.security_group_name
  }
}

resource "aws_instance" "ec2" {

  ami           = var.ami
  instance_type = var.instance_type

  subnet_id                   = var.public_subnet_id
  vpc_security_group_ids      = [aws_security_group.security_group.id]
  associate_public_ip_address = true
  user_data                   = var.seed_data

  tags = {
    Name = var.name
  }
}


resource "aws_key_pair" "ec2_key_pair" {
  key_name   = var.ssh_name
  public_key = var.ssh_public
}
