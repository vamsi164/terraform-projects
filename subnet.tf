#creating 1st web subnet
resource "aws_subnet" "public_subnet-1" {
vpc_id = "${aws_vpc.demovpc.id}"
cidr_block = "10.0.1.0/24"
map_public_ip_on_launch=true
availability_zone="us-east-1a"
tags = {
Name="Web subnet1"
}
}

#creating 2nd web subnet
resource "aws_subnet" "public_subnet-2" {
vpc_id = "${aws_vpc.demovpc.id}"
cidr_block = "10.0.2.0/24"
map_public_ip_on_launch=true
availability_zone="us-east-1b"
tags = {
Name="web subnet 2"
}
}

#creating 1st web application subnet
resource "aws_subnet" "application-subnet-1"{
vpc_id = "${aws_vpc.demovpc.id}"
cidr_block = "10.0.3.0/24"
map_public_ip_on_launch=false
availability_zone="us-east-1a"
tags = {
Name="Application Subnet 1"
}
}

#creating 2nd application subnet
resource "aws_subnet" "application-subnet-2" {
vpc_id = "${aws_vpc.demovpc.id}"
cidr_block = "10.0.4.0/24"
map_public_ip_on_launch=false
availability_zone="us-east-1b"
tags = {
Name="Application Subnet 2"
}
}

#create  FDatabase Private Subnet
resource "aws_subnet" "database-subnet-1"{
vpc_id = "${aws_vpc.demovpc.id}"
cidr_block = "10.0.5.0/24"
map_public_ip_on_launch=false
availability_zone="us-east-1a"
tags = {
Name="Database Subnet 1"
}
}

#create database Private Subnet
resource "aws_subnet" "database-subnet-2" {
vpc_id = "${aws_vpc.demovpc.id}"
cidr_block = "10.0.6.0/24"
map_public_ip_on_launch=false
availability_zone="us-east-1b"
tags = {
Name="Database Subnet 2"
}
}
