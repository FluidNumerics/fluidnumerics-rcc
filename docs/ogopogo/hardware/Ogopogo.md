# Ogopogo

Ogopogo is the shared RCC operated and managed by Fluid Numerics and hosted in Google Cloud's `northamerica-northeast1` zone in Montreal, which is a zero carbon emissions datacenter. This documentation provides you with an up-to-date list of available compute and storage resources for Ogopogo.

!!! note "About the name"
    Cryptids, by definition, are creatures that have been claimed to exist but have never been *proven* to exist. Did you know a platypus was once considered a cryptid ? For the platypus to be not considered a cryptid, it had to be caught and put in zoos for others to see and experience. Cloud-HPC seems to be in this realm, where only a few have been able to observe this technological cryptid. Hence, we've given this cluster the name "Ogopogo", a cryptid lake monster reported to live in Lake Okanagan in Canada, that we have captured for you to see and experience this creature for yourself.


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


