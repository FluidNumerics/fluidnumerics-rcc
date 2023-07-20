#!/bin/bash

yum update -y
yum install -y boost-devel \
               centos-release-scl

yum-config-manager --enable rhel-server-rhscl-7-rpms

yum install -y devtoolset-7

rpm --import https://packages.microsoft.com/keys/microsoft.asc
sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

yum install -y code

# Install miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/miniconda.sh
/bin/bash /tmp/miniconda.sh -b -p /app/miniconda

cat <<EOT >> /etc/profile.d/z11_miniconda.sh
#!/bin/bash

source /app/miniconda/bin/activate > /dev/null
conda init > /dev/null

EOT

source /app/miniconda/bin/activate