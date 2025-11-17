resource "aws_vpc" "demo_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "public" {
  cidr_block = "10.0.1.0/24"
  vpc_id     = aws_vpc.demo_vpc.id
}

resource "aws_instance" "demo_ec2" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public.id

  depends_on = [
    aws_vpc.demo_vpc,
    aws_subnet.public
  ]
}
