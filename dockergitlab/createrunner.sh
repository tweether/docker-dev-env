# !/bin/bash
#构建CI/CD环境

if [ $# != 3 ]
then
    echo "usage: build.sh [imageName] [runnerName] [url] [token]"
    exit 1
fi

docker create --name $2 --security-opt seccomp=unconfined --privileged=true "$1" /usr/sbin/init
docker start $2
docker exec -it $2 /usr/lib/gitlab-runner/gitlab-runner install -n "gitlab-runner" -u root
docker exec -it $2 /usr/lib/gitlab-runner/gitlab-runner register --non-interactive -u "$3" -r "$4" --name tweether --executor shell
docker exec -it $2 /usr/lib/gitlab-runner/gitlab-runner start