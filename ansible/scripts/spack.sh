#!/bin/bash

# Prerequisites
INSTALL_ROOT="/opt"
SPACK_VERSION="v0.19.1"

COMPILERS=("gcc@11.3.0" "intel-oneapi-compilers@2022.2.1")
MPI="openmpi@4.1.2"

# Install prerequisites
yum install -y valgrind valgrind-devel
yum install -y gcc gcc-c++ gcc-gfortran git make wget patch

# Install spack package manager
git clone https://github.com/spack/spack ${INSTALL_ROOT}/spack
cd ${INSTALL_ROOT}/spack 
git checkout ${SPACK_VERSION}

source ${INSTALL_ROOT}/spack/share/spack/setup-env.sh
spack compiler find --scope site

# Set up spack packages defaults
cat <<EOT >> ${INSTALL_ROOT}/spack/etc/spack/packages.yaml
packages:
  cuda:
    buildable: false
    externals:
    - spec: cuda@11.8
      prefix: /usr/local/cuda
  openmpi:
    buildable: true
    version: 
    - 4.1.2
    variants: +cuda +cxx +cxx_exceptions +legacylaunchers +memchecker +pmi +static+vt +wrapper-rpath fabrics=auto schedulers=slurm
  slurm:
    buildable: false
    version: [22-5]
    externals:
    - spec: slurm@22-5
      prefix: /usr/local
EOT


# Install lmod and set up spack modules
cat <<EOT >>${INSTALL_ROOT}/spack/etc/spack/modules.yaml
modules:
  default:
    enable::
      - lmod
    lmod:
      core_compilers:
        - 'gcc@4.8.5'
      hierarchy:
        - mpi
      hash_length: 0
      all:
        environment:
          set:
            '{name}_ROOT': '{prefix}'
      projections:
        all:          '{name}/{version}'
EOT


# Install compilers and mpi flavors
for c in "${COMPILERS[@]}"
do
  spack install ${c}
  spack load ${c}
  spack compiler find --scope site
  if [[ "${c}" == *"intel"* ]]; then
    spack install --fail-fast $MPI % intel
  else
    spack install --fail-fast $MPI % ${c}
  fi
done
