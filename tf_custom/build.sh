#!/usr/bin/env bash
export TF_DOCKER_BUILD_IS_DEVEL=NO
#export TF_DOCKER_BUILD_TYPE=CPU
export TF_DOCKER_BUILD_TYPE=GPU
export TF_DOCKER_BUILD_PYTHON_VERSION=PYTHON3
export TF_DOCKER_BUILD_IMAGE_NAME=pepope/tensorflow


export NIGHTLY_VERSION="1.head"
#export TF_DOCKER_BUILD_CENTRAL_PIP=$(echo ${TF_DOCKER_BUILD_PYTHON_VERSION} | sed s^PYTHON2^http://ci.tensorflow.org/view/Nightly/job/nightly-matrix-cpu/TF_BUILD_IS_OPT=OPT,TF_BUILD_IS_PIP=PIP,TF_BUILD_PYTHON_VERSION=${TF_DOCKER_BUILD_PYTHON_VERSION},label=cpu-slave/lastSuccessfulBuild/artifact/pip_test/whl/tensorflow-${NIGHTLY_VERSION}-cp27-cp27mu-manylinux1_x86_64.whl^ | sed s^PYTHON3^http://ci.tensorflow.org/view/Nightly/job/nightly-python35-linux-cpu/lastSuccessfulBuild/artifact/pip_test/whl/tensorflow-${NIGHTLY_VERSION}-cp35-cp35m-manylinux1_x86_64.whl^)

#TF and Python version hard coded
export TF_DOCKER_BUILD_CENTRAL_PIP="https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow_gpu-1.6.0-cp35-cp35m-linux_x86_64.whl"

./parameterized_docker_build.sh
