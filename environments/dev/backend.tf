# Uncomment after creating bootstrap/s3-backend resources.
# terraform {
#   backend "s3" {
#     bucket         = "CHANGE-ME-terraform-state-bucket"
#     key            = "microservices/dev/terraform.tfstate"
#     region         = "ap-south-1"
#     dynamodb_table = "terraform-locks"
#     encrypt        = true
#   }
# }
