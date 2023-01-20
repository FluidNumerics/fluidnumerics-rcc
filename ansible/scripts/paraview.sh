#!/bin/bash

# Install paraview
wget --output-document /tmp/paraview.tar.gz "https://www.paraview.org/paraview-downloads/download.php?submit=Download&version=v5.11&type=binary&os=Linux&downloadFile=ParaView-5.11.0-MPI-Linux-Python3.9-x86_64.tar.gz"

mkdir /opt/apps/paraview
tar -xvzf /tmp/paraview.tar.gz --directory /opt/apps/paraview --strip-components 1

cat > /etc/profile.d/z11_paraview.sh <<EOL
#!/bin/bash
export PATH=\${PATH}:/opt/apps/paraview/bin
export LD_LIBRARY_PATH=\${LD_LIBRARY_PATH}:/opt/apps/paraview/lib
EOL

# Enable GatewayPorts for Paraview reverse connections
sed -i 's/\#GatewayPorts no/GatewayPorts yes/g' /etc/ssh/sshd_config
