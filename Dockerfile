FROM registry.cn-shenzhen.aliyuncs.com/ssxs-docker/ssxs-repo/ssxs-centos7:1

MAINTAINER Base Image Jdk8 <haixiang.dai@ssxingshou.com>

RUN yum update -y

RUN cd /tmp

#这里还是要从外网或者服务器的某个地址去下载，太大了
COPY jdk-8u212-linux-x64.rpm /tmp/jdk-8u212-linux-x64.rpm

RUN rpm -ivh /tmp/jdk-8u212-linux-x64.rpm
RUN rm -f /tmp/jdk-8u212-linux-x64.rpm
	
# 设置JAVA变量环境
ENV JAVA_HOME=/usr/java/default
ENV CLASSPATH=.:$JAVA_HOME/jre/lib/rt.jar:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
ENV PATH=$PATH:$JAVA_HOME/bin

# Define default command.
CMD ["bash"]
