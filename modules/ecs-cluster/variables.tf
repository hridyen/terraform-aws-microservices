variable "project_name" {
  type = string
}

variable "private_subnets" {
  type = list(string)
}

variable "ecs_security_group_id" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t3.medium"
}

variable "min_size" {
  type    = number
  default = 2
}

variable "desired_capacity" {
  type    = number
  default = 3
}

variable "max_size" {
  type    = number
  default = 6
}

variable "instance_profile_name" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}