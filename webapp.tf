  terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "appservice-rg" {
  name     = "service-rg"
  location = "East US"
}

resource "azurerm_service_plan" "service-plan" {
  name                = "example-serviceplan"
  resource_group_name = azurerm_resource_group.appservice-rg.name
  location            = azurerm_resource_group.appservice-rg.location
  os_type             = "Linux"
   sku_name            = "B1"
}

resource "azurerm_linux_web_app" "web_app" {
  name                = "example-my-app"
  location            = azurerm_resource_group.appservice-rg.location
  resource_group_name = azurerm_resource_group.appservice-rg.name
  service_plan_id     = azurerm_service_plan.service-plan.id  # Corrected argument name

  site_config {
     
  }
}


