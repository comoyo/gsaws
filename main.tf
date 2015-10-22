# Specify the provider and access details
provider "aws" {
  region = "${var.aws_region}"

  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
}

/////////////////////

resource "aws_key_pair" "deployer" {
  key_name = "deployer"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA0sUjdTEcOWYgQ7ESnHsSkvPUO2tEvZxxQHUZYh9j6BPZgfn13iYhfAP2cfZznzrV+2VMamMtfiAiWR39LKo/bMN932HOp2Qx2la14IbiZ91666FD+yZ4+vhR2IVhZMe4D+g8FmhCfw1+zZhgl8vQBgsRZIcYqpYux59FcPv0lP1EhYahoRsUt1SEU2Gj+jvgyZpe15lnWk2VzfIpIsZ++AeUqyHoJHV0RVOK4MLRssqGHye6XkA3A+dMm2Mjgi8hxoL5uuwtkIsAll0kSfL5O2G26nsxm/Fpcl+SKSO4gs01d9V83xiOwviyOxmoXzwKy4qaUGtgq1hWncDNIVG/aQ== anton+deployer@example.com"
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