# sample terraform file to create an AWS EC2 instance
provider "aws" {}

resource "aws_instance" "exampleinstance" {
 ami = "ami-b55a51cc"
 instance_type = "t2.micro"
}
