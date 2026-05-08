output "alb_dns_name" { value = module.alb.alb_dns_name }
output "cloudfront_domain_name" { value = module.cloudfront.distribution_domain_name }
output "ecs_cluster_name" { value = module.ecs_cluster.cluster_name }
output "ecs_services" { value = module.ecs_services.service_names }
output "ecr_repository_urls" { value = module.ecr.repository_urls }
