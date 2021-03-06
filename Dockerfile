FROM centos:latest
LABEL description="LILAC development environment"

RUN yum install -y curl
RUN yum upgrade -y
RUN yum update -y
RUN yum clean all
RUN yum -y install wget bzip2 gcc gcc-c++ gcc-gfortran mpich-devel make git
ENV PATH="/usr/lib64/mpich/bin:${PATH}"

WORKDIR /usr/src/lilac/

RUN mkdir -p external
RUN mkdir -p ci

COPY external/esmf external/esmf
COPY external/pfunit external/pfunit
COPY ci/* ci/

# Install some remaining dependencies
ENV PATH /usr/local/miniconda/bin:$PATH
RUN ./ci/install_python.sh

# Install ESMF
RUN ./ci/install_esmf.sh
ENV ESMF_CONFIG_FILE /usr/local/lib/esmf.mk

# Install PFUNIT
# RUN ./ci/install_pfunit.sh
# ENV PFUNIT_INSTALL /usr/pfunit
