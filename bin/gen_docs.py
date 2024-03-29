#!/usr/bin/env python3

import subprocess
import yaml
import shlex
import os


# Get the path to this repo's bin/ directory
binpath = '/'.join(os.path.abspath(__file__).split('/')[:-1])+'/'
claat = os.getenv('HOME')+"/go/bin/claat"

with open(binpath+'../codelabs.yaml','r') as f:
    codelabs = yaml.safe_load(f)

# Generate the documents
os.chdir(binpath+'../docs/codelabs')
for cl in codelabs['codelabs']:
    cmd = claat+" export "+cl['gdoc']
    subprocess.run(shlex.split(cmd))
