terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

variable "aws_region" {
  description = "AWS region where the ECS stack was deployed"
  type        = string
  default     = "us-east-1"
}

variable "stack_name" {
  description = "Name of the CloudFormation stack to destroy"
  type        = string
  default     = "php-app-stack"
}

resource "aws_cloudformation_stack" "ecs_stack" {
  name = var.stack_name

  # Point this at the same template you deployed
  template_body = file("ecs-stack.yaml")

  # If you passed parameters originally, mirror them here
  parameters = {
    ApplicationName    = "php-app"
    ECRRepoName        = "php-app-repo"
    ImageTag           = "latest"
    DesiredCount       = "1"
    ContainerPort      = "8080"
    HostPort           = "8888"
    DBName             = "mydb"
    DBUser             = "admin"
    DBPassword         = "YOUR_DB_PASSWORD"
    DBInstanceClass    = "db.t3.micro"
    DBAllocatedStorage = "20"
    VpcCidr            = "10.0.0.0/16"
    PublicSubnet1Cidr  = "10.0.1.0/24"
    PublicSubnet2Cidr  = "10.0.2.0/24"
  }

  # Needed to allow IAM roles/policies to be removed
  capabilities = ["CAPABILITY_NAMED_IAM"]
}
