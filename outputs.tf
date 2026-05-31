output "website_url" {
  description = "The web endpoint for the static website"
  value       = azurerm_storage_account.storage.primary_web_endpoint
}