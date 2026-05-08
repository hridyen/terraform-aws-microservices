aws_region   = "ap-south-1"
project_name = "microservices-platform"
environment  = "dev"

vpc_cidr = "10.0.0.0/16"
azs      = ["ap-south-1a", "ap-south-1b"]

public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.11.0/24", "10.0.12.0/24"]

# Keep empty for HTTP-only dev. Add ACM ARN for HTTPS.
certificate_arn = ""

ecs_instance_type    = "t3.medium"
ecs_min_size         = 2
ecs_desired_capacity = 3
ecs_max_size         = 6

microservices = {
  auth = {
    image          = "nginx:latest"
    container_port = 80
    path_pattern   = "/api/auth/*"
    cpu            = 128
    memory         = 256
    desired_count  = 1
    priority       = 10
  }
  user = {
    image          = "nginx:latest"
    container_port = 80
    path_pattern   = "/api/user/*"
    cpu            = 128
    memory         = 256
    desired_count  = 1
    priority       = 20
  }
  order = {
    image          = "nginx:latest"
    container_port = 80
    path_pattern   = "/api/order/*"
    cpu            = 128
    memory         = 256
    desired_count  = 1
    priority       = 30
  }
  payment = {
    image          = "nginx:latest"
    container_port = 80
    path_pattern   = "/api/payment/*"
    cpu            = 128
    memory         = 256
    desired_count  = 1
    priority       = 40
  }
  product = {
    image          = "nginx:latest"
    container_port = 80
    path_pattern   = "/api/product/*"
    cpu            = 128
    memory         = 256
    desired_count  = 1
    priority       = 50
  }
  cart = {
    image          = "nginx:latest"
    container_port = 80
    path_pattern   = "/api/cart/*"
    cpu            = 128
    memory         = 256
    desired_count  = 1
    priority       = 60
  }
  inventory = {
    image          = "nginx:latest"
    container_port = 80
    path_pattern   = "/api/inventory/*"
    cpu            = 128
    memory         = 256
    desired_count  = 1
    priority       = 70
  }
  notification = {
    image          = "nginx:latest"
    container_port = 80
    path_pattern   = "/api/notification/*"
    cpu            = 128
    memory         = 256
    desired_count  = 1
    priority       = 80
  }
  review = {
    image          = "nginx:latest"
    container_port = 80
    path_pattern   = "/api/review/*"
    cpu            = 128
    memory         = 256
    desired_count  = 1
    priority       = 90
  }
  search = {
    image          = "nginx:latest"
    container_port = 80
    path_pattern   = "/api/search/*"
    cpu            = 128
    memory         = 256
    desired_count  = 1
    priority       = 100
  }
  admin = {
    image          = "nginx:latest"
    container_port = 80
    path_pattern   = "/api/admin/*"
    cpu            = 128
    memory         = 256
    desired_count  = 1
    priority       = 110
  }
  gateway = {
    image          = "nginx:latest"
    container_port = 80
    path_pattern   = "/api/gateway/*"
    cpu            = 128
    memory         = 256
    desired_count  = 1
    priority       = 120
  }
}
