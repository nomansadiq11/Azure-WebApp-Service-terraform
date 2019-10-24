resource "azurerm_resource_group" "applepay_rg_POC" {
  name     = "applepay-rg-POC"
  location = "${var.location}"
}



resource "azurerm_app_service_plan" "applepaytest_Webapp" {
  name                = "applepaytest"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.applepay-rg-POC.name}"

  sku {
    tier = "Standard"
    size = "S1"
    family = "S"
    capacity = 1
    name = "S1"
  }
}

resource "azurerm_app_service" "applepaytest_ASP" {
  name                = "applepaytest-app-service"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.applepay_rg_POC.name}"
  app_service_plan_id = "${azurerm_app_service_plan.applepaytest_Webapp.id}"

  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }

  app_settings = {
    "SOME_KEY" = "some-value"
  }

}