# !/bin/bash

if [ $# != 1 ]
then
    echo "usage: build.sh [imageName]"
    exit 1
fi

docker build -t $1 .
