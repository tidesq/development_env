FROM centos:7.6.1810
LABEL authors="tidesq@163.com"


##########################
# 1. centos:7.6.1810
# 2. devtoolset-4
##########################
RUN groupadd -g 500 admin \
    && useradd -u 500 -g 500 -m -s /bin/bash admin \
    && chmod 0755 /home/admin \
    && chown -R admin:admin /home/admin \
    && yum install -y centos-release-scl \
    && yum install -y devtoolset-4 \
    && scl enable devtoolset-4 bash \