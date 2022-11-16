/**
 * Copyright (C) SchedMD LLC.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

###########
# GENERAL #
###########

project_id = "research-computing-cloud"

slurm_cluster_name = "rcc"

region = "us-central1"

# *NOT* intended for production use
# enable_devel = true

enable_bigquery_load         = false
enable_cleanup_compute       = true
enable_cleanup_subscriptions = false
enable_reconfigure           = false

###########
# NETWORK #
###########

subnets = [
  {
    subnet_ip     = "10.0.0.0/24"
    subnet_region = "us-central1"
  },
]

mtu = 0

#################
# CONFIGURATION #
#################

# cloudsql = {
#   server_ip = "<SERVER_IP>:<PORT>"
#   user      = "<USERNAME>"
#   password  = "<PASSWORD>"
#   db_name   = "<DB_NAME>"
# }

# Network storage
network_storage = [
  # {
  #   server_ip     = "<storage host>"
  #   remote_mount  = "/home"
  #   local_mount   = "/home"
  #   fs_type       = "nfs"
  #   mount_options = null
  # },
]
login_network_storage = [
  # {
  #   server_ip     = "<storage host>"
  #   remote_mount  = "/net_storage"
  #   local_mount   = "/shared"
  #   fs_type       = "nfs"
  #   mount_options = null
  # },
]

# Slurm config
cgroup_conf_tpl   = null
slurm_conf_tpl    = null
slurmdbd_conf_tpl = null
cloud_parameters = {
  resume_rate     = 0
  resume_timeout  = 300
  suspend_rate    = 0
  suspend_timeout = 300
}

# scripts
controller_startup_scripts = [
  #   {
  #     filename = "hello_controller.sh"
  #     content  = <<EOF
  # #!/bin/bash
  # set -ex
  # echo "Hello, $(hostname) from $(dirname $0) !"
  #     EOF
  #   },
]
login_startup_scripts = [
  #   {
  #     filename = "hello_login.sh"
  #     content  = <<EOF
  # #!/bin/bash
  # set -ex
  # echo "Hello, $(hostname) from $(dirname $0) !"
  #     EOF
  #   },
]
compute_startup_scripts = [
  #   {
  #     filename = "hello_compute.sh"
  #     content  = <<EOF
  # #!/bin/bash
  # set -ex
  # echo "Hello, $(hostname) from $(dirname $0) !"
  #     EOF
  #   },
]
prolog_scripts = [
  #   {
  #     filename = "hello_prolog.sh"
  #     content  = <<EOF
  # #!/bin/bash
  # set -ex
  # echo "Hello, $(hostname) from $(dirname $0) !"
  #     EOF
  #   },
]
epilog_scripts = [
  #   {
  #     filename = "hello_epilog.sh"
  #     content  = <<EOF
  # #!/bin/bash
  # set -ex
  # echo "Hello, $(hostname) from $(dirname $0) !"
  #     EOF
  #   },
]

##############
# CONTROLLER #
##############

controller_instance_config = {
  # Template By Definition
  additional_disks = [
    # {
    #   disk_name    = null
    #   device_name  = null
    #   disk_size_gb = 128
    #   disk_type    = "pd-standard"
    #   disk_labels  = {}
    #   auto_delete  = true
    #   boot         = false
    # },
  ]
  can_ip_forward   = null
  disable_smt      = false
  disk_auto_delete = true
  disk_labels = {
    # label0 = "value0"
    # label1 = "value1"
  }
  disk_size_gb           = 500
  disk_type              = "pd-standard"
  enable_confidential_vm = false
  enable_oslogin         = true
  enable_shielded_vm     = false
  gpu                    = null
  labels = {
    # label0 = "value0"
    # label1 = "value1"
  }
  machine_type = "n2d-standard-8"
  metadata = {
    # metadata0 = "value0"
    # metadata1 = "value1"
  }
  min_cpu_platform    = null
  on_host_maintenance = null
  preemptible         = false
  region              = null
  shielded_instance_config = {
    enable_integrity_monitoring = true
    enable_secure_boot          = true
    enable_vtpm                 = true
  }
  source_image_family  = "midjourney-rcc-dev"
  source_image_project = "research-computing-cloud"
  source_image         = null
  tags = [
    # "tag0",
    # "tag1",
  ]

  # Template By Source
  instance_template = null

  # Instance Definition
  access_config = [
    {
      nat_ip       = null
      network_tier = "STANDARD"
    },
  ]
  network_ip = null
  static_ip  = null
  zone       = "us-central1-a"
}

#########
# LOGIN #
#########

login_nodes = [
  {
    # Group Definition
    group_name = "l0"

    # Template By Definition
    additional_disks         = []
    can_ip_forward           = false
    disable_smt              = false
    disk_auto_delete         = true
    disk_labels              = {}
    disk_size_gb             = 32
    disk_type                = "pd-standard"
    enable_confidential_vm   = false
    enable_oslogin           = true
    enable_shielded_vm       = false
    gpu = null
    labels                   = {}
    machine_type             = "n1-standard-2"
    metadata                 = {}
    min_cpu_platform         = null
    on_host_maintenance      = null
    preemptible              = false
    shielded_instance_config = null
    source_image_family      = "midjourney-rcc-dev"
    source_image_project     = "research-computing-cloud"
    source_image             = null
    tags                     = []

    # Template By Source
    instance_template = null

    # Instance Definition
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
    zone          = null
  },
  {
    # Group Definition
    group_name = "l1"

    # Template By Definition
    additional_disks         = []
    can_ip_forward           = false
    disable_smt              = false
    disk_auto_delete         = true
    disk_labels              = {}
    disk_size_gb             = 32
    disk_type                = "pd-standard"
    enable_confidential_vm   = false
    enable_oslogin           = true
    enable_shielded_vm       = false
    gpu = null
    labels                   = {}
    machine_type             = "n1-standard-2"
    metadata                 = {}
    min_cpu_platform         = null
    on_host_maintenance      = null
    preemptible              = false
    shielded_instance_config = null
    source_image_family      = "midjourney-rcc-dev"
    source_image_project     = "research-computing-cloud"
    source_image             = null
    tags                     = []

    # Template By Source
    instance_template = null

    # Instance Definition
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
    zone          = null
  },
]

##############
# PARTITIONS #
##############

partitions = [
  {
    enable_job_exclusive    = false
    enable_placement_groups = false
    network_storage         = []
    partition_conf = {
      Default     = "YES"
      SuspendTime = 300
    }
    partition_startup_scripts = [
      # {
      #   filename = "hello_part_debug.sh"
      #   content  = <<EOF
      # #!/bin/bash
      # set -ex
      # echo "Hello, $(hostname) from $(dirname $0) !"
      #   EOF
      # },
    ]
    partition_name = "n2"
    partition_nodes = [
      {
        # Group Definition
        group_name             = "n2"
        node_count_dynamic_max = 2000
        node_count_static      = 0
        node_conf = {
          Features = "test"
        }

        # Template By Definition
        additional_disks         = []
        can_ip_forward           = true
        disable_smt              = false
        disk_auto_delete         = true
        disk_labels              = {}
        disk_size_gb             = 100
        disk_type                = "pd-standard"
        enable_confidential_vm   = false
        enable_oslogin           = true
        enable_shielded_vm       = false
        gpu                      = null
        labels                   = {}
        machine_type             = "n2-standard-2"
        metadata                 = {}
        min_cpu_platform         = null
        on_host_maintenance      = null
        preemptible              = true
        shielded_instance_config = null
        source_image_family      = "midjourney-rcc-dev"
        source_image_project     = "research-computing-cloud"
        source_image             = null
        tags                     = []

        # Template By Source
        instance_template = null

        # Instance Definition
        bandwidth_tier = "platform_default"
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
  {
    enable_job_exclusive    = false
    enable_placement_groups = false
    network_storage         = []
    partition_conf = {
      ResumeTimeout  = 300
      SuspendTimeout = 300
      SuspendTime    = 300
    }
    partition_startup_scripts = []
    partition_name            = "a100"
    partition_nodes = [
      {
        # Group Definition
        group_name             = "gax1"
        node_count_dynamic_max = 1000
        node_count_static      = 0
        node_conf              = {}

        # Template By Definition
        additional_disks       = []
        can_ip_forward         = false
        disable_smt            = false
        disk_auto_delete       = true
        disk_labels            = {}
        disk_size_gb           = 100
        disk_type              = "pd-standard"
        enable_confidential_vm = false
        enable_oslogin         = true
        enable_shielded_vm     = false
        gpu = {
          count = 1
          type  = "nvidia-tesla-a100"
        }
        labels                   = {}
        machine_type             = "a2-highgpu-1g"
        metadata                 = {}
        min_cpu_platform         = null
        on_host_maintenance      = null
        preemptible              = false
        shielded_instance_config = null
        source_image_family      = "midjourney-rcc-dev"
        source_image_project     = "research-computing-cloud"
        source_image             = null
        tags                     = []

        # Template By Source
        instance_template = null

        # Instance Definition
        bandwidth_tier = "platform_default"
        enable_spot_vm = false
        spot_instance_config = {
          termination_action = "STOP"
        }
      },
      {
        # Group Definition
        group_name             = "gax2"
        node_count_dynamic_max = 1000
        node_count_static      = 0
        node_conf              = {}

        # Template By Definition
        additional_disks       = []
        can_ip_forward         = false
        disable_smt            = false
        disk_auto_delete       = true
        disk_labels            = {}
        disk_size_gb           = 100
        disk_type              = "pd-standard"
        enable_confidential_vm = false
        enable_oslogin         = true
        enable_shielded_vm     = false
        gpu = {
          count = 2
          type  = "nvidia-tesla-a100"
        }
        labels                   = {}
        machine_type             = "a2-highgpu-2g"
        metadata                 = {}
        min_cpu_platform         = null
        on_host_maintenance      = null
        preemptible              = false
        shielded_instance_config = null
        source_image_family      = "midjourney-rcc-dev"
        source_image_project     = "research-computing-cloud"
        source_image             = null
        tags                     = []

        # Template By Source
        instance_template = null

        # Instance Definition
        bandwidth_tier = "platform_default"
        enable_spot_vm = false
        spot_instance_config = {
          termination_action = "STOP"
        }
      },
      {
        # Group Definition
        group_name             = "gax4"
        node_count_dynamic_max = 1000
        node_count_static      = 0
        node_conf              = {}

        # Template By Definition
        additional_disks       = []
        can_ip_forward         = false
        disable_smt            = false
        disk_auto_delete       = true
        disk_labels            = {}
        disk_size_gb           = 100
        disk_type              = "pd-standard"
        enable_confidential_vm = false
        enable_oslogin         = true
        enable_shielded_vm     = false
        gpu = {
          count = 4
          type  = "nvidia-tesla-a100"
        }
        labels                   = {}
        machine_type             = "a2-highgpu-4g"
        metadata                 = {}
        min_cpu_platform         = null
        on_host_maintenance      = null
        preemptible              = false
        shielded_instance_config = null
        source_image_family      = "midjourney-rcc-dev"
        source_image_project     = "research-computing-cloud"
        source_image             = null
        tags                     = []

        # Template By Source
        instance_template = null

        # Instance Definition
        bandwidth_tier = "platform_default"
        enable_spot_vm = false
        spot_instance_config = {
          termination_action = "STOP"
        }
      },
      {
        # Group Definition
        group_name             = "gax8"
        node_count_dynamic_max = 1000
        node_count_static      = 0
        node_conf              = {}

        # Template By Definition
        additional_disks       = []
        can_ip_forward         = false
        disable_smt            = false
        disk_auto_delete       = true
        disk_labels            = {}
        disk_size_gb           = 100
        disk_type              = "pd-standard"
        enable_confidential_vm = false
        enable_oslogin         = true
        enable_shielded_vm     = false
        gpu = {
          count = 8
          type  = "nvidia-tesla-a100"
        }
        labels                   = {}
        machine_type             = "a2-highgpu-8g"
        metadata                 = {}
        min_cpu_platform         = null
        on_host_maintenance      = null
        preemptible              = false
        shielded_instance_config = null
        source_image_family      = "midjourney-rcc-dev"
        source_image_project     = "research-computing-cloud"
        source_image             = null
        tags                     = []

        # Template By Source
        instance_template = null

        # Instance Definition
        bandwidth_tier = "platform_default"
        enable_spot_vm = false
        spot_instance_config = {
          termination_action = "STOP"
        }
      },
      {
        # Group Definition
        group_name             = "gax16"
        node_count_dynamic_max = 1000
        node_count_static      = 0
        node_conf              = {}

        # Template By Definition
        additional_disks       = []
        can_ip_forward         = false
        disable_smt            = false
        disk_auto_delete       = true
        disk_labels            = {}
        disk_size_gb           = 100
        disk_type              = "pd-standard"
        enable_confidential_vm = false
        enable_oslogin         = true
        enable_shielded_vm     = false
        gpu = {
          count = 16
          type  = "nvidia-tesla-a100"
        }
        labels                   = {}
        machine_type             = "a2-megagpu-16g"
        metadata                 = {}
        min_cpu_platform         = null
        on_host_maintenance      = null
        preemptible              = false
        shielded_instance_config = null
        source_image_family      = "midjourney-rcc-dev"
        source_image_project     = "research-computing-cloud"
        source_image             = null
        tags                     = []

        # Template By Source
        instance_template = null

        # Instance Definition
        bandwidth_tier = "platform_default"
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
  {
    enable_job_exclusive    = false
    enable_placement_groups = false
    network_storage         = []
    partition_conf = {
      ResumeTimeout  = 300
      SuspendTimeout = 300
      SuspendTime    = 300
    }
    partition_startup_scripts = []
    partition_name            = "t4"
    partition_nodes = [
      {
        # Group Definition
        group_name             = "gtx1"
        node_count_dynamic_max = 1000
        node_count_static      = 0
        node_conf              = {}

        # Template By Definition
        additional_disks       = []
        can_ip_forward         = false
        disable_smt            = false
        disk_auto_delete       = true
        disk_labels            = {}
        disk_size_gb           = 100
        disk_type              = "pd-standard"
        enable_confidential_vm = false
        enable_oslogin         = true
        enable_shielded_vm     = false
        gpu = {
          count = 1
          type  = "nvidia-tesla-t4"
        }
        labels                   = {}
        machine_type             = "n1-standard-8"
        metadata                 = {}
        min_cpu_platform         = null
        on_host_maintenance      = null
        preemptible              = false
        shielded_instance_config = null
        source_image_family      = "midjourney-rcc-dev"
        source_image_project     = "research-computing-cloud"
        source_image             = null
        tags                     = []

        # Template By Source
        instance_template = null

        # Instance Definition
        bandwidth_tier = "platform_default"
        enable_spot_vm = false
        spot_instance_config = {
          termination_action = "STOP"
        }
      },
      {
        # Group Definition
        group_name             = "gtx2"
        node_count_dynamic_max = 1000
        node_count_static      = 0
        node_conf              = {}

        # Template By Definition
        additional_disks       = []
        can_ip_forward         = false
        disable_smt            = false
        disk_auto_delete       = true
        disk_labels            = {}
        disk_size_gb           = 100
        disk_type              = "pd-standard"
        enable_confidential_vm = false
        enable_oslogin         = true
        enable_shielded_vm     = false
        gpu = {
          count = 2
          type  = "nvidia-tesla-t4"
        }
        labels                   = {}
        machine_type             = "n1-standard-16"
        metadata                 = {}
        min_cpu_platform         = null
        on_host_maintenance      = null
        preemptible              = false
        shielded_instance_config = null
        source_image_family      = "midjourney-rcc-dev"
        source_image_project     = "research-computing-cloud"
        source_image             = null
        tags                     = []

        # Template By Source
        instance_template = null

        # Instance Definition
        bandwidth_tier = "platform_default"
        enable_spot_vm = false
        spot_instance_config = {
          termination_action = "STOP"
        }
      },
      {
        # Group Definition
        group_name             = "gtx4"
        node_count_dynamic_max = 1000
        node_count_static      = 0
        node_conf              = {}

        # Template By Definition
        additional_disks       = []
        can_ip_forward         = false
        disable_smt            = false
        disk_auto_delete       = true
        disk_labels            = {}
        disk_size_gb           = 100
        disk_type              = "pd-standard"
        enable_confidential_vm = false
        enable_oslogin         = true
        enable_shielded_vm     = false
        gpu = {
          count = 4
          type  = "nvidia-tesla-t4"
        }
        labels                   = {}
        machine_type             = "n1-standard-32"
        metadata                 = {}
        min_cpu_platform         = null
        on_host_maintenance      = null
        preemptible              = false
        shielded_instance_config = null
        source_image_family      = "midjourney-rcc-dev"
        source_image_project     = "research-computing-cloud"
        source_image             = null
        tags                     = []

        # Template By Source
        instance_template = null

        # Instance Definition
        bandwidth_tier = "platform_default"
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
