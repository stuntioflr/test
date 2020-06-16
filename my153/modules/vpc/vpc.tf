resource "aws_vpc" "${var.vpc_name}" {
  cidr_block           = "${var.vpcCIDRblock}"
  #instance_tenancy     = "${var.instanceTenancy}"
  enable_dns_support   = true 
  enable_dns_hostnames = true

  tags = {
    Name = "${var.vpc_name}"
  }
}

resource "aws_subnet" "${var.pub_subnet}" {
  vpc_id                  = "${aws_vpc.var.vpc_name.id}"
  cidr_block              = "${var.pub_subnetCIDRblock}"
  availability_zone       = "${var.availabilityZone}"
  tags = {
     Name = "${var.pub_subnet}"
  }
}

resource "aws_subnet" "${var.prv_subnet}" {
  vpc_id                  = "${aws_vpc.var.vpc_name.id}"
  cidr_block              = "${var.prv_subnetCIDRblock}"
  availability_zone       = "${var.availabilityZone}"
  tags = {
     Name = "${var.prv_subnet}"
  }
}

resource "aws_route_table" "${var.PUB_route_table}" {
  vpc_id = "${aws_vpc.var.vpc_name.id}"
  tags = {
     Name = "${var.PUB_route_table}"
  }
}

resource "aws_route_table" "${var.PRV_route_table}" {
  vpc_id = "${aws_vpc.var.vpc_name.id}"
  tags = {
     Name = "${var.PRV_route_table}"
  }
}

resource "aws_route_table_association" "pub_subnet_association" {
  subnet_id      = "${aws_subnet.var.pub_subnet.id}"
  route_table_id = "${aws_route_table.var.PUB_route_table.id}"
}

resource "aws_route_table_association" "prv_subnet_association" {
  subnet_id      = "${aws_subnet.var.prv_subnet.id}"
  route_table_id = "${aws_route_table.var.PRV_route_table.id}"
}

