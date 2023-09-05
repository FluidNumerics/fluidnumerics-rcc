# Run GPU Accelerated Applications

The RCC comes with the CUDA toolkit (/usr/local/cuda) and ROCm (/opt/rocm) preinstalled and configured to be in your default path. Currently, the RCC and Google Cloud Platform only offer Nvidia GPUs.

## Examples

### Multi-GPU (A100) with 1 MPI rank per GPU

When submitting jobs to run on multiple GPUs, you may find it necessary to bind MPI ranks to GPUs on the same node.

The example batch script below is configured to use the `a100x16` partition on the cluster and bind each MPI rank to each GPU on the node.

```
#!/bin/bash
#SBATCH --partition=a100x16 # Use the a100x16 partition
#SBATCH --ntasks=16 # Set the number of tasks to 16 (1 task = 1 MPI rank)
#SBATCH --cpus-per-task=1 
#SBATCH --gres=gpu:16

srun -n16 --accel-bind=gpu ./my-application
```
