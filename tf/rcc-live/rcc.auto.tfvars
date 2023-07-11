project_id = "fluidnumerics-rcc"
source_image_project = "fluidnumerics-rcc"
source_image = "fluidnumerics-v5-slurm-22-05-4-centos-7-1687541602"

region = "us-central1"
subnets = [
  {
    subnet_ip     = "10.0.0.0/16"
    subnet_region = "us-central1"
  },
]

#######################
# Slurm configuration #
#######################

slurm_cluster_name = "rcclive"

slurm_conf_tpl    = "../etc/slurm.conf.tpl"

controller_instance_config = {
  additional_disks = []
  additional_disks = []
  additional_disks = []
  can_ip_forward   = null
  disable_smt      = false
  disk_auto_delete = true
  disk_labels = {}
  disk_size_gb           = 2048
  disk_type              = "pd-ssd"
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
  mem_offset_mb            = null
  cpu_spec_list            = null
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
    mem_offset_mb            = null
    cpu_spec_list            = null
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
      partition_startup_scripts_timeout = 300
      partition_name = "c260"
      partition_nodes = [
        {
          access_config = []
          group_name             = "sm"
          node_count_dynamic_max = 20
          node_count_static      = 0
          node_conf = {
            Features = "test"
          }
          additional_disks         = []
          can_ip_forward           = true
          disable_smt              = false
          disk_auto_delete         = true
          disk_labels              = {}
          disk_size_gb             = 50
          disk_type                = "pd-ssd"
          enable_confidential_vm   = false
          enable_oslogin           = true
          enable_shielded_vm       = false
          gpu                      = null
          labels                   = {}
          machine_type             = "c2-standard-60"
          metadata                 = {}
          min_cpu_platform         = null
          on_host_maintenance      = null
          preemptible              = true
          shielded_instance_config = null
          source_image_family  = null
          source_image_project = null
          source_image = null
          tags                     = []
          mem_offset_mb            = 0
          cpu_spec_list            = ""
          instance_template = null
          bandwidth_tier = "platform_default"
          enable_spot_vm = false
          spot_instance_config = {
            termination_action = "STOP"
          }
        },
      ]
      region            = null
      zone_policy_allow = []
      zone_policy_deny  = []
    },
    {
      enable_job_exclusive    = false
      enable_placement_groups = false
      network_storage         = []
      partition_conf = {
        SuspendTime = 300
      }
      partition_startup_scripts = []
      partition_startup_scripts_timeout = 300
      partition_name = "gvx1"
      partition_nodes = [
        {
          access_config = []
          group_name             = "sm"
          node_count_dynamic_max = 10
          node_count_static      = 0
          node_conf = {
            Features = "test"
          }
          additional_disks         = []
          can_ip_forward           = true
          disable_smt              = false
          disk_auto_delete         = true
          disk_labels              = {}
          disk_size_gb             = 50
          disk_type                = "pd-ssd"
          enable_confidential_vm   = false
          enable_oslogin           = true
          enable_shielded_vm       = false
          gpu                      = {
            count = 1,
            type = "nvidia-tesla-v100"
          }
          labels                   = {}
          machine_type             = "n1-standard-8"
          metadata                 = {}
          min_cpu_platform         = null
          on_host_maintenance      = null
          preemptible              = true
          shielded_instance_config = null
          source_image_family  = null
          source_image_project = null
          source_image = null
          tags                     = []
          mem_offset_mb            = 0
          cpu_spec_list            = ""
          instance_template = null
          bandwidth_tier = "platform_default"
          enable_spot_vm = false
          spot_instance_config = {
            termination_action = "STOP"
          }
        },
      ]
      region            = null
      zone_policy_allow = []
      zone_policy_deny  = []
    },
    {
      enable_job_exclusive    = false
      enable_placement_groups = false
      network_storage         = []
      partition_conf = {
        SuspendTime = 300
      }
      partition_startup_scripts = []
      partition_startup_scripts_timeout = 300
      partition_name = "gvx8"
      partition_nodes = [
        {
          access_config = []
          group_name             = "sm"
          node_count_dynamic_max = 5
          node_count_static      = 0
          node_conf = {
            Features = "test"
          }
          additional_disks         = []
          can_ip_forward           = true
          disable_smt              = false
          disk_auto_delete         = true
          disk_labels              = {}
          disk_size_gb             = 50
          disk_type                = "pd-ssd"
          enable_confidential_vm   = false
          enable_oslogin           = true
          enable_shielded_vm       = false
          gpu                      = {
            count = 8,
            type = "nvidia-tesla-v100"
          }
          labels                   = {}
          machine_type             = "n1-standard-96"
          metadata                 = {}
          min_cpu_platform         = null
          on_host_maintenance      = null
          preemptible              = true
          shielded_instance_config = null
          source_image_family  = null
          source_image_project = null
          source_image = null
          tags                     = []
          mem_offset_mb            = 0
          cpu_spec_list            = ""
          instance_template = null
          bandwidth_tier = "platform_default"
          enable_spot_vm = false
          spot_instance_config = {
            termination_action = "STOP"
          }
        },
      ]
      region            = null
      zone_policy_allow = []
      zone_policy_deny  = []
    },
    {
      enable_job_exclusive    = false
      enable_placement_groups = false
      network_storage         = []
      partition_conf = {
        SuspendTime = 300
      }
      partition_startup_scripts = []
      partition_startup_scripts_timeout = 300
      partition_name = "gax1"
      partition_nodes = [
        {
          access_config = []
          group_name             = "sm"
          node_count_dynamic_max = 10
          node_count_static      = 0
          node_conf = {
            Features = "test"
          }
          additional_disks         = []
          can_ip_forward           = true
          disable_smt              = false
          disk_auto_delete         = true
          disk_labels              = {}
          disk_size_gb             = 50
          disk_type                = "pd-ssd"
          enable_confidential_vm   = false
          enable_oslogin           = true
          enable_shielded_vm       = false
          gpu                      = {
            count = 1,
            type = "nvidia-tesla-a100"
          }
          labels                   = {}
          machine_type             = "a2-highgpu-1g"
          metadata                 = {}
          min_cpu_platform         = null
          on_host_maintenance      = null
          preemptible              = true
          shielded_instance_config = null
          source_image_family  = null
          source_image_project = null
          source_image = null
          tags                     = []
          mem_offset_mb            = 0
          cpu_spec_list            = ""
          instance_template = null
          bandwidth_tier = "platform_default"
          enable_spot_vm = false
          spot_instance_config = {
            termination_action = "STOP"
          }
        },
      ]
      region            = null
      zone_policy_allow = []
      zone_policy_deny  = []
    },
    {
      enable_job_exclusive    = false
      enable_placement_groups = false
      network_storage         = []
      partition_conf = {
        SuspendTime = 300
      }
      partition_startup_scripts = []
      partition_startup_scripts_timeout = 300
      partition_name = "gax8"
      partition_nodes = [
        {
          access_config = []
          group_name             = "sm"
          node_count_dynamic_max = 5
          node_count_static      = 0
          node_conf = {
            Features = "test"
          }
          additional_disks         = []
          can_ip_forward           = true
          disable_smt              = false
          disk_auto_delete         = true
          disk_labels              = {}
          disk_size_gb             = 50
          disk_type                = "pd-ssd"
          enable_confidential_vm   = false
          enable_oslogin           = true
          enable_shielded_vm       = false
          gpu                      = {
            count = 1,
            type = "nvidia-tesla-a100"
          }
          labels                   = {}
          machine_type             = "a2-highgpu-8g"
          metadata                 = {}
          min_cpu_platform         = null
          on_host_maintenance      = null
          preemptible              = true
          shielded_instance_config = null
          source_image_family  = null
          source_image_project = null
          source_image = null
          tags                     = []
          mem_offset_mb            = 0
          cpu_spec_list            = ""
          instance_template = null
          bandwidth_tier = "platform_default"
          enable_spot_vm = false
          spot_instance_config = {
            termination_action = "STOP"
          }
        },
      ]
      region            = null
      zone_policy_allow = []
      zone_policy_deny  = []
    },
  ]
