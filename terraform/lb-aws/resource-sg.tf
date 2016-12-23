resource "aws_security_group" "allow_all" {
  vpc_id      = "${aws_vpc.vpc1.id}"
  ingress {
    from_port     = 0
    to_port       = 0
    protocol      = "-1"
    cidr_blocks   = ["0.0.0.0/0"]
  }
  tags {
    Name = "${var.app_name}"
  }
}

resource "aws_security_group" "sg_elb" {
  vpc_id = "${aws_vpc.vpc1.id}"
  ingress {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }
  tags {
    Name = "${var.app_name}"
  }
}

#resource "aws_security_group" "sg_app" {
#  vpc_id = "${aws_vpc.vpc1.id}"
#  ingress {
#      from_port   = 8080
#      to_port     = 8080
#      protocol    = "tcp"
#      cidr_blocks = "[${aws_security_group.sg_elb.id}]"
#  }
#  ingress {
#      from_port   = 22
#      to_port     = 22
#      protocol    = "tcp"
#      cidr_blocks = ["0.0.0.0/0"]
#  }
#  egress {
#      from_port   = 0
#      to_port     = 0
#      protocol    = "-1"
#      cidr_blocks = ["0.0.0.0/0"]
#  }
#  tags {
#    Name = "${var.app_name}"
#  }
#}
#
#resource "aws_security_group" "sg_rds" {
#  vpc_id = "${aws_vpc.vpc1.id}"
#  ingress {
#      from_port   = 3306
#      to_port     = 3306
#      protocol    = "tcp"
#      cidr_blocks = "[${aws_security_group.sg_elb.id}]"
#  }
#  egress {
#      from_port   = 0
#      to_port     = 0
#      protocol    = "-1"
#      cidr_blocks = ["0.0.0.0/0"]
#  }
#  tags {
#    Name = "${var.app_name}"
#  }
#}
