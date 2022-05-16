variable "mandatory_tags" {
  type        = map(string)
  description = "Additional tags (e.g. `map('BusinessUnit','XYZ')`"
}

variable "region" {
  description = "AWS Region to deploy infrastructure to"
  type        = string
}

variable "environment" {
  description = "Environment of the AWS Account being used (i.e. dev or prod)"
  type        = string
}

variable "vpc_azs" {
  type        = list(string)
  description = "The list vpc AZs"
}

variable "vpc_cidr" {
  type        = string
  description = "The vpc's CIDR"
}

variable "domain" {
  description = "domain name"
  type        = string
}

variable "vpc_private_subnets" {
  type        = list(string)
  description = "The list of private subnets"
}

variable "vpc_public_subnets" {
  type        = list(string)
  description = "The list of public subnets"
}

variable "db_engine_type" {
  type        = string
  description = "Type of DB engine to run"
}

variable "db_engine_version" {
  type        = number
  description = "Version of DB engine to run"
}

variable "db_port" {
  type        = number
  description = "Port to run DB on"
}

variable "db_instance_class" {
  type        = string
  description = "Type of DB instance to run"
}

variable "db_storage" {
  type        = number
  description = "Amount of storage in GB for the DB"
}
