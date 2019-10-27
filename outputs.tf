 output "Web_App_Service_URL" {
     value = "${azurerm_app_service.applepaytest_AS.default_site_hostname}"
 }