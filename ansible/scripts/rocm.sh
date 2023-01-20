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


# Add installation of amdclang with nvidia bitcodes
#git clone https://github.com/ROCm-Developer-Tools/aomp.git /tmp/aomp
#export AOMP_BUILD_CUDA=1
#export AOMP=/opt/rocm/aomp
#export AOMP_REPOS=/tmp/aomp
#export AOMP_APPLY_ROCM_PATCHES=0
#export TARBALL_INSTALL=1 
#export DISABLE_LLVMP_TESTS=1
#
#cd ${AOMP_REPOS}
#${AOMP_REPOS}/bin/build_prereq.sh
#${AOMP_REPOS}/bin/build_aomp.sh
