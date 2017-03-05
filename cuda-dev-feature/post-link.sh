#!/usr/bin/env bash

# See: https://conda.io/docs/building/build-scripts.html

# We probably could be clever here and only tell the user if
# (the correct version) of nvcc is not there.

echo "
###############################
#
# The CUDA toolkit should be installed in this machine.
# If that is not the case, you can either:
#
#   - Use your system package manager.
#
#   - Use any suitable package from:
#     http://www.anaconda.org
#
#   - Install it from:
#     https://developer.nvidia.com/cuda-zone
#
###############################
" > ${PREFIX}/.messages.txt
