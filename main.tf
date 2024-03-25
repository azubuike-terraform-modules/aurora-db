data "aws_db_cluster_snapshot" "development_final_snapshot" {
  db_cluster_identifier = var.cluster_identifier
  most_recent           = true
}
# data "aws_subnet" "selected" {
#   id = var.private_subnets[0]
# }
resource "aws_rds_cluster_instance" "cluster_instances" {
  count              = var.db_count
  identifier         = "${var.cluster_identifier}-${count.index}"
  cluster_identifier = aws_rds_cluster.default.id
  instance_class     = var.instance_class
  engine             = aws_rds_cluster.default.engine
  engine_version     = aws_rds_cluster.default.engine_version
  db_subnet_group_name =""
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
  skip_final_snapshot     = false
  snapshot_identifier = data.aws_db_cluster_snapshot.development_final_snapshot.id
  copy_tags_to_snapshot = true
  # db_subnet_group_name = aws_db_subnet_group.default.name
  storage_encrypted = true
  kms_key_id = var.kms_key_id
  vpc_security_group_ids = var.vpc_security_group_ids 
  lifecycle {
    ignore_changes = [snapshot_identifier]
  }

  tags = var.db_tags

}