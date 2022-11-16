#!/bin/bash

# Prerequisites
PKGMGR=yum
INSTALL_ROOT="/opt/apps"
COMPILERS=("gcc@11.3.0")
#	   "intel-oneapi-compilers@2022.2.1")

# Install prerequisites
$PKGMGR install -y valgrind valgrind-devel
$PKGMGR install -y gcc gcc-c++ gcc-gfortran git make wget patch

pip3 install --upgrade google-cloud-storage google-api-python-client oauth2client google-cloud \
    	               cython pyyaml parse docopt jsonschema dictdiffer


# Install spack package manager
git clone https://github.com/spack/spack /opt/apps/spack
cd ${INSTALL_ROOT}/spack 
git checkout v0.18.1

echo "#!/bin/bash" > /etc/profile.d/z10_spack_environment.sh
echo "export SPACK_ROOT=${INSTALL_ROOT}/spack" >> /etc/profile.d/z10_spack_environment.sh
echo ". \${SPACK_ROOT}/share/spack/setup-env.sh" >> /etc/profile.d/z10_spack_environment.sh
source ${INSTALL_ROOT}/spack/share/spack/setup-env.sh

spack compiler find --scope site

# Move a packages.yaml file if its provided
if [[ -f "/tmp/packages.yaml" ]]; then
  echo "Moving packages.yaml into site location"
  mv /tmp/packages.yaml ${INSTALL_ROOT}/spack/etc/spack/packages.yaml
fi

for c in "${COMPILERS[@]}"
do
  spack install ${c}
  spack load ${c}
  spack compiler find --scope site
done

if [[ -f "${INSTALL_ROOT}/rcc/spack.yaml" ]]; then
  # Install packages specified in the spack environment
  cat ${INSTALL_ROOT}/rcc/spack.yaml
  spack env activate -d ${INSTALL_ROOT}/rcc/
  spack install --fail-fast --source
  spack gc -y
  spack env deactivate
  spack env activate --sh -d ${INSTALL_ROOT}/rcc/ >> /etc/profile.d/z10_spack_environment.sh 
fi

spack env activate -d ${INSTALL_ROOT}/rcc/
spack install 

cat <<EOT >> /etc/profile.d/z11_spack.sh
#!/bin/bash

source ${INSTALL_ROOT}/spack/share/spack/setup-env.sh
export PATH=\$PATH:${INSTALL_ROOT}/view/bin
export LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:${INSTALL_ROOT}/view/lib:${INSTALL_ROOT}/view/lib64

EOT

# Set up lmod environment modules

