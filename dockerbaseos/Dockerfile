#语法说明https://www.runoob.com/docker/docker-dockerfile.html
#基于centos镜像
FROM centos:7.5.1804

#维护人的信息
MAINTAINER dede <dengnianpeng@ztgame.com>

#开启22端口
EXPOSE 22

#配置源环境
RUN yum install centos-release-scl epel-release wget https://centos7.iuscommunity.org/ius-release.rpm -y

#替换源地址
RUN wget http://mirrors.aliyun.com/repo/Centos-7.repo &&\
wget https://mirrors.aliyun.com/repo/epel-7.repo &&\
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.bak &&\
mv /etc/yum.repos.d/epel.repo /etc/yum.repos.d/epel.repo.bak &&\
cp Centos-7.repo /etc/yum.repos.d/CentOS-Base.repo &&\
cp epel-7.repo /etc/yum.repos.d/epel.repo

#更新源信息
#RUN yum clean all && yum makecache

#安装软件包
RUN yum install gcc gcc-c++ make gdb valgrind git216 cmake3 -y &&\
yum install MariaDB mariadb-devel mariadb-libs rh-redis5 openssl openssh openssh-server openssh-clients -y

RUN yum install libiconv libuuid libuuid-devel libunwind libunwind-devel lcov cppcheck -y &&\
yum install passwd tmux htop bzip2 net-tools vim -y &&\
ln -s /bin/cmake3 /bin/cmake && ln -s /bin/ctest3 /bin/ctest && ln -s /bin/pip3 /bin/pip &&\
pip3 install conan cpplint &&\
sed 's/GSSAPIAuthentication yes/GSSAPIAuthentication no/g' /etc/ssh/sshd_config

#gcc7.5编译安装
RUN wget http://mirror.hust.edu.cn/gnu/gcc/gcc-7.5.0/gcc-7.5.0.tar.gz &&\
tar xzf gcc-7.5.0.tar.gz &&\
cd gcc-7.5.0/ &&\
./contrib/download_prerequisites &&\
mkdir build &&\
cd build/ &&\
../configure  --enable-checking=release --enable-languages=c,c++ --disable-multilib &&\
make -j8 && make install &&\
cp /usr/local/lib64/libstdc++.so.6.0.24 /usr/lib64/ &&\
rm /usr/lib64/libstdc++.so.6 -y &&\
ln -s /usr/lib64/libstdc++.so.6.0.24 /usr/lib64/libstdc++.so.6

#配置启动脚本(非必须)
#ADD run.sh /run.sh
#RUN chmod 777 /run.sh && cp /run.sh /home/run.sh

#当启动容器时执行的脚本文件
#ENTRYPOINT ["/run.sh"]
