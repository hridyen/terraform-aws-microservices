output "service_names" { value = { for k, v in aws_ecs_service.this : k => v.name } }
output "target_group_arns" { value = { for k, v in aws_lb_target_group.this : k => v.arn } }
