resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = [aws_subnet.database-subnet-1.id, aws_subnet.database-subnet-2.id] # Corrected duplicate subnet ID

  tags = {
    Name = "MY DB subnet group"
  }
}

resource "aws_db_instance" "default" {
  allocated_storage       = 10
  db_subnet_group_name    = aws_db_subnet_group.default.id
  engine                  = "mysql" # Ensure engine is in lowercase
  engine_version          = "8.0.34"
  instance_class          = "db.t3.micro" # Fixed the typo from 'instnace_class'
  multi_az                = true
  db_name                    = "mydb"
  username                = "username"
  password                = "password"
  skip_final_snapshot     = true
  vpc_security_group_ids  = [aws_security_group.database_sg.id]
}

