terraform {
  required_version = ">= 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Estado local (terraform.tfstate en este mismo directorio) para empezar simple.
  # Si más adelante se trabaja en equipo, conviene migrar a un backend remoto (S3 + DynamoDB lock).
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project   = "wilpel-papelera-web"
      ManagedBy = "terraform"
    }
  }
}

data "aws_caller_identity" "current" {}
