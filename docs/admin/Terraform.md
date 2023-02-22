# Deploy the cluster with Terraform

Fluid Numerics manages cloud infrastructure using [Terraform](https://www.terraform.io/) infrastructure-as-code. The login nodes, controller, and compute nodes are handled by our fork of [slurm-gcp](https://github.com/fluidnumerics/slurm-gcp). Optional Lustre file systems are handled by our [lustre-gcp_terraform](https://github.com/FluidNumerics/lustre-gcp_terraform) modules. Optional NFS storage is brought in through the [Filestore resource](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/filestore_instance) and a Cloud SQL hosted Slurm database is brought in through a few terraform resources to create a Cloud SQL instance.

Production versions of the cluster host the terraform state information in Google Cloud Storage so that our team can have a consistent view of the deployed infrastructure

## Deployment Workflow

### Production System Management

The production deployment of Ogopogo is defined in the `tf/ogopogo-a` directory, which contains

* `main.tf` - The main terraform file that optionally creates Lustre and Filestore file systems and the cluster (using the `tf/cluster` wrapper module)
* `variables.tf` - Definitions of input and output variables
* `rcc.auto.tfvars` - Concretizations that define the specific deployment for Ogopogo

!!! warning 
    You will not be able to make changes to the production, unless you are granted time-limited admin access to the project hosting the cluster.

The production system is updated only during scheduled maintenance windows and when sufficient feature upgrades and system patches are ready for deployment. Changes made to the cluster are motivated by user support requests and system administrator reports. In general, this updates involve the following steps

1. Virtual Machine Images containing OS updates or new software packages are baked and tested in private test deployments (defined in `tf/ogopogo-b`) on a branch off of `main` branch of the `fluidnumerics-rcc` repository.
2. Changes to the Terraform IAC are implemented and tested in private test deployments (defined in `tf/ogopogo-b`) on a branch off the `main` branch of the `fluidnumerics-rcc` repository.
3. Pull requests are issued to the main branch to encourage team review of the changes that are made.
4. Before the scheduled maintenance period, the new version of `main` is tagged for release, which triggers an automated build of a new VM image for the cluster. 
5. This image is deployed in a new test cluster in a separate project for administrator team review. i
6. Once the team reviews and approves this test cluster, the changes are carried into `ogopogo-a` and a terraform plan is generated for review by system administrators and a cloud architect.
7. Once the deployment is approved, the cluster is updated, replacing the controller and login nodes in the process. System adminsitrators verify functionality of the cluster before returning access to users.

!!! note
    All testing is done in a Google Cloud project separate from the production Google Cloud project

