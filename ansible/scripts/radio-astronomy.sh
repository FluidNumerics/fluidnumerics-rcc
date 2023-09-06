#!/bin/bash

# Prerequisites
INSTALL_ROOT="/opt/apps"
SYSTEM_COMPILER="gcc@4.8.5"
COMPILERS=("gcc@12.1.0")
MPI="openmpi@4.1.2"


source ${INSTALL_ROOT}/spack/share/spack/setup-env.sh
spack compiler find --scope site

spack install catch2 % rocmcc

spack install casacore % gcc@12.1.0
