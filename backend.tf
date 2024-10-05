terraform {
  # Update this block with the location of your terraform state file
  backend "azurerm" {
    # The centeralized storage account for the terraform state files
    subscription_id      = "0ff6e400-30a4-4f3b-86e0-9d4f2223025e"
    resource_group_name  = "rg-tfstate-storage"
    storage_account_name = "satfstatestatusfiles"
    container_name       = "tfstate"
    key                  = "pdz/terraform.tfstate"
    use_oidc             = true
  }

}