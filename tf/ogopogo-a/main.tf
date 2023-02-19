

terraform {
  backend "gcs" {
    bucket  = "fluidnumerics-rcc_cluster"
    prefix  = "ogopogo-a"
  }
}


module "fluidnumerics_slurm_cluster" {
  source = "../cluster/"
  project_id = var.project_id
  cloudsql_slurmdb = var.cloudsql_slurmdb
  cloudsql_enable_ipv4 = var.cloudsql_enable_ipv4
  cloudsql_name = var.cloudsql_name
  cloudsql_tier = var.cloudsql_tier
  slurm_cluster_name = var.slurm_cluster_name
  region = var.region 
  enable_bigquery_load         = false
  enable_cleanup_compute       = true
  enable_cleanup_subscriptions = false
  enable_reconfigure           = false
  subnets = [
    {
      subnet_ip     = "10.0.0.0/16"
      subnet_region = var.region
    },
  ]
  mtu = 0
  network_storage = []
  login_network_storage = []
  cgroup_conf_tpl   = null
  slurm_conf_tpl    = "../etc/slurm.conf.tpl"
  slurmdbd_conf_tpl = null
  cloud_parameters = {
    resume_rate     = 0
    resume_timeout  = 300
    suspend_rate    = 0
    suspend_timeout = 300
  }
  controller_startup_scripts = []
  login_startup_scripts = []
  compute_startup_scripts = []
  prolog_scripts = []
  epilog_scripts = []
  controller_instance_config = {
    additional_disks = []
    can_ip_forward   = null
    disable_smt      = false
    disk_auto_delete = true
    disk_labels = {}
    disk_size_gb           = var.controller_disk_size_gb
    disk_type              = var.controller_disk_type
    enable_confidential_vm = false
    enable_oslogin         = true
    enable_shielded_vm     = false
    gpu                    = null
    labels = {}
    machine_type = var.controller_machine_type
    metadata = {}
    min_cpu_platform    = null
    on_host_maintenance = null
    preemptible         = false
    region              = null
    shielded_instance_config = {
      enable_integrity_monitoring = true
      enable_secure_boot          = true
      enable_vtpm                 = true
    }
    source_image_family  = null
    source_image_project = var.project_id
    source_image         = var.image
    tags = []
    instance_template = null
    access_config = [
      {
        nat_ip = null
        network_tier = "STANDARD"
      }
    ]
    network_ip = null
    static_ip  = null
    zone       = var.zone
  }
  login_nodes = [
    {
      group_name = "l0"
      additional_disks = []
      can_ip_forward           = false
      disable_smt              = false
      disk_auto_delete         = true
      disk_labels              = {}
      disk_size_gb             = 100
      disk_type                = "pd-standard"
      enable_confidential_vm   = false
      enable_oslogin           = true
      enable_shielded_vm       = false
      gpu = null
      labels                   = {}
      machine_type             = var.login_machine_type
      metadata                 = {}
      min_cpu_platform         = null
      on_host_maintenance      = null
      preemptible              = false
      shielded_instance_config = null
      source_image_family  = null
      source_image_project = var.project_id
      source_image         = var.image
      tags                     = []
      instance_template = null
      access_config = [
        {
          nat_ip = null
          network_tier = "PREMIUM"
        }
      ]
      network_ips   = []
      num_instances = 1
      static_ips    = []
      region        = null
      zone          = null
  }]
  partitions = var.partitions
  create_filestore = false
  filestore = var.filestore
  create_lustre = var.create_lustre
  lustre = var.lustre
}
