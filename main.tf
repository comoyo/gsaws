# Specify the provider and access details
provider "aws" {
  region = "${var.aws_region}"

  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
}

/////////////////////

resource "aws_key_pair" "anton-test1" {
  key_name = "anton-test1"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDT+/X/JecYcmH5JCj9oY0Hj48WOEPQlRtdpq3F2FVbqkDddNEO/WK/FuFzIzV54nykCei+BSiSgauCGEHqUVg0DS07+LZ3zHPkM06LXPnnBELdDvPH+D8a5gMkj7cCreuoZolhfPyS29ha30J8Eh+/3+oIGXTNRrMfciNew8vvsP27wER+2yrmEb/8SxashN3FuaSWI1cj7Jdz1h8NvevOzk0vUOCeb0jb8ZCJEedHj6V+DaY1MMTy2JSrO54ct5TtkSii0XfBKTVlaKnpbGsRQBxeAjAata5bjsy1yRl+W6bLEvQ4N2LSKcJN6Utt/ecSwpXKDLukzaBdHP7jV1Er email@example.com"
}

////////////////////
//resource "aws_iam_access_key" "rundeck-executor" {
//    user = "rundeck-executor"
//}

//resource "aws_iam_user" "rundeck-executor" {
//    name = "rundeck-executor"
//    path = "/"
//}
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