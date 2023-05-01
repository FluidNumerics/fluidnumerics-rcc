# Repository Organization
The fluidnumerics-rcc repository contains scripts for building virtual machine images in addition to Terraform infrastructure as code (IAC). Additionally, we have procedures for creating new VM images and testing those images scripted as Cloud Build pipelines.

### Terraform scripts
The Terraform IAC is defined under the `tf/` directory, which has the following contents

```
tf/cluster
tf/etc
tf/ogopogo-a
```

The `cluster` subdirectory is a wrapper module that depends on our fork of the slurm-gcp modules (`fluidnumerics/slurm-gcp/tf`), our lustre modules (`fluidnumerics/lustre-gcp`), and other Terraform resources


* `tf/main.tf` - This main deployment file is meant to be used with [Google Cloud Service Catalog](https://cloud.google.com/service-catalog/docs), to create a click-to-deploy interface that has only the necessary customizable attributes. This file leverages `tf/prod/` as a module, but reduces the number of customizable attributes to make an easier to use click-to-deploy interface.
* `tf/variables.tf` - Defines the inputs for `tf/main.tf` and defines the Service Catalog form inputs.
* `tf/prod` - Defines the production version of the complete interface for creating the Slurm cluster and supporting resources.
* `tf/dev` - Defines experimental versions of the Terraform IAC which is used with the Cloud Build pipelines for testing.
