#!/bin/bash

yum update -y
yum install -y boost-devel \
               centos-release-scl

yum-config-manager --enable rhel-server-rhscl-7-rpms

yum install -y devtoolset-7
