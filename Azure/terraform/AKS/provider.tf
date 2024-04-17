terraform {
  required_providers {
    kubectl={
      source = "gavinbunney/kubectl"
      version = "1.14.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.97.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
    local = {
      source = "hashicorp/local"
      version = "~> 2.5"
    }
    null={
      source  = "hashicorp/null"
      version = "~> 3.2"
    }

    azureakscommand = {
      source = "jkroepke/azureakscommand"
      version = "1.2.0"
    }

    archive = {
      source = "hashicorp/archive"
      version = "2.4.2"
    }

    azuread = {
      source = "hashicorp/azuread"
      version = "2.48.0"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "archive" {}
provider "azureakscommand" {}
provider "azuread" {}