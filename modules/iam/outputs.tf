output "ecs_instance_profile_name" { value = aws_iam_instance_profile.ecs.name }
output "task_execution_role_arn" { value = aws_iam_role.task_execution_role.arn }
output "task_role_arn" { value = aws_iam_role.task_role.arn }
