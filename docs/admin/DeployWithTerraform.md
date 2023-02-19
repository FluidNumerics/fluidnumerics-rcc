# Deploy the cluster with Terraform


## Directory Organization
The fluidnumerics-rcc repository contains scripts for building virtual machine images in addition to Terraform infrastructure as code (IAC). The Terraform IAC is defined under the `tf/` directory, which has the following contents

* `tf/main.tf` - This main deployment file is meant to be used with [Google Cloud Service Catalog](https://cloud.google.com/service-catalog/docs), to create a click-to-deploy interface that has only the necessary customizable attributes. This file leverages `tf/prod/` as a module, but reduces the number of customizable attributes to make an easier to use click-to-deploy interface.
* `tf/variables.tf` - Defines the inputs for `tf/main.tf` and defines the Service Catalog form inputs.
* `tf/prod` - Defines the production version of the complete interface for creating the Slurm cluster and supporting resources.
* `tf/dev` - Defines experimental versions of the Terraform IAC which is used with the Cloud Build pipelines for testing.

## Deploy the Catalog Solution via Terrafor
The catalog solution is configured to deploy a cluster with the following resources

* 2x [a2-highgpu-1g](https://cloud.google.com/compute/docs/accelerator-optimized-machines#a2-vms) Login Nodes
* 1x [n2d-standard-224](https://cloud.google.com/compute/docs/general-purpose-machines#n2d_machines) Slurm Controller
* 1x [Filestore](https://cloud.google.com/filestore) NFS Server (Configurable with standard, high scale, or enterprise tiers)
* A100 Compute Partition - Autoscaling, preemptible instances with variable 1-16 A100 GPUs/node
* T4 Compute Partition - Autoscaling, preemptible instances with variable 1-4 T4 GPUs/node
* N2 Compute Partition - Autoscaling, preemptible instances with variable 16-64 Intel CascadeLake vCPU/node

Although the cluster can be deployed through a click-to-deploy interface with the Google Cloud Service Catalog, you may find it more beneficial for your workflow to deploy with Terraform.

1. [Open a Cloud Shell in your web browser](https://shell.cloud.google.com?show=terminal).
2. Set your project using the `gcloud` sdk, replacing `<PROJECT-ID>` with your Google Cloud project ID.

		gcloud config set project <PROJECT-ID>

3. Clone the `fluidnumerics-rcc` repository

		git clone https://github.com/fluidnumerics/fluidnumerics-rcc ~/fluidnumerics-rcc

4. Navigate to the directory containing the Terraform IAC

		cd ~/fluidnumerics-rcc/tf

5. Create a file called `rcc.auto.tfvars` in a text editor and add the following definitions to customize your deployment

		project_id = "fluidnumerics-tpu"
		
		slurm_cluster_name = "myrcc"
		
		controller_machine_type = "n2d-standard-224"
		
		controller_disk_size_gb = 2048
		
		controller_disk_type = "pd-ssd"
		
		filestore_name = "rcc-fs"
		
		filestore_local_mount = "/mnt/filestore"
		
		filestore_capacity_gb = "10240"
		
		# Can be STANDARD, PREMIUM, BASIC_HDD, BASIC_SSD, HIGH_SCALE_SSD and ENTERPRISE
		filestore_tier = "HIGH_SCALE_SSD"

6. Initialize Terraform and validate your configuration

		terraform init
		terraform validate

7. Create a Terraform plan

		terraform plan -out=tfplan

8. Apply the plan to create your resources

		terraform apply "tfplan"


When you want to destroy all of the resources that have been created, you can run `terraform destroy` from the `~/fluidnumerics-rcc/tf/` directory.
