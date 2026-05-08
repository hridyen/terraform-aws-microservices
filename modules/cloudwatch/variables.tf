variable "project_name" {
  type = string
}

variable "service_names" {
  type = set(string)
}

variable "retention_days" {
  type    = number
  default = 14
}

variable "tags" {
  type    = map(string)
  default = {}
}