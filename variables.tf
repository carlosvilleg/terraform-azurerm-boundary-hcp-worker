variable "prefix" {
	type = string
	default = "boundary-egress"
}

variable "location" {
	type = string
}

variable "resource_group_name" {
	type = string
}

variable "vm_sku" {
	type = string
	default = "Standard_D2s_v5"
}

variable "subnet_id" {
	description = "The full path id for the subnet. For example: /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/boundary/providers/Microsoft.Network/virtualNetworks/boundary/subnets/default"
	type = string
}

variable "vm_ssh_public_key" {
	type = string
}

variable "hcp_boundary_cluster_id" {
	type = string
}

variable "vm_custom_image_name" {
	type = string
	description = "Custom image for the worker VMs"
	default = null
}

variable "vm_custom_image_rg_name" {
	type = string
	description = "RG containing the custom image for the worker VMs"
	default = null
}


# Vault Configuration
variable "vault_url" {
	type = string
}

variable "vault_namespace" {
	type = string
}

variable "vault_azure_auth_path" {
	type = string
  default = "azure"
}

variable "vault_auth_role_name" {
	type = string
  default = "boundary-worker-role"
}

variable "vault_secret_path" {
	type = string
  default = "secret/data/boundary/worker"
}

variable "boundary_auth_method_id" {
	type = string
}

variable "disable_vault_integration" {
	type = bool
  default = false
  description = "If set to true, disables the integration with Vault, and the boundary username and password must be provided"
}

variable "boundary_username" {
  type = string
  default = ""
  validation {
    condition     = (var.disable_vault_integration && var.boundary_username != "") || (!var.disable_vault_integration && var.boundary_username == "")
    error_message = "Boundary username must be specified if the Vault integration is disabled, a boundary_password will also need to be provided"
  }
}

variable "boundary_password" {
	type = string
  default = ""
  validation {
    condition     = (var.disable_vault_integration && (var.boundary_username != "" && var.boundary_password != "")) || (!var.disable_vault_integration && var.boundary_username == "" && var.boundary_password == "")
    error_message = "Boundary password must be specified if the Vault integration is disabled and a boundary_username must also be provided"
    }
}

variable "boundary_dir_home" {
  type = string
  default = "/opt/boundary"
}


