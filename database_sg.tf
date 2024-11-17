resource "aws_security_group" "database_sg" {
  name        = "Database-SG"
  description = "Allow inbound traffic from the application layer"
  vpc_id      = aws_vpc.demovpc.id

  ingress {
    description      = "Allow traffic from the application layer"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] # Replace with source CIDR if needed
    # source_security_group_id = aws_security_group.demosg.id  # Uncomment if referencing another SG
  }

  egress {
    description = "Allow outbound traffic"
    from_port   = 32768
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Database-SG"
  }
}

