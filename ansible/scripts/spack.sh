#!/bin/bash

# Prerequisites
INSTALL_ROOT="/opt/apps"
SPACK_VERSION="v0.19.1"
SYSTEM_COMPILER="gcc@4.8.5"
COMPILERS=("gcc@9.5.0" "gcc@11.3.0" "gcc@12.1.0" "intel-oneapi-compilers@2022.2.1")
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
  if [[ "${c}" == *"intel"* ]]; then
    spack install ${c} % ${SYSTEM_COMPILER}
    spack load ${c}
    spack compiler find --scope site
    echo "Not installing MPI flavor with Intel OneAPI"
  elif [[ "${c}" == *"gcc"* ]]; then
    spack install ${c} +nvptx % ${SYSTEM_COMPILER}
    spack load ${c}
    spack compiler find --scope site
    spack install --fail-fast $MPI % ${c}
  fi
done

# Set up module files
spack module lmod refresh --delete-tree -y
cat > /etc/profile.d/z12_lmod.sh << EOL
#!/bin/bash

module unuse /opt/apps/modulefiles
module use /opt/apps/spack/share/spack/lmod/linux-centos7-x86_64/Core/
EOL
