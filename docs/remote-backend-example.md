# Remote Backend Example (Enterprise Pattern)

This file documents the remote backend pattern used in team environments.
We use local state in this lab to keep setup simple.

## Why remote state matters

When multiple engineers work on the same infrastructure, they need to share a
single source of truth for what Terraform has built. A local `terraform.tfstate`
file on your laptop can't be shared — so teams store state in a central location
like an Azure Storage Account.

Remote state also supports **state locking**: while one person runs `terraform apply`,
the state file is locked so nobody else can run a conflicting apply at the same time.

## What the backend block would look like

```hcl
terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state-001"
    storage_account_name = "stlabterraformstate001"
    container_name       = "tfstate"
    key                  = "dev/terraform.tfstate"
  }
}
```

## How to set it up (future phase)

1. Create a storage account in Azure (outside of Terraform, manually or via script)
2. Create a blob container named `tfstate`
3. Replace the `backend "local"` block in `providers.tf` with the `backend "azurerm"` block above
4. Run `terraform init -migrate-state` to move your existing local state to Azure

**Security note:** The storage account should have versioning enabled so you can
recover from accidental state corruption.
