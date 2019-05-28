#!/bin/bash
VER=3.6.5
source {{spack_path}}/share/spack/setup-env.sh
source $(spack location -i lmod)/lmod/lmod/init/bash

spack install python@$VER
spack install py-pip ^python@$VER

# spack install py-numpy ^python@3.6.5

spack load python@$VER
spack load py-pip ^python@$VER
spack load py-setuptools ^python@$VER


