 output "vmss_public_ip" {
     value = "${azurerm_app_service.applepaytest_AS.default_site_hostname}"
 }