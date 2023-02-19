
variable "project_id" {
  type        = string
  description = "Project ID to create resources in."
}

variable "zone" {
  type        = string
  description = "GCP Zone to deploy controller to. Other instances are created in the same region."
}

variable "region" {
  type        = string
  description = "GCP region for the cluster"
}

variable "slurm_cluster_name" {
  type        = string
  description = "Cluster name, used for resource naming."
  default     = "full"
}

variable "controller_machine_type" {
  type        = string
  description = "Machine type to use for Slurm controller."
  default     = "n2d-standard-224"
}

variable "controller_disk_size_gb" {
  type        = number
  description = "Size of the controller disk in GB; determines /home available space."
  default     = 2048
}

variable "controller_disk_type" {
  type        = string
  description = "Type of disk to use for the controller"
  default     = "pd-ssd"
}

variable "login_machine_type" {
  type        = string
  description = "Machine type to use for Slurm login."
  default     = "n2d-standard-224"
}

variable "login_disk_size_gb" {
  type        = number
  description = "Size of the login disk in GB; determines /home available space."
  default     = 2048
}

variable "login_disk_type" {
  type        = string
  description = "Type of disk to use for the login"
  default     = "pd-ssd"
}

variable "filestore" {
  type = object({
    name = string
    tier = string
    local_mount = string
    capacity_gb = number
    fs_name = string
  })
  default = {
    name = "filestore"
    tier = "PREMIUM"
    capacity_gb = 2048
    fs_name = "nfs"
    local_mount = "/mnt/filestore"
  }
}
  
variable "image" {
  type = string
  description = "Name of the image hosted in rcc-midjourney for this cluster"
}

variable "create_lustre" {
  type = bool
  description = "Boolean for controlling lustre creation (useful for optional modules)"
  default = false
}

variable "lustre" {
  type = object({
    local_mount = string
    image = string
    service_account = string
    network_tags = list(string)
    name = string
    fs_name = string
    mds_node_count = number
    mds_machine_type = string
    mds_boot_disk_type = string
    mds_boot_disk_size_gb = number
    mdt_disk_type = string
    mdt_disk_size_gb = number
    mdt_per_mds = number
    oss_node_count = number
    oss_machine_type = string
    oss_boot_disk_type = string
    oss_boot_disk_size_gb = number
    ost_disk_type = string
    ost_disk_size_gb = number 
    ost_per_oss = number
    hsm_node_count = number
    hsm_machine_type = string
    hsm_gcs_bucket = string
    hsm_gcs_prefix = string
  })
  default = {
    local_mount = "/mnt/lustre"
    image = "projects/fluidnumerics-rcc/global/images/lustre-gcp-latest"
    service_account = null
    network_tags = []
    name = "rcc-lustre"
    fs_name = "lustre"
    mds_node_count = 1
    mds_machine_type = "n2-standard-16"
    mds_boot_disk_type = "pd-standard"
    mds_boot_disk_size_gb = 100
    mdt_disk_type = "pd-ssd"
    mdt_disk_size_gb = 1024
    mdt_per_mds = 1
    oss_node_count = 2
    oss_machine_type = "n2-standard-16" 
    oss_boot_disk_type = "pd-standard"
    oss_boot_disk_size_gb = 100
    ost_disk_type = "local-ssd"
    ost_disk_size_gb = 1500 
    ost_per_oss = 1
    hsm_node_count = 0
    hsm_machine_type = "n2-standard-16"
    hsm_gcs_bucket = null
    hsm_gcs_prefix = null
  }
}

variable "partitions" {
  description = <<EOD
Cluster partition configuration as a list.

Variables map to:
- [slurm_partition](../../../../modules/slurm_partition/README_TF.md#inputs)
- [slurm_instance_template](../../../../modules/slurm_instance_template/README_TF.md#inputs)
EOD
  type = list(object({
    enable_job_exclusive    = bool
    enable_placement_groups = bool
    partition_conf          = map(string)
    partition_startup_scripts_timeout = number
    partition_startup_scripts = list(object({
      filename = string
      content  = string
    }))
    partition_name = string
    partition_nodes = list(object({
      access_config = list(object({
        network_tier = string
        nat_ip       = string
      }))
      node_count_static      = number
      node_count_dynamic_max = number
      group_name             = string
      node_conf              = map(string)
      additional_disks = list(object({
        disk_name    = string
        device_name  = string
        disk_size_gb = number
        disk_type    = string
        disk_labels  = map(string)
        auto_delete  = bool
        boot         = bool
      }))
      bandwidth_tier         = string
      can_ip_forward         = bool
      disable_smt            = bool
      disk_auto_delete       = bool
      disk_labels            = map(string)
      disk_size_gb           = number
      disk_type              = string
      enable_confidential_vm = bool
      enable_oslogin         = bool
      enable_shielded_vm     = bool
      enable_spot_vm         = bool
      gpu = object({
        count = number
        type  = string
      })
      instance_template   = string
      labels              = map(string)
      machine_type        = string
      metadata            = map(string)
      min_cpu_platform    = string
      on_host_maintenance = string
      preemptible         = bool
      shielded_instance_config = object({
        enable_integrity_monitoring = bool
        enable_secure_boot          = bool
        enable_vtpm                 = bool
      })
      spot_instance_config = object({
        termination_action = string
      })
      source_image_family  = string
      source_image_project = string
      source_image         = string
      tags                 = list(string)
    }))
    network_storage = list(object({
      local_mount   = string
      fs_type       = string
      server_ip     = string
      remote_mount  = string
      mount_options = string
    }))
    region            = string
    zone_policy_allow = list(string)
    zone_policy_deny  = list(string)
  }))
  default = []
}


variable "cloudsql_enable_ipv4" {
  type = bool
  description = "Flag to enable external access to the cloudsql instance"
  default = false
}

variable "cloudsql_slurmdb" {
  type = bool
  description = "Boolean flag to enable (True) or disable (False) CloudSQL Slurm Database"
  default = false
}

variable "cloudsql_name" {
  type = string
  description = "Name of the cloudsql instance used to host the Slurm database, if cloudsql_slurmdb is set to true"
  default = "slurmdb"
}

variable "cloudsql_tier" {
  type = string
  description = "Instance type of the CloudSQL instance. See https://cloud.google.com/sql/docs/mysql/instance-settings for more options."
  default = "db-n1-standard-8"
}
