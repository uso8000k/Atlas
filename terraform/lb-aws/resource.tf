resource "aws_instance" "nodes1" {
  instance_type          = "t2.micro"
  ami                    = "ami-fce3c696"
  count                  = 1
  subnet_id              = "${aws_subnet.vpc1_public_subnet1.id}"
  vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]
  tags {
    Name = "${var.app_name}"
  }
}

resource "aws_instance" "nodes2" {
  instance_type          = "t2.micro"
  ami                    = "ami-fce3c696"
  count                  = 1
  subnet_id              = "${aws_subnet.vpc1_private_subnet1.id}"
  vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]
  tags {
    Name = "${var.app_name}"
  }
}
