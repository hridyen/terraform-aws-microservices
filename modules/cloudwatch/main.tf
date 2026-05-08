resource "aws_cloudwatch_log_group" "ecs" {
  for_each = var.service_names

  name              = "/ecs/${var.project_name}/${each.value}"
  retention_in_days = var.retention_days
  tags              = var.tags
}