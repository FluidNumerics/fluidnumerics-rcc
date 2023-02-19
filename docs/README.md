# Fluid Numerics' Research Computing Cloud

## What is the RCC
The Research Computing Cloud (RCC) is a cloud-native Research Computing cluster hosted on Google Cloud Platform. The cluster is configured to have a similar look-and-feel to other on-premises resources available at your organization. 

!!! note ""
    <center>**Our goal is to bring you scalable cloud-native computing with top tier support that alleviates additional system administration burdens and promotes productivity for researchers, scientists, and HPC-enthusiasts.**</center>


## Getting Access
There are a few ways in which you can use the RCC. It can be as simple as getting a fluidnumerics.cloud account and logging into our shared [Ogopogo cluster](hardware/Ogopogo.md). If you desire privacy and a cluster tailored to your organization's specific needs, we can customize a Slurm cluster to deploy in your projects on Google Cloud.

### Use the cluster deployed in our project
To use the shared RCC, you will need to [request a fluidnumerics.cloud account]([https://fluidnumerics.atlassian.net/servicedesk/customer/portal/9/group/55/create/157]). With a fluidnumerics.cloud account, we provide you with help desk services, system administration services, system documentation, and live user training. If you ever need specific compute resources, we can adjust the size, shape, and types of compute nodes during regular maintenance periods; however, [we tried to cover all the bases]()

Once you have an account, you will [need an allocation](). In some cases, you may not know how many CPU-hours, GPU-hours, or disk space you need for your project (and it's ok!) . With a [mentored sprint](https://www.fluidnumerics.com/products/mentored-sprints), we can help you port your application to our system and develop estimates for your allocation. Alternatively, you can [buy a startup allocation]() and follow our [porting best practices guide](start/porting-best-practices.md) to get yourself started.


Fluid Numerics' RCC is deployed in Google Cloud's `northamerica-northeast1` zone in Montreal, which is a [zero carbon emissions datacenter](https://cloud.google.com/sustainability/region-carbon#data)


### Customize and deploy in your project
Look, we get it. Sometimes you need privacy, don't want to wait in a queue, and really need a cluster tailored to your specific goals. Fluid Numerics can [create a self-service catalog solution]() or [fully manage a customized deployment]() in your project. 

!!!note "Get started"
    <center>**Reach out to [contracts@fluidnumerics.com](mailto:contracts@fluidnumerics.com) for pricing and a solution overview.**</center>

With this route, you manage compute, storage, and networking costs directly with Google or your current Google Cloud reseller. We will manage VM images, infrastructure-as-code, and tailored user documentation while also providing you with help desk services, system administration services, and user training on request.
