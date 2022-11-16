project_id = "fluidnumerics-rcc"
slurm_cluster_name = "rcc"
controller_machine_type = "n2d-standard-8"
controller_disk_size_gb = 500
controller_disk_type = "pd-ssd"
filestore_name = "rcc-fs"
filestore_local_mount = "/home"
filestore_capacity_gb = "1024"
filestore_tier = "STANDARD"
zone = "northamerica-northeast1-a"

image = "fluidnumerics-rcc-"

create_lustre = false
