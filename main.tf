# Specify the provider and access details
provider "aws" {
  region = "${var.aws_region}"

  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
}

/////////////////////

resource "aws_key_pair" "anton-test1" {
  key_name = "anton-test1"
  public_key = "ssh-rsa AAAAB3NzaC1yc2aaEAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41 email@example.com"
}

////////////////////
resource "aws_iam_access_key" "rundeck-executor" {
    user = "rundeck-executor"
}

resource "aws_iam_user" "rundeck-executor" {
    name = "rundeck-executor"
    path = "/"
}
//////////////////////

//resource "aws_security_group" "default" {
//    name = "terraform_example"
//    description = "Used in the terraform"
//
//    # SSH access from anywhere
//    ingress {
//        from_port = 22
//        to_port = 22
//        protocol = "tcp"
//        cidr_blocks = ["0.0.0.0/0"]
//    }
//
//    # HTTP access from anywhere
//    ingress {
//        from_port = 80
//        to_port = 80
//        protocol = "tcp"
//        cidr_blocks = ["0.0.0.0/0"]
//    }
//
//    # outbound internet access
//    egress {
//        from_port = 0
//        to_port = 0
//        protocol = "-1"
//        cidr_blocks = ["0.0.0.0/0"]
//    }
//}


//resource "aws_elb" "web" {
//  name = "terraform-example-elb"
//
//  # The same availability zone as our instance
//  availability_zones = ["${aws_instance.web.availability_zone}"]
//
//  listener {
//    instance_port = 80
//    instance_protocol = "http"
//    lb_port = 80
//    lb_protocol = "http"
//  }
//
//  # The instance is registered automatically
//  instances = ["${aws_instance.web.id}"]
//}
//
//
//resource "aws_instance" "web" {
//  # The connection block tells our provisioner how to
//  # communicate with the resource (instance)
//  connection {
//    # The default username for our AMI
//    user = "ubuntu"
//
//    # The path to your keyfile
//    key_file = "${var.key_path}"
//  }
//
//  instance_type = "m1.small"
//
//  # Lookup the correct AMI based on the region
//  # we specified
//  ami = "${lookup(var.aws_amis, var.aws_region)}"
//
//  # The name of our SSH keypair you've created and downloaded
//  # from the AWS console.
//  #
//  # https://console.aws.amazon.com/ec2/v2/home?region=us-west-2#KeyPairs:
//  #
//  key_name = "${var.key_name}"
//
//  # Our Security group to allow HTTP and SSH access
//  security_groups = ["${aws_security_group.default.name}"]
//
//  # We run a remote provisioner on the instance after creating it.
//  # In this case, we just install nginx and start it. By default,
//  # this should be on port 80
//  provisioner "remote-exec" {
//    inline = [
//        "sudo apt-get -y update",
//        "sudo apt-get -y install nginx",
//        "sudo service nginx start"
//    ]
//  }
//}