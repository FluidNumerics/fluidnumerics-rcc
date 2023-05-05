project_id = "CHANGE-ME"
source_image_project = "CHANGE-ME"
source_image = "CHANGE-ME"

region = "us-central1"
zone = "us-central1-a"

#######################
# Slurm configuration #
#######################

slurm_cluster_name = "demo"

slurm_conf_tpl    = "../etc/slurm.conf.tpl"

controller_instance_config = {
  additional_disks = []
  can_ip_forward   = null
  disable_smt      = false
  disk_auto_delete = true
  disk_labels = {}
  disk_size_gb           = 100
  disk_type              = "pd-standard"
  enable_confidential_vm = false
  enable_oslogin         = true
  enable_shielded_vm     = false
  gpu                    = null
  labels = {}
  machine_type = "n1-standard-4"
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
  source_image_project = null
  source_image         = null
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
  zone       = "us-central1-a"
}

login_nodes = [
  {
    group_name = "l1"
    additional_disks         = []
    can_ip_forward           = false
    gvnic                    = false
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
    machine_type             = "n1-standard-4"
    metadata                 = {}
    min_cpu_platform         = null
    on_host_maintenance      = null
    preemptible              = false
    shielded_instance_config = null
    source_image_family  = null
    source_image_project = null
    source_image         = null
    tags                     = []
    instance_template = null
    access_config = [
      {
        nat_ip = null
        network_tier = "STANDARD"
      }
    ]
    network_ips   = []
    num_instances = 1
    static_ips    = []
    region        = null
    zone          = "us-central1-a"
  },
]
partitions = [
  {
    enable_job_exclusive    = false
    enable_placement_groups = false
    network_storage         = []
    partition_conf = {
      Default     = "YES"
      SuspendTime = 300
    }
    partition_startup_scripts = []
    partition_name = "c216"
    partition_nodes = [
      {
        group_name             = "sm"
        access_config = []
        node_count_dynamic_max = 6000
        node_count_static      = 0
        node_conf = {
          Features = "test"
        }
        additional_disks         = []
        can_ip_forward           = true
        disable_smt              = false
        disk_auto_delete         = true
        disk_labels              = {}
        disk_size_gb             = 100
        disk_type                = "pd-ssd"
        enable_confidential_vm   = false
        enable_oslogin           = true
        enable_shielded_vm       = false
        gpu                      = null
        labels                   = {}
        machine_type             = "c2-standard-16"
        metadata                 = {}
        min_cpu_platform         = null
        on_host_maintenance      = null
        preemptible              = false
        shielded_instance_config = null
        source_image_family  = null
        source_image_project = null
        source_image         = null
        tags                     = []
        instance_template = null
        bandwidth_tier = null
        enable_spot_vm = false
        spot_instance_config = {
          termination_action = "STOP"
        }
      },
    ]
    region            = "us-central1"
    zone_policy_allow = []
    zone_policy_deny  = []
  },
]
