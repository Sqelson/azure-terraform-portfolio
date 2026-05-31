# ==========================================
# INPUT VARIABLES (CONFIGURABLE INPUTS)
# ==========================================
# Variables act like function arguments in programming. They make the code 
# dynamic and reusable across different target environments (Dev, Test, Prod).

variable "location" {
  description = "The target Azure geographic region where all resources will be provisioned."
  type        = string
  default     = "UK South" # Set to London (UK South) for localized latency and compliance
}

variable "resource_group_name" {
  description = "The logical naming schema for the primary resource container."
  type        = string
  default     = "rg-portfolio-uk-demo"
}

variable "storage_account_name" {
  description = "The globally unique name for the hosting Azure Storage Account."
  type        = string
  default     = "stportfoliouksouth2026" # NOTE: Overwrite this in terraform.tfvars
}