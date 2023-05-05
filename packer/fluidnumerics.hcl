###########
# GENERAL #
###########

zone       = "us-central1-a"

#########
# IMAGE #
#########

source_image_project_id = [
  "centos-cloud",
]

###########
# NETWORK #
###########

# network_project_id = "<NETWORK_PROJECT_ID>"

# subnetwork = "<SUBNETWORK_ID>"

tags = [
  # "tag0",
  # "tag1",
]

#############
# PROVISION #
#############

slurm_version = "22.05.4"

# Disable some ansible roles here; they are enabled by default
# install_cuda = false
# install_ompi = false
# install_lustre = false
# install_gcsfuse = false
#
prefix = "fluidnumerics"

##########
# BUILDS #
##########

### Service Account ###

service_account_email = "default"

service_account_scopes = [
  "https://www.googleapis.com/auth/cloud-platform",
]

### Builds ###

builds = [
  {
    ### image ###
    source_image        = null
    source_image_family = "centos-7"
    image_licenses      = null
    labels              = null

    ### ssh ###
    ssh_username = "packer"
    ssh_password = null

    ### instance ###
    machine_type = "n1-standard-4"
    preemptible  = false

    ### root of trust ###
    enable_secure_boot          = null
    enable_vtpm                 = null
    enable_integrity_monitoring = null

    ### storage ###
    disk_size = 50
    disk_type = null
  },
]

# add extra verbosity arguments to ensure stdout/stderr appear in output
extra_ansible_provisioners = [
    {
      playbook_file = "/workspace/ansible/playbook.yml"
      galaxy_file = "/workspace/ansible/requirements.yml"
      extra_arguments = ["-vv"]
      user = "packer"
    },
]
