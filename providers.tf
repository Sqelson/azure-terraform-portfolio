# ==========================================
# TERRAFORM BLOCK (ENGINE CONFIGURATION)
# ==========================================
# This block configures the Terraform engine itself, specifying where to 
# pull plugins from and pinning specific versions to avoid breaking changes.
terraform {
  # Pinning the required core CLI version needed to parse this specific syntax
  required_version = ">= 1.0.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      # Version pinning: "~> 3.0" allows minor updates (e.g., 3.1, 3.2) 
      # but prevents major, breaking changes (e.g., 4.0) from auto-downloading.
      version = "~> 3.0"
    }
  }
}

# ==========================================
# PROVIDER BLOCK (THE PLUG-IN)
# ==========================================
# Instantiates the Azure Resource Manager (azurerm) plug-in. 
# This handles the actual translation of HCL code into Azure REST API calls.
provider "azurerm" {
  # The features block is mandatory for the AzureRM provider. It allows you to
  # customize specific resource deletion behaviors (e.g., forcing key vault deletions).
  features {}
}