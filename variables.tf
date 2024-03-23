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
