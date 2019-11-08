resource "azurerm_resource_group" "applepay_rg_POC" {
  name     = "applepay-rg-POC"
  location = "${var.location}"
}

resource "random_string" "fqdn" {
    length  = 6
    special = false
    upper   = false
    number  = false
}



resource "azurerm_app_service_plan" "applepaytest_ASP" {
  name                = "${random_string.fqdn.result}"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.applepay_rg_POC.name}"
  kind                = "Linux"
  reserved            = true
  
  sku {
    tier = "Basic"
    size = "B1"
    capacity = 1
  }
}

resource "azurerm_app_service" "applepaytest_AS" {
  name                = "${random_string.fqdn.result}"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.applepay_rg_POC.name}"
  app_service_plan_id = "${azurerm_app_service_plan.applepaytest_ASP.id}"

  site_config {
    dotnet_framework_version    = "v4.0"
    scm_type                    = "None"
    linux_fx_version            = "DOTNETCORE|3.0"
    ftps_state                  = "AllAllowed"
  }

  
}