#!/bin/bash
#

stringname="$1"
adduser $stringname
echo "root" | passwd --stdin root
echo "$1" | passwd --stdin "$1"

function mvhome(){
    if [ $# != 1 ]
    then
        exit 1
    fi
    echo "$1"
    chown $stringname /opt/dockerdata
    usermod -d /opt/dockerdata -u "$1" "$stringname"
}

stringid="aaa"
stringid=`id "$stringname" | sed "s/uid=//" | sed "s/(.*).*(.*).*(.*)//"`
mvhome $stringid

cd /opt/dockerdata
cp /etc/skel/.bash_logout  .
cp /etc/skel/.bash_profile .
cp /etc/skel/.bashrc       .
chown $stringname .bash_logout
chown $stringname .bash_profile
chown $stringname .bashrc
mkdir .ssh
chown $stringname .ssh
