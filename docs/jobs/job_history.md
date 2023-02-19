# Slurm job history

For one reason or another, you may find that you need to obtain detailed information about currently running jobs or jobs that have already completed. This documentation will show you how to use Slurm's command line utilities to obtain such information.


## Listing jobs

To list jobs that are currently running on the cluster, you can use the `squeue` command. 

```
squeue
```

!!! note
    You can convert the output of `squeue` to YAML format, by simply adding the `--yaml` flag

By default this will show jobs listed for all users on the cluster and with the following information

* `JOBID` - The ID assigned to the job by the Slurm workload manager / job scheduler
* `PARTITION` - The compute partition the job was submitted to
* `NAME` - The name assigned to the job by the user who submitted the job; If a job name was not provided, batch jobs will default to the name of the script.
* `USER` - The POSIX username for the user who submitted the job
* `ST` - The job status
* `TIME` - The amount of time that has elapsed in the current status
* `NODES` - The compute nodes (VMs) assigned to the job
* `NODELIST(REASON)` - Any reason for the current status. This is usually empty, unless a job failed to start or was interrupted due to preemption or other node failure.

Slurm jobs have a status code (the `ST` column) associated with them which change during the lifespan of the job

* `CF` - The job is in a configuring state. Typically this state is seen when autoscaling compute nodes are being provisioned to execute work.
* `PD` - The job is in a pending state. 
* `R` - The job is in a running state.
* `CG` - The job is in a completing state and the associated compute resources are being cleaned up.
* `(Resources)` - There are insufficient resources available to schedule your job at the moment. 

You can filter the results of `squeue` by the partition, user, job state, compute nodes, and more; examples are given below

!!! note
    You can see a full list of `squeue` filter options by running `squeue --help`

### Filter by Partition
To list jobs that are running on a specific partition, you can use, the `--partition` flag.

```
squeue --partition=a1g80
```

The above example will show all jobs running in the `a1g80` partition. 

!!! note
    If you need to find a list of partitions, you can run the `sinfo` command


### Filter by User
To list jobs that only you are currently running, you can filter by user and use the output of `whoami` to automatically populate the `--user` flag with your username

```
squeue --user=$(whoami)
```

### Filter by Compute Nodes
To list jobs on a specific set of compute nodes, you can use the `--nodelist` flag.

```
squeue --nodelist=rcc-a1g80-sm-[0-10],rcc-a1g80p-sm-[0-10]
```

The example above will only show jobs running on the nodes `rcc-a1g80-sm-[0-10]` and `rcc-a1g80p-sm-[0-10]`. 


### Show all jobs
By default, `squeue` will only show jobs in pending and running states. To show all jobs, including those that have already completed, you can add the `--states=all` flag, e.g.

```
squeue --user=$(whoami) --partition=a1g80 --states=all
```
This example will show all jobs you have run and are currently running in the `a1g80` partition.


## Getting detailed job information
Slurm's database also keeps record of detailed information about jobs including time elapsed, max memory used, and exit codes. You can easily access this information using Slurms `sacct` command line interface

```
sacct
```
!!! note
    You can convert the output of `sacct` to YAML format, by simply adding the `--yaml` flag
    You can convert the output of `sacct` to JSON format, by simply adding the `--json` flag

By default, `sacct` will return only your jobs for the current day and includes the following information

* `JobID` - The ID assigned to the job by the Slurm workload manager / job scheduler
* `JobName` - The name assigned to the job by the user who submitted the job; If a job name was not provided, batch jobs will default to the name of the script.
* `Partition` - The Slurm partition the job was submitted to
* `Account` - The Slurm account (if applicable) used to run the job
* `AllocCPUS` - The number of CPUs allocated to the job
* `State` - Current state of the job (similar to `squeue` output)
* `ExitCode` - Exit code of the job / batch script.


!!! note
    You can obtain even more information from `sacct` by using the `--long` flag. See `sacct --help` for more details 


