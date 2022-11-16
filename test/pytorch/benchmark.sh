#!/bin/bash


cwd=$(pwd)

# Create & activate the conda environment
conda create -y -n pytorch python=3.8
conda activate pytorch

# Install dependencies https://github.com/pytorch/benchmark#using-pre-built-packages
conda install -y pytorch torchtext torchvision cudatoolkit=11.3 -c pytorch-nightly

# Run simple test to verify pytorch+cuda is available
python pytorch_cuda_test.py

# Clone the benchmarks repository and run the tests
#git clone https://github.com/pytorch/benchmark /tmp/benchmark
#cd /tmp/benchmark
#python install.py
#python test.py


