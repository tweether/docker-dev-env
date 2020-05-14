#!/bin/bash
#环境构建脚本

docker pull hallo-world:latest centos:7.5.1804

if [ $# != 2 ]
then
    echo "usage: build.sh [gitlab-runner url] [gitlab-runner token]"
    exit 1
fi

cd dockerbaseos
./build.sh base_os:v1
cd ../dockergitlab
./buildimage.sh base_os:v1 runner_os:v1
./createrunner.sh runner_os:v1 runner $1 $2
cd ..