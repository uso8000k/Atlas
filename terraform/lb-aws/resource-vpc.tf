resource "aws_vpc" "vpc1" {
  cidr_block              = "${var.aws_vpc1_segment}"
  # enable_dns_hostnames    = true
  tags {
    Name = "${var.app_name}"
  }
}

resource "aws_subnet" "vpc1_public_subnet1" {
  vpc_id                  = "${aws_vpc.vpc1.id}"
  cidr_block              = "${var.aws_vpc1_public_subnet1_segment}"
  availability_zone       = "${data.aws_availability_zones.availability.names[0]}"
  map_public_ip_on_launch = true
  tags {
    Name = "${var.app_name}"
  }
}

resource "aws_subnet" "vpc1_private_subnet1" {
  vpc_id                  = "${aws_vpc.vpc1.id}"
  cidr_block              = "${var.aws_vpc1_private_subnet1_segment}"
  availability_zone       = "${data.aws_availability_zones.availability.names[0]}"
  tags {
    Name = "${var.app_name}"
  }
}

resource "aws_internet_gateway" "igw1" {
  vpc_id = "${aws_vpc.vpc1.id}"
  tags {
    Name = "${var.app_name}"
  }
}

resource "aws_route_table" "rt1" {
  vpc_id = "${aws_vpc.vpc1.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw1.id}"
  }
  tags {
    Name = "${var.app_name}"
  }
}

resource "aws_main_route_table_association" "rtasock1" {
  vpc_id         = "${aws_vpc.vpc1.id}"
  route_table_id = "${aws_route_table.rt1.id}"
}
