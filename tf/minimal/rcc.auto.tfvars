project_id = "fluidnumerics-rcc"
slurm_cluster_name = "rcc"
image = "fluidnumerics-rcc-dev-local"

controller_machine_type = "n2d-standard-8"
controller_disk_size_gb = 500
controller_disk_type = "pd-ssd"

login_machine_type = "n2d-standard-8"
login_disk_size_gb = 50
login_disk_type = "pd-ssd"

zone = "northamerica-northeast1-a"
region = "northamerica-northeast1"


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
      partition_name = "t2d16"
      partition_nodes = [
        {
          group_name             = "amd"
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
          machine_type             = "t2d-standard-16"
          metadata                 = {}
          min_cpu_platform         = null
          on_host_maintenance      = null
          preemptible              = true
          shielded_instance_config = null
          source_image_family  = null
          source_image_project = null
          source_image         = null
          tags                     = []
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
