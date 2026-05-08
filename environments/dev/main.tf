module "vpc" {
  source = "../../modules/vpc"

  name                 = local.name
  vpc_cidr             = var.vpc_cidr
  azs                  = var.azs
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  tags                 = local.tags
}

module "security_groups" {
  source = "../../modules/security-groups"

  name   = local.name
  vpc_id = module.vpc.vpc_id
  tags   = local.tags
}

module "iam" {
  source = "../../modules/iam"

  name = local.name
  tags = local.tags
}

module "ecr" {
  source = "../../modules/ecr"

  repositories = toset(keys(var.microservices))
  tags         = local.tags
}

module "cloudwatch" {
  source = "../../modules/cloudwatch"

  project_name   = local.name
  service_names  = toset(keys(var.microservices))
  retention_days = 14
  tags           = local.tags
}

module "alb" {
  source = "../../modules/alb"

  name              = local.name
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  alb_sg_id         = module.security_groups.alb_sg_id
  certificate_arn   = var.certificate_arn
  tags              = local.tags
}

module "waf" {
  source = "../../modules/waf"

  project_name = local.name
  rate_limit   = 2000
}

module "ecs_cluster" {
  source = "../../modules/ecs-cluster"

  project_name          = local.name
  private_subnets       = module.vpc.private_subnet_ids
  ecs_security_group_id = module.security_groups.ecs_instances_sg_id
  instance_profile_name = module.iam.ecs_instance_profile_name
  instance_type         = var.ecs_instance_type
  min_size              = var.ecs_min_size
  desired_capacity      = var.ecs_desired_capacity
  max_size              = var.ecs_max_size
  tags                  = local.tags
}

module "ecs_services" {
  source = "../../modules/ecs-service"

  name                    = local.name
  cluster_id              = module.ecs_cluster.cluster_id
  capacity_provider_name  = module.ecs_cluster.capacity_provider_name
  vpc_id                  = module.vpc.vpc_id
  listener_arn            = coalesce(module.alb.https_listener_arn, module.alb.http_listener_arn)
  ecs_instance_sg_id      = module.security_groups.ecs_instances_sg_id
  task_execution_role_arn = module.iam.task_execution_role_arn
  task_role_arn           = module.iam.task_role_arn
  region                  = var.aws_region
  services                = var.microservices
  log_group_names         = module.cloudwatch.log_group_names
  tags                    = local.tags
}

module "s3_static_site" {
  source = "../../modules/s3-static-site"

  name = local.name
  tags = local.tags
}

module "cloudfront" {
  source = "../../modules/cloudfront"

  name           = local.name
  s3_bucket_id   = module.s3_static_site.bucket_id
  s3_bucket_arn  = module.s3_static_site.bucket_arn
  s3_domain_name = module.s3_static_site.bucket_regional_domain_name
  alb_dns_name   = module.alb.alb_dns_name
  tags           = local.tags
}