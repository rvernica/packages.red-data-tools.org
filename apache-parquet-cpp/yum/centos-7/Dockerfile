FROM centos:7

ARG DEBUG

RUN \
  quiet=$([ "${DEBUG}" = "yes" ] || echo "--quiet") && \
  yum update -y ${quiet} && \
  yum install -y ${quiet} epel-release && \
  yum groupinstall -y ${quiet} "Development Tools" && \
  yum install -y ${quiet} \
    boost-devel \
    cmake3 \
    git \
    openssl-devel \
    rpm-build \
    rpmdevtools && \
  yum clean ${quiet} all
