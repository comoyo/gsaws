output "elb_dns_name" {
  value = "${aws_elb.hello-elb.dns_name}"
}