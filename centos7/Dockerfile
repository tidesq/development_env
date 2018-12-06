FROM centos:7.6.1810
LABEL authors="tidesq@163.com"


##########################
# 1. centos:7.6.1810
# 2. devtoolset-4
##########################

RUN yum clean all -y \
    && yum install  -y deltarpm \
    && yum install -y centos-release-scl-rh \
    && INSTALL_PKGS="devtoolset-7-gcc devtoolset-7-gcc-c++ devtoolset-7-gcc-gfortran devtoolset-7-gdb devtoolset-7-systemtap"  \
    && yum install -y --setopt=tsflags=nodocs $INSTALL_PKGS \
    && rpm -V $INSTALL_PKGS  \
    && yum clean all -y 


# Copy extra files to the image.
COPY ./root/ /

ENV HOME=/home/admin \
    PATH=/home/admin/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN mkdir -p ${HOME} && \
    groupadd -r admin -f -g 500 && \
    useradd -u 500 -g 500 -m -s /bin/bash admin && \
    chown -R 500:500 /home/admin /usr/bin/container-entrypoint /usr/bin/usage && \
    chmod u+x /usr/bin/usage 

USER 500

WORKDIR ${HOME}

# Enable the SCL for all bash scripts.
ENV BASH_ENV=/home/admin/bin/scl_enable \
    ENV=/home/admin/bin/scl_enable \
    PROMPT_COMMAND=". /home/admin/bin/scl_enable"

# Set the default CMD to print the usage of the language image
ENTRYPOINT ["container-entrypoint"]
CMD ["usage"]
    