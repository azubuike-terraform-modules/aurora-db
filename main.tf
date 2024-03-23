resource "aws_rds_cluster_instance" "cluster_instances" {
  count              = var.db_count
  identifier         = "${var.cluster_identifier}-${count.index}"
  cluster_identifier = aws_rds_cluster.default.id
  instance_class     = var.instance_class
  engine             = aws_rds_cluster.default.engine
  engine_version     = aws_rds_cluster.default.engine_version
}

resource "aws_rds_cluster" "default" {
  cluster_identifier      = var.cluster_identifier
  engine                  = var.engine 
  engine_version          = var.engine_version 
  availability_zones      = var.availability_zones
  database_name           = var.database_name
  master_username         = var.master_username
  master_password         = var.master_password
  backup_retention_period = var.backup_retention_period
  skip_final_snapshot                 = true

}