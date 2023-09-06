# Deploy Singularity(Apptainer) and Docker Containers

Containers are becoming a popular tool in research computing to enhance application portability and research reproducibility. [Apptainer](https://apptainer.org/) (formerly Singularity) is an open-source secure container platform intended for high performance computing and research computing.

The Research Computing Cluster (RCC) comes with Singularity pre-installed and can be used to run Docker and Singularity containers. We encourage you to use [Google Cloud Build](https://cloud.google.com/build) to support continuous integration and containerization of your application, [Google Container Registry](https://cloud.google.com/container-registry) to host a private Docker registry, and [Google Cloud Storage](https://cloud.google.com/storage) to host Singularity images. However, you can still follow this guide if your images are hosted elsewhere.


This documentation will walk through how to deploy containers on the RCC.

## Deploy a Docker Image

### Using Docker
Docker images can be added to your local docker image registry on the RCC by simply running

```
docker pull IMAGE
```

You can run commands within docker images using `docker run`.

### Using Apptainer

Apptainer can be used to deploy a Docker image from a public or private registry. This is usually done by converting a Docker image to a Singularity image using `singularity pull` and running with `singularity exec`. When using a private registry, it is easiest to use [Google Container Registry](https://cloud.google.com/container-registry).

For other private registries, see [Making use of private images](https://singularity.hpcng.org/user-docs/master/singularity_and_docker.html#making-use-of-private-images-from-docker-hub).

To convert a Docker image to a Singularity image, use `apptainer pull`.

```
apptainer pull docker://docker-image ${HOME}/IMAGE-NAME.sif 
```

After you've converted your Docker image to a Singularity image, you can deploy a Singularity container using `apptainer exec`.

```
apptainer exec ${HOME}/IMAGE-NAME.sif COMMAND
```
Any `COMMAND` specified at the end of the `apptainer exec` call will be run from within the Singularity container.

By default, the Singularity container will mount a number of directories, including `/home` and `/tmp`. This allows you to have read/write access to your home directory from within the container. If you need to mount any other directories, you can use the `--bind` flag.

```
apptainer exec --bind /path/to/host/directory:/path/to/container/mount ${HOME}/IMAGE-NAME.sif COMMAND
```

The `--bind` flag expects to be given two arguments, separated by a colon `:`. The first argument is the path on the cluster that you want to mount to the container and the second argument is the path to mount this directory to within the container. For more information on this topic, see [Bind Paths and Mounts in the Singularity documentation](https://apptainer.hpcng.org/user-docs/master/bind_paths_and_mounts.html).

For more information on using Singularity to work with Docker images, see [Support for Docker and OCI Singularity documentation](https://apptainer.hpcng.org/user-docs/master/apptainer_and_docker.html).


## Deploy a Singularity Image from Cloud Storage

When building Singularity images with Google Cloud build, the Singularity image files are treated as artifacts, which are posted to Google Cloud Storage. You can read more about build artifacts on the [Google Cloud Build Artifacts documentation](https://cloud.google.com/build/docs/building/store-build-artifacts) and how to create Singularity images with Google Cloud Build from [this community tutorial](https://cloud.google.com/community/tutorials/apptainer-containers-with-cloud-build).

The directions given below assume that you are logged in to your cluster's login node and that you have your Singularity image hosted in Google Cloud Storage. 

To copy your Singularity image to the cluster, you can use the `gsutil` command.

```
gsutil cp gs://YOUR-GCS-BUCKET/PATH/TO/IMAGE-NAME.sif ${HOME}/IMAGE-NAME.sif 
```

After you've copied your Singularity image onto the cluster, you can deploy a Singularity container using `apptainer exec`.

```
apptainer exec ${HOME}/IMAGE-NAME.sif
```

By default, the Singularity container will mount a number of directories, including `/home` and `/tmp`. This allows you to have read/write access to your home directory from within the container. If you need to mount any other directories, you can use the `--bind` flag.

```
apptainer exec --bind /path/to/host/directory:/path/to/container/mount ${HOME}/IMAGE-NAME.sif
```

The `--bind` flag expects to be given two arguments, separated by a colon `:`. The first argument is the path on the cluster that you want to mount to the container and the second argument is the path to mount this directory to within the container. For more information on this topic, see [Bind Paths and Mounts in the Singularity documentation](https://apptainer.hpcng.org/user-docs/master/bind_paths_and_mounts.html).


## Use GPUs with your container

Singularity supports deploying containers that use Nvidia's CUDA or AMD's ROCm solutions. Currently, on Google Cloud, and by extension the RCC, only Nvidia GPU's are available.

You can easily expose a GPU and the host system's drivers to the container using the `--nv` flag.

The example below shows how to deploy a Singularity container image with GPU support.

```
apptainer --nv exec --bind /path/to/host/directory:/path/to/container/mount ${HOME}/IMAGE-NAME.sif
```

Alternatively, you can deploy a Docker container with GPU support using

```
docker run -it --gpus all IMAGE [COMMAND]
```


In order to use the `--nv` flag (apptainer) or the `--gpus` flag (docker), you need to make sure the following conditions are met

* Your application is built in your container using a CUDA version that matches the RCC's CUDA version ( 11.8.0 )
* Your application is built in your container to target a GPU with the appropriate device capability.


The latter requirement is met by using the appropriate compiler flag with `nvcc` or `GPU_TARGET` environment variable with `hipcc` or `hipfc`.

When building applications with `nvcc`, use the `-arch=sm_XX` flag (replacing `XX` with the appropriate device capability). A table of the GPU models and corresponding device capabilities is given below.

| GPU Model                   | Device Capability   |
| --------------------------- | ------------------- | 
| Nvidia Tesla K80 (Kepler)   | sm_30, sm_35, sm_37 |
| Nvidia Tesla P100 (Pascal)  | sm_60, sm_61, sm_62 |
| Nvidia Tesla P4 (Pascal)    | sm_60, sm_61, sm_62 |
| Nvidia Tesla T4 (Turing)    | sm_75               |
| Nvidia Tesla V100 (Volta)   | sm_70, sm_72        |
| Nvidia Tesla A100 (Ampere)  | sm_80, sm_86        |


## Further Reading

* [Singularity Documentation](https://singularity.hpcng.org/user-docs/master/)
* [Using GPUs with Singularity Containers](https://singularity.hpcng.org/user-docs/master/gpu.html)
* [Using MPI with Singularity Containers](https://singularity.hpcng.org/user-docs/master/mpi.html)

