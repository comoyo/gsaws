resource "aws_security_group" "hello_instance_sg" {
  name = "hello-instance-sg"
  description = "SG applied to each hello-world instances"
  vpc_id = "${aws_vpc.default.id}"

  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "hello_elb_sg" {
  name = "hello-elb-sg"
  description = "SG applied to the hello-world elastic load balancer"
  vpc_id = "${aws_vpc.default.id}"

  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_launch_configuration" "hello_as_conf" {
  name = "hello-as-launch-config-${var.timestamp}"
  image_id = "${lookup(var.aws_amis, var.aws_region)}"
  instance_type = "t2.micro"
  key_name = "${var.aws_key_name}"
  security_groups = ["${aws_security_group.hello_instance_sg.id}"]
  associate_public_ip_address = true
  user_data = "${file(\"ec2_bootstrap.sh\")}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "hello_as" {
  availability_zones = ["eu-west-1a", "eu-west-1b"]
  vpc_zone_identifier = ["${aws_subnet.eu-west-1a-private.id}", "${aws_subnet.eu-west-1b-private.id}"]
  name = "hello-autoscaling-group-${var.timestamp}"
  min_size = "${var.asg_min_size}"
  max_size = "${var.asg_max_size}"
  desired_capacity = "${var.asg_desired_capacity}"
  health_check_grace_period = 300
  health_check_type = "ELB"
  force_delete = true
  launch_configuration = "${aws_launch_configuration.hello_as_conf.id}"
  load_balancers = ["${aws_elb.hello-elb.name}"]

  tag {
    key = "Name"
    value = "hello_web"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }

}

resource "aws_elb" "hello-elb" {
  name = "hello-elb"
  subnets = ["${aws_subnet.eu-west-1a-public.id}", "${aws_subnet.eu-west-1b-public.id}"]
  security_groups = ["${aws_security_group.hello_elb_sg.id}"]
  internal = false
  cross_zone_load_balancing = true
  
  listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 8080
    lb_protocol = "http" 
  }
 
  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    target = "HTTP:80/"
    interval = 5
  }
 
  lifecycle {
    create_before_destroy = true
  }

}
