#!/bin/bash

yum install -y epel-release devtoolset-7 cmake

cat > /etc/yum.repos.d/rocm.repo <<EOL
[rocm]
name=rocm
baseurl=https://repo.radeon.com/rocm/yum/rpm
enabled=1
gpgcheck=1
gpgkey=https://repo.radeon.com/rocm/rocm.gpg.key
EOL

cat > /etc/yum.repos.d/amdgpu.repo <<EOL
[amdgpu]
name=amdgpu
baseurl=https://repo.radeon.com/amdgpu/latest/rhel/7.9/main/x86_64
enabled=1
gpgcheck=1
gpgkey=https://repo.radeon.com/rocm/rocm.gpg.key
EOL

yum clean all -y
yum update -y
yum install -y rocm-hip-sdk

cat > /etc/profile.d/z11_rocm.sh <<EOL
#!/bin/bash
export PATH=\${PATH}:/opt/rocm/bin
export LD_LIBRARY_PATH=\${LD_LIBRARY_PATH}:/opt/rocm/lib:/opt/rocm/lib64
EOL



## Install cmake
#mkdir /tmp/cmake
#cd /tmp/cmake
#wget https://github.com/Kitware/CMake/releases/download/v3.16.8/cmake-3.16.8.tar.gz
#tar -xvzf cmake-3.16.8.tar.gz
#cd cmake-3.16.8
#./bootstrap --prefix=/usr/local/cmake
#make
#make install
#
## Add installation of amdclang with nvidia bitcodes
#scl enable devtoolset-7 bash
#git clone https://github.com/ROCm-Developer-Tools/aomp.git /tmp/aomp
#export AOMP_BUILD_CUDA=1
#export AOMP=/opt/rocm/aomp
#export AOMP_REPOS=/tmp/
#export AOMP_APPLY_ROCM_PATCHES=0
#export TARBALL_INSTALL=1 
#export DISABLE_LLVMP_TESTS=1
#
#cd ${AOMP_REPOS}/aomp
#$AOMP_REPOS/aomp/bin/clone_aomp.sh
#$AOMP_REPOS/aomp/bin/build_prereq.sh
#$AOMP_REPOS/aomp/bin/build_aomp.sh
