output "msi" {
  value = azurerm_function_app.functionapp.identity[0].principal_id
}
