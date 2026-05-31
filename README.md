# Automated Azure Static Website Deployment via Terraform

A production-ready Infrastructure as Code (IaC) repository that provisions a highly cost-effective static website hosting architecture on Microsoft Azure. This project is configured to target the **UK South (London)** region to ensure data compliance and minimal latency for regional workloads.

## 🏗️ Architecture Design
The infrastructure consists of the following components:
* **Resource Group (`azurerm_resource_group`)**: Establishes the logical boundary for resource lifecycle isolation.
* **Storage Account (`azurerm_storage_account`)**: Configured with a Standard SKU and Locally Redundant Storage (LRS) for optimal cost-efficiency.
* **Static Website Activation (`azurerm_storage_account_static_website`)**: Decoupled feature enablement to isolate configuration changes from core storage compute plates.
* **Automated Blob Deployment (`azurerm_storage_blob`)**: Injects local web assets directly into the cloud runtime environment during the provision lifecycle.

## 🧠 Advanced Engineering Decisions

### 1. Hardened Dependency Chains (Race Condition Resolution)
During development, a cloud API race condition occurs because Azure provisions the background `$web` blob container asynchronously. To mitigate `ContainerNotFound (404)` errors, an explicit `depends_on` rule was established on the file deployment resource. This instructs Terraform's internal Directed Acyclic Graph (DAG) compiler to halt file injections until Azure confirms web server features are 100% active.

### 2. Strict Separation of Concerns
Core environment files (`main.tf`, `providers.tf`, `variables.tf`) remain completely immutable and abstract. All execution state values, geographic data, and unique naming configurations are safely fed at runtime via an isolated environment variables file (`terraform.tfvars`).

---

## 🚀 Deployment Guide

### Prerequisites
* Terraform CLI (v1.15+) installed locally.
* Azure CLI authenticated to a valid tenant subscription context.

### Execution Lifecycle
1. **Initialize Workspace** (Downloads the required AzureRM provider architecture):
   ```bash
   terraform init
   ```
2. **Code Validation** (Verifies configuration syntax compliance and catches formatting issues):
   ```bash
   terraform validate
   ```
3. **Dry-Run Execution Plan** (Previews cloud modifications before spending budget):
   ```bash
   terraform plan
   ```
4. **Provision Infrastructure** (Executes the actual platform API builds):**
   ```bash
   terraform apply
   ```
5. **Teardown Environment** (Enforces immediate lifecycle closure to guarantee zero passive billing overhead):
   ```bash
   terraform destroy
   ```
