#语法说明https://www.runoob.com/docker/docker-dockerfile.html
#基于centos镜像
FROM dev_os:v3

#维护人的信息
MAINTAINER dede <dengnianpeng@ztgame.com>

#开启22端口
EXPOSE 22

#配置启动脚本(非必须)
ADD run.sh /run.sh
RUN chmod 777 /run.sh && cp /run.sh /home/run.sh

#当启动容器时执行的脚本文件
ENTRYPOINT ["/run.sh"]
