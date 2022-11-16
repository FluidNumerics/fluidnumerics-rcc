#!/bin/bash


# Install miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/miniconda.sh
/bin/bash /tmp/miniconda.sh -b -p /app/miniconda

cat <<EOT >> /etc/profile.d/z11_miniconda.sh
#!/bin/bash

source /app/miniconda/bin/activate > /dev/null
conda init > /dev/null

EOT

