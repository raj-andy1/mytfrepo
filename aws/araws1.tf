# sample terraform file to create an AWS EC2 instance
provider "aws" {
  version = "~> 1.6"
  region = "us-west-2"
}

resource "aws_instance" "exampleinstance" {
#RHEL-7.3-4 AMI
 ami = "ami-b55a51cc"
 instance_type = "t2.micro"
 availability_zone = "us-west-2a"
 subnet_id = "subnet-fdbb3198"
 associate_public_ip_address = "true"
 key_name = "andy.rajagopalan"
security_groups = ["sg-15576a70","sg-934a74f6"]
provisioner "remote-exec" {
    inline = [
      "sudo curl -k https://ec2-52-38-176-168.us-west-2.compute.amazonaws.com:8140/packages/current/install.bash | bash -s extension_requests:pp_role=demo-webserver extension_requests:pp_created_by=AndyR extension_requests:pp_department=TSE",
    ]
  connection {
    type = "ssh"
    user = "ec2-user"
    private_key = "${file("/Users/andyr/.ssh/id_rsa")}"
  }
  }
tags = {
    name       = "andy.rajagopalan",
    department = "tse",
    project    = "self-practice",
    created_by = "Andy R",
  }
}
