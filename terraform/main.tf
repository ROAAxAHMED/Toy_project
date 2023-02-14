provider "azurerm" {
    version = "2.5.0"
    features {}
}


resource "azurerm_resource_group" "tf_test" {
  name = "tfmain"
  location = "Australia East"
}

resource "azurerm_container_group" "tfcg_test" {
  name                      = "toyproject"
  location                  = azurerm_resource_group.tf_test.location
  resource_group_name       = azurerm_resource_group.tf_test.name

  ip_address_type     = "public"
  dns_name_label      = "toyprojectwebsite"
  os_type             = "Linux"

  container {
      name            = "weatherapi"
      image           = "roaaahmed1999/toyproject"
        cpu             = "1"
        memory          = "1"

        ports {
            port        = 5000
            protocol    = "TCP"
        }
  }
}
