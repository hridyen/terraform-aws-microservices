variable "aws_region" { type = string }
variable "project_name" { type = string }
variable "environment" { type = string }
variable "vpc_cidr" { type = string }
variable "azs" { type = list(string) }
variable "public_subnet_cidrs" { type = list(string) }
variable "private_subnet_cidrs" { type = list(string) }
variable "certificate_arn" {
  type    = string
  default = ""
}
variable "ecs_instance_type" { type = string }
variable "ecs_min_size" { type = number }
variable "ecs_desired_capacity" { type = number }
variable "ecs_max_size" { type = number }
variable "microservices" {
  type = map(object({
    image          = string
    container_port = number
    path_pattern   = string
    cpu            = number
    memory         = number
    desired_count  = number
    priority       = number
  }))
}
