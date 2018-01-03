# sample terraform file to create an AWS EC2 instance
provider "aws" {
  version = "~> 1.6"
  region = "us-west-2"
}

resource "aws_instance" "exampleinstance" {
 ami = "ami-b55a51cc"
 instance_type = "t2.micro"
 availability_zone = "us-west-2a"
 subnet_id = "subnet-fdbb3198"
 associate_public_ip_address = "true"
 key_name = "andy.rajagopalan"
security_groups = ["sg-15576a70","sg-934a74f6"]
}
