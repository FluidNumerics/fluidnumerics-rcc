
variable "project_id" {
  type        = string
  description = "Project ID to create resources in."
}

variable "zone" {
  type        = string
  description = "GCP Zone to deploy controller to. Other instances are created in the same region."
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

variable "filestore_name" {
  type        = string
  description = "Name of the filestore instance"
  default     = "rcc-fs"
}

variable "filestore_local_mount" {
  type        = string
  description = "Mount path for Filestore on the RCC."
  default     = "/mnt/filestore"
}

variable "filestore_capacity_gb" {
  type        = number
  description = "Capacity of the filestore instance in GB."
  default     = 10240
}

variable "filestore_tier" {
  type        = string
  description = "Filestore service tier"
  default     = "HIGH_SCALE_SSD"
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
