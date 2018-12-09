FROM centos:7.6.1810
LABEL authors="tidesq@163.com"


##########################
# 1. centos:7.6.1810
# 2. devtoolset-4
##########################

# Copy extra files to the image.
COPY ./root/ /

RUN groupadd -r admin -f -g 500 \
    && useradd -u 500 -g 500 -m -s /bin/bash admin \
    && chown -R 500:500 /home/admin /usr/bin/container-entrypoint /usr/bin/usage \
    && chmod u+x /usr/bin/usage \
    && yum clean all -y \
    && yum install  -y deltarpm \
    && yum install -y centos-release-scl \
    && INSTALL_PKGS="devtoolset-7-gcc devtoolset-7-gcc-c++ devtoolset-7-gcc-gfortran sudo yum install llvm-toolset-7 devtoolset-7-gdb devtoolset-7-binutils devtoolset-7-systemtap"  \
    && yum install -y --setopt=tsflags=nodocs $INSTALL_PKGS \
    && rpm -V $INSTALL_PKGS  \
    && yum install  -y sudo \
    && yum install -y gperftools-devel \
    && yum install -y perf \
    && yum install -y cmake \
    && yum install -y epel-release \
    && yum install -y git \
    && yum install -y gflags-devel \
    && yum install -y openssl-devel \
    && yum install -y bazel \
    && yum install -y wget \
    && yum install -y autoconf \
    && yum install -y automake \
    && yum install -y libtool \
    && yum clean all -y 


ENV HOME=/home/admin \
    PATH=/home/admin/bin:/opt/rh/devtoolset-7/root/usr/bin/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin



USER 500

WORKDIR ${HOME}

# Enable the SCL for all bash scripts.
ENV BASH_ENV=/home/admin/bin/scl_enable \
    ENV=/home/admin/bin/scl_enable \
    PROMPT_COMMAND=". /home/admin/bin/scl_enable"

# Set the default CMD to print the usage of the language image
ENTRYPOINT ["container-entrypoint"]
CMD ["usage"]
    