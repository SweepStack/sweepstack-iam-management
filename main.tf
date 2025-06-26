terraform {
  cloud {
    organization = "sweepstack-alpha"
    workspaces {
      name = local.workspace_name
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.0.0"
    }
    hcp = {
      source  = "hashicorp/hcp"
      version = ">0.100.0"
    }
  }
}

