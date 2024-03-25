resource "aws_db_subnet_group" "default" {
  name       = "aurora-subnet-group"
  subnet_ids = ["subnet-0ca7c62774a9f4b04","subnet-0e951da413a28918c"]

}
