variable "instance_class" {
  type = string
}
variable "cluster_identifier" {
  type = string
}
variable "engine" {
  type = string
}
variable "engine_version" {
  type = string
}
variable "availability_zones" {
  type = list(string)
}
variable "database_name" {
  type = string
}
variable "master_username" {
  type = string
}
variable "master_password" {
  type = string
}
variable "backup_retention_period" {
  type = number
}
variable "db_count" {
  type = number
}
variable "db_tags"{
  type = object({
    tier = string
    group = string
  })
}
variable "db_subnet_group_name" {
  type = string
}
variable "vpc_security_group_ids" {
  type = list(string)
}
variable "kms_key_id" {
  type = string
}
variable "private_subnets" {
  type = list(string)
}

