# Configure the Terraform runtime requirements.
terraform {
  required_version = ">= 1.1.0"

  required_providers {
    # Azure Resource Manager provider and version
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.50"
    }
    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "2.3.3"
    }
  }
}

#the prefix that goes labels names, its default is set to daig0104 algonquin username
variable "labelPrefix" {
  type        = string
  default     = "daig0104"
  description = "the prefix that goes labels"
}
#variable for region, default set to canada central
variable "region" {
  type        = string
  default     = "Canada Central"
  description = "The resource group location"
}

# Define providers and their config params
provider "azurerm" {
  # Leave the features block empty to accept all defaults
  features {}
}

provider "cloudinit" {
  # Configuration options
}
#creating the resource group
resource "azurerm_resource_group" "Lab9RG" {
  name     = "${var.labelPrefix}-A09-RG"
  location = var.region
}

resource "azurerm_storage_account" "lab9Storage" {
  name                     = "lab9sStoragecst8918"
  resource_group_name      = azurerm_resource_group.Lab9RG.name
  location                 = azurerm_resource_group.Lab9RG.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}
