
module "boundary-enterprise-worker-hvd" {
  source  = "./terraform-azurerm-boundary-enterprise-worker-hvd/"

  friendly_name_prefix = var.prefix
  location = var.location
  worker_subnet_id = var.subnet_id
  vm_ssh_public_key = var.vm_ssh_public_key

  additional_package_names = ["jq", "unzip"]

  # vmss_vm_count = 8

  boundary_version = "1.0.0+ent"
  #boundary_dir_home = "/opt/boundary"
  # bsr_s3_bucket_arn = 

  common_tags = { app = "boundary", role = "worker"}

  custom_startup_script_template = basename("${path.cwd}/templates/install-and-register.userdata")
  custom_install_template_params = {
      disable_vault_integration = var.disable_vault_integration,
      vault_url = var.vault_url,
      vault_azure_auth_path = var.vault_azure_auth_path,
      vault_auth_role_name = var.vault_auth_role_name,
      vault_secret_path = var.vault_secret_path,
      vault_namespace = var.vault_namespace,
      boundary_url = local.boundary_url,
      boundary_auth_method_id = var.boundary_auth_method_id,
      boundary_username = var.boundary_username,
      boundary_password = var.boundary_password,
      boundary_dir_home = var.boundary_dir_home,
      enable_session_recording = true
      }

  create_resource_group = false
  resource_group_name = var.resource_group_name
  vm_sku = var.vm_sku

  vm_custom_image_name = var.vm_custom_image_name
  vm_custom_image_rg_name = var.vm_custom_image_rg_name

  hcp_boundary_cluster_id = var.hcp_boundary_cluster_id

  #worker_is_internal = true
  worker_is_internal = false
  worker_tags = {cloud = "azure", type = "egress", environment = "sandbox"}

  }

