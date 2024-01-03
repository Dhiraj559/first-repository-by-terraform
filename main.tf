terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "<=2.85.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "9f2b8c4f-7072-48a5-b063-0466e988c4ef"
  tenant_id       = "93a41e44-91cd-4200-ba68-b5e1f7fe4b78"
  client_id       = "9f60f097-632b-4468-8f8c-8a43756657a3"
  client_secret   = "LLk8Q~lFl6SaY6y9zYMHMuGaLbK1UMaxKaInrcsu"
  features {}
}
locals {
  resource_group = "Dhiraj-RG"
  location       = "East US"
}
resource "azurerm_resource_group" "Dhiraj_RG" {
  name     = local.resource_group
  location = local.location
}

resource "azurerm_app_service_plan" "Dhiraj_App" {
  name                = "Dhiraj-appserviceplan"
  location            = local.location
  resource_group_name = azurerm_resource_group.Dhiraj_RG.name
  sku {
    tier = "Standard"
    size = "S1"
  }
  depends_on = [azurerm_resource_group.Dhiraj_RG]
}

resource "azurerm_app_service" "Webapp" {
  name                = "web-app4863487"
  location            = local.location
  resource_group_name = azurerm_resource_group.Dhiraj_RG.name
  app_service_plan_id = azurerm_app_service_plan.Dhiraj_App.id
  depends_on = [azurerm_app_service_plan.Dhiraj_App]
 
}