# RCC Infrastructure


## Slurm Database
The Slurm database for the rcc-live cluster is hosted on Cloud SQL on Google Cloud. Hosting the Slurm database here allows us to easily keep track of cluster usage through other tools like LookerStudio and Grafana. Additionally, this removes some of the compute and storage load on the controller instance. 

### Setup procedures
This section of the documentation shows how to use CloudSQL to host the Slurm database.

#### Terraform configurations

#### Update the slurm user password
When deploying the CloudSQL instance to host the slurm database, the controller instance startup script will create a SQL account for the `slurm` user and the password by default is set to `changeme`. After deploying the cluster and verifying that the cluster was provisioned properly, you will need to change the password for the Slurm user. This involves changing the password from the CloudSQL UI, updating the `slurmdbd.conf` file, and restarting the `slurmdbd` service on the controller.


#### Visualizing data with LookerStudio

To visualize Slurm usage data with LookerStudio, you will need to create an additional account on the CloudSQL instance and configure the LookerStudio to connect to your CloudSQL instance.

https://support.google.com/looker-studio/answer/7020436?hl=en#zippy=%2Cin-this-article

## Grafana dashboard for Slurm
To do :) 




