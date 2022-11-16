# RCC Hardware

The Research Computing Cloud (RCC) is a cloud-native cluster hosted on Google Cloud Platform. Google Cloud offers a [variety of machine types](https://cloud.google.com/compute/docs/machine-types) available that can be easily integrated into the RCC at any time. In general, the architecture of the RCC consists of :

* Slurm Controller 
* Login Node(s)
* File System(s)
* Compute Nodes

The Controller, Login node(s), and File System(s) are referred to as "static" resources. We call them static since they are intended to be available 24/7.
The Compute Nodes are "ephemeral"; when jobs are submitted, the Slurm job scheduler executes calls to provision compute nodes on Google Cloud.


Login Node Group  | CPU Platform      | vCPU/node  | Memory (GB) |
----------------- | ----------------- | ---------- | ----------- |
l0                | AMD EPYC Rome     | 8          | 32          |



## Compute Nodes

The RCC Compute Nodes are organized into Slurm partitions. Each partition provides access to different CPU and GPU platforms. Within each partition, nodes are grouped into groups, which offers a variety of CPU-GPU-memory ratios.

When submitting jobs, you can use the `--partition` flag to select the different machine types. If you find you need to further restrict the job schedulers scope of resources to use for a job, you can use the `--nodelist` flag
At any time, you can run `sinfo` to see what partitions are available.

## File Systems

### Home NFS
The `/home` directory is hosted on a [Filestore](https://cloud.google.com/filestore) instance. This is done to allow the contents of the home directories to persist between re-deployments of the cluster's controller, login nodes, and compute partition definitions. The `/home` directory is mounted to all instances of the cluster (compute, controller, and login) over NFS connections. Users are encouraged to use `/home` directories for lightweight activities, such as text editing, code compiling, and some package installation.

Large job submissions that entail significant file IO (e.g. loading `conda` environments stored in `/home` with 1000s of tasks) can cause network bandwidth throttling and a "laggy" experience on the cluster for users.

### Lustre
Lustre filesystems can be attached to the cluster upon request and availability of funds. Provided funds availability, a Lustre filesystem can be attached during routine cluster maintenance.

#### Usage
To use the Lustre file system, simply submit jobs under your `/mnt/lustre/$(whoami)` directory, rather than using `/home`. If your application uses conda environments, we recommend that the environments are installed under your Lustre directory.

You can easily navigate to this directory using the provided `MYLUSTRE` environment variable, e.g.

```
cd $MYLUSTRE
```


