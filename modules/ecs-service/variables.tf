variable "name" { type = string }
variable "cluster_id" { type = string }
variable "capacity_provider_name" { type = string }
variable "vpc_id" { type = string }
variable "listener_arn" { type = string }
variable "ecs_instance_sg_id" { type = string }
variable "task_execution_role_arn" { type = string }
variable "task_role_arn" { type = string }
variable "region" { type = string }
variable "services" {
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
variable "log_group_names" { type = map(string) }
variable "tags" { type = map(string) }
