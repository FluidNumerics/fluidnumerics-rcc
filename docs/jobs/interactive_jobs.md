# Submit Interactive Jobs
The interactive workflows described here use a combination of salloc and srun command line interfaces. 

For all interactive workflows, you should be aware that you are charged for each second of allocated compute resources. It is best practice to set a wall-time when allocating resources. This helps avoid situations where you will be billed for idle resources you have reserved.

## Start a bash shell on a compute node
The easiest way to start an interactive session on a compute node is to use Slurm's `srun` command to start a shell. 

As an example, you can reserve 1 hour of exclusive access to a single node in the default slurm partition.
```
srun --time=1:00:00 -N1 --exclusive --pty /bin/bash
```
In this example, the `-N1` flag reserves a whole node and the `--exclusive` flag ensures you have exclusive access to the node.

If you would like to reserve a multi-GPU node (e.g. 8x A100 GPUs), set the `--partition` to a compute partition containing the appropriate resources and use the `--gres` flag to enable access to the GPUs on the associated nodes.
```
srun --time=1:00:00 -N1  --exclusive --partition=a100x8 --gres=gpu:8 --pty /bin/bash
```
