terraform {
  cloud {
    workspaces {
      name = local.workspace_name
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.9.0"
    }
    hcp = {
      source  = "hashicorp/hcp"
      version = ">0.100.0"
    }
  }
}

