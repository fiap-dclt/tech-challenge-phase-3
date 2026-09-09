resource "aws_db_subnet_group" "this" {
  name       = "subnet-group-db-${var.env}"
  subnet_ids = var.private_subnet_ids
  tags = {
    Name = "subnet-group-db-${var.env}"
  }
}

resource "aws_security_group" "rds_sg" {
  name   = "sg-rds-${var.env}-${var.microservice}"
  vpc_id = var.vpc_id

  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [var.eks_security_group_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "sg-rds-${var.env}"
  }
}

resource "aws_db_instance" "postgres" {
  identifier             = "rds-${var.env}-${var.microservice}"
  engine                 = var.db_engine
  engine_version         = var.db_engine_version
  instance_class         = "db.t3.small"
  allocated_storage      = 20
  username               = var.db_user
  password               = var.db_pass
  db_subnet_group_name   = aws_db_subnet_group.this.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  skip_final_snapshot    = true
  publicly_accessible    = false
  tags = {
    Name = "rds-${var.env}-${var.microservice}"
  }
}
