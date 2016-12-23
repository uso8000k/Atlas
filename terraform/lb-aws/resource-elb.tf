resource "aws_elb" "elb1" {
  subnets             = [
    "${aws_subnet.vpc1_public_subnet1.id}"
  ]
  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
  instances           = [
    "${aws_instance.nodes1.*.id}",
  ]
  tags {
    Name = "${var.app_name}"
  }
}
