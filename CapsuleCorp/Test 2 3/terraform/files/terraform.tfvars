#env
environment = "prod"
region      = "us-west-2"
#config
vpc_azs             = ["us-west-2a", "us-west-2b", "us-west-2c"]
vpc_private_subnets = ["10.96.1.0/24", "10.96.3.0/24", "10.96.4.0/24"]
vpc_public_subnets  = ["10.96.5.0/24"]
vpc_cidr            = "10.96.0.0/16"
domain              = "nitingoura.com"
mandatory_tags = {
  terraform = "true",
}
db_engine_type    = "postgres"
db_engine_version = 13.3
db_port           = 5432
db_instance_class = "db.m1.large"
db_storage        = 100