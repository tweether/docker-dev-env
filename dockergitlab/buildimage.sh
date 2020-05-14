# !/bin/bash

if [ $# != 2 ]
then
    echo "usage: build.sh [baseImageName] [imageName]"
    exit 1
fi

cp DockerfileTemplate Dockerfile
sed 's/dev_os:v4/"$1"/g' Dockerfile
docker build -t $2 .
rm Dockerfile -f