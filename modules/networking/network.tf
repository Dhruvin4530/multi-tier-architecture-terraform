# data block to fetch the availability zone
data "aws_availability_zones" "available" {
  state = "available"
}

# vpc 
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = var.vpc_name
  }
}

# web subnet 1
resource "aws_subnet" "web-subnet1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.web_subnet1_cidr_block
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name = var.web_subnet1_name
  }
}

# web subnet 2
resource "aws_subnet" "web-subnet2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.web_subnet2_cidr_block
  availability_zone       = data.aws_availability_zones.available.names[1]
  map_public_ip_on_launch = true

  tags = {
    Name = var.web_subnet2_name
  }
}

# app subnet 1
resource "aws_subnet" "app-subnet1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.app_subnet1_cidr_block
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = false

  tags = {
    Name = var.app_subnet1_name
  }
}

# app subnet 2
resource "aws_subnet" "app-subnet2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.app_subnet2_cidr_block
  availability_zone       = data.aws_availability_zones.available.names[1]
  map_public_ip_on_launch = false

  tags = {
    Name = var.app_subnet2_name
  }
}

# app subnet 1
resource "aws_subnet" "db-subnet1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.db_subnet1_cidr_block
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = false

  tags = {
    Name = var.db_subnet1_name
  }
}

# app subnet 2
resource "aws_subnet" "db-subnet2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.db_subnet2_cidr_block
  availability_zone       = data.aws_availability_zones.available.names[1]
  map_public_ip_on_launch = false

  tags = {
    Name = var.db_subnet2_name
  }
}

# db subnet group
resource "aws_db_subnet_group" "subnet-grp" {
  name       = var.db_subnet_grp_name
  subnet_ids = [aws_subnet.db-subnet1.id, aws_subnet.db-subnet2.id]

  tags = {
    Name = var.db_subnet_grp_name
  }
}

# internet gateway
resource "aws_internet_gateway" "internet-gw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = var.igw_name
  }
}

resource "aws_eip" "eip" {
  domain = "vpc"
}

# NAT gateway
resource "aws_nat_gateway" "nat-gw" {
  allocation_id     = aws_eip.eip.id
  connectivity_type = "public"
  subnet_id         = aws_subnet.web-subnet1.id

  tags = {
    Name = var.nat_gw_name
  }

  depends_on = [aws_internet_gateway.internet-gw]
}

resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gw.id
  }

  tags = {
    Name = var.public_rt_name
  }
}

resource "aws_route_table_association" "pub-rt-asscociation-1" {
  subnet_id      = aws_subnet.web-subnet1.id
  route_table_id = aws_route_table.public-route-table.id
}

resource "aws_route_table_association" "pub-rt-asscociation-2" {
  subnet_id      = aws_subnet.web-subnet2.id
  route_table_id = aws_route_table.public-route-table.id
}

resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat-gw.id
  }

  tags = {
    Name = var.private_rt_name
  }
}

resource "aws_route_table_association" "pri-rt-asscociation-1" {
  subnet_id      = aws_subnet.app-subnet1.id
  route_table_id = aws_route_table.private-route-table.id
}

resource "aws_route_table_association" "pri-rt-asscociation-2" {
  subnet_id      = aws_subnet.app-subnet2.id
  route_table_id = aws_route_table.private-route-table.id
}