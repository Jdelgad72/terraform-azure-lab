terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }

  # LOCAL BACKEND (default for personal lab)
  # Terraform state is stored in a local file: terraform.tfstate
  # This file is gitignored — never commit it.
  #
  # ENTERPRISE NOTE: In a team environment you would replace this block with a
  # remote backend (e.g., Azure Storage Account) so that all team members share
  # the same state. Example shown in docs/remote-backend-example.md
  backend "local" {
    path = "terraform.tfstate"
  }
}

provider "azurerm" {
  # Uses your active Azure CLI session (az login).
  # No secrets are hardcoded here — authentication is handled outside the code.
  subscription_id = var.subscription_id

  features {}
}
